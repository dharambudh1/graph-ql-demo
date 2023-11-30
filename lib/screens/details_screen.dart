import "dart:async";

import "package:after_layout/after_layout.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:graph_ql_demo/controllers/details_controller.dart";
import "package:graph_ql_demo/models/get_a_char.dart";
import "package:graph_ql_demo/services/graph_ql_client_service.dart";

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with AfterLayoutMixin<DetailsScreen> {
  final DetailsController _controller = Get.find();

  final GraphQLClientService _instance = GraphQLClientService.instance;

  @override
  void initState() {
    super.initState();
    _controller.id = Get.arguments;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL Demo - Details"),
      ),
      body: SafeArea(
        child: mainWidget(),
      ),
    );
  }

  Widget mainWidget() {
    return Obx(
      () {
        return Center(
          child: mapEquals(
            _controller.getAChar.toJson(),
            <String, void>{"__typename": null},
          )
              ? loadWidget()
              : infoWidget(),
        );
      },
    );
  }

  Widget loadWidget() {
    return const CircularProgressIndicator();
  }

  Widget infoWidget() {
    final Character item = _controller.getAChar.character ?? Character();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(item.image ?? ""),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 8),
        Text("id: ${item.id ?? ""}"),
        const SizedBox(height: 8),
        Text("name: ${item.name ?? ""}"),
        const SizedBox(height: 8),
        Text("status: ${item.status ?? ""}"),
        const SizedBox(height: 8),
        Text("species: ${item.species ?? ""}"),
        const SizedBox(height: 8),
        Text("type: ${item.type ?? ""}"),
        const SizedBox(height: 8),
        Text("gender: ${item.gender ?? ""}"),
        const SizedBox(height: 8),
        Text("created: ${item.created ?? ""}"),
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final GetAChar getAChar = await _instance.getACharAPI(id: _controller.id);
    _controller.getAChar = getAChar;
    return Future<void>.value();
  }
}
