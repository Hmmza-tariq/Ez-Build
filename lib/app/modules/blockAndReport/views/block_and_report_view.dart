import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/block_and_report_controller.dart';

class BlockAndReportView extends GetView<BlockAndReportController> {
  const BlockAndReportView({super.key});
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Block / Report a User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                cursorColor: color,
                decoration: InputDecoration(
                    labelText: 'User ID',
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color))),
                onChanged: (value) {
                  // Update the controller with the entered user ID
                },
              ),
              TextFormField(
                cursorColor: color,
                decoration: InputDecoration(
                    labelText: 'Reason for report',
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color))),
                onChanged: (value) {
                  // Update the controller with the entered reason
                },
              ),
              25.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  // Submit the report
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Submit Report',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
