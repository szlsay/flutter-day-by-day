import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategroyList = [];

  getChildCategory(List<BxMallSubDto> list){
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "00";
    all.mallCategoryId = "00";
    all.mallSubName = "全部";
    all.comments = "null";
    childCategroyList = [all];
    childCategroyList.addAll(list);
    // childCategroyList = list;
    notifyListeners();
  }
}