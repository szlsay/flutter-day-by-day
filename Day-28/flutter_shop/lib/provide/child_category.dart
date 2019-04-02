import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategroyList = [];

  getChildCategory(List list){
    childCategroyList = list;
    notifyListeners();
  }
}