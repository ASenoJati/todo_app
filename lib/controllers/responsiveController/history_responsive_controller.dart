import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryResponsiveController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
