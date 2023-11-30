import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:graph_ql_demo/controllers/list_controller.dart";
import "package:graph_ql_demo/models/get_all_char.dart";
import "package:graph_ql_demo/services/graph_ql_client_service.dart";
import "package:graph_ql_demo/utils/app_routes.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // ignore: unused_field
  final ListController _controller = Get.find();

  final GraphQLClientService _instance = GraphQLClientService.instance;

  final PagingController<int, Results> _pagingController =
      PagingController<int, Results>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL Demo - List"),
      ),
      body: SafeArea(
        child: pagedListView(),
      ),
    );
  }

  Widget pagedListView() {
    return PagedListView<int, Results>(
      shrinkWrap: true,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Results>(
        itemBuilder: (BuildContext context, Results item, int index) {
          return pagedListViewAdapter(item: item);
        },
      ),
    );
  }

  Widget pagedListViewAdapter({required Results item}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.image ?? ""),
          backgroundColor: Colors.transparent,
        ),
        title: Text(item.name ?? ""),
        subtitle: Text("ID: ${item.id ?? ""}"),
        trailing: const Icon(Icons.arrow_circle_right_outlined),
        onTap: () async {
          await navigate(item: item);
        },
      ),
    );
  }

  Future<void> navigate({required Results item}) async {
    await Get.toNamed(AppRoutes.instance.detailsScreen, arguments: item.id);
    return Future<void>.value();
  }

  Future<void> _fetchPage(int page) async {
    try {
      final GetAllChar getAllChar = await _instance.getAllCharAPI(page: page);
      List<Results> resultList = <Results>[];
      resultList = getAllChar.characters?.results ?? <Results>[];
      resultList.length < 10
          ? _pagingController.appendLastPage(resultList)
          : _pagingController.appendPage(resultList, page + 1);
    } on Exception catch (error) {
      _pagingController.error = error;
    }
    return Future<void>.value();
  }
}
