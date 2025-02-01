import 'package:ecommerce/fetures/auth/common/data/models/category_model.dart';

class CatagoryListModel {
  String? msg;
  List<CategoryModel>? categoryList;

  CatagoryListModel({this.msg, this.categoryList});

  CatagoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryModel>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.categoryList != null) {
      data['data'] = this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


