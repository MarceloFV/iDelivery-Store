import 'package:delivery_store/app/data/model/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/request/controllers/request_controller.dart';

class RequestView extends GetView<RequestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RequestView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView(
            children: controller.requestList.value
                .map((mod) => RequestCard(
                      model: mod,
                    ))
                .toList(),
          )),
    );
  }
}

class RequestCard extends StatelessWidget {
  final RequestModel model;

  const RequestCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.user.name),
    );
  }
}
