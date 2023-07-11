import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/pages/hot/index.dart';
import 'package:pilipala/pages/rcmd/index.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  bool flag = false;
  List tabs = [
    {'label': '直播', 'type': 'live'},
    {'label': '推荐', 'type': 'rcm'},
    {'label': '热门', 'type': 'hot'},
  ];
  int initialIndex = 1;
  late TabController tabController;
  List ctrList = [
    '',
    Get.find<RcmdController>,
    Get.find<HotController>,
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: initialIndex,
      length: tabs.length,
      vsync: this,
    );
  }

  void onRefresh() {
    int index = tabController.index;
    var ctr = ctrList[index];
    ctr().onRefresh();
  }

  void animateToTop() {
    int index = tabController.index;
    var ctr = ctrList[index];
    ctr().animateToTop();
  }
}
