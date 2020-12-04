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
      body: Obx(() {
        return Container();
      }),
    );
  }
}
