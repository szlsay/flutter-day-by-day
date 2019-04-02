class CategoryModel {
  String code;
  String message;
  List<Data> data;

  CategoryModel({this.code, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;

  Data(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}

// class CategoryBigModel {
//   String mallCategoryId;    //类别编号
//   String mallCategoryName;  //类别名称
//   List<dynamic> bxMallSubDto;        //小类列表
//   String image;             //类别图片
//   Null comments;          //列表描述
//   //构造函数
//   CategoryBigModel({
//     this.mallCategoryId,
//     this.mallCategoryName,
//     this.comments,
//     this.image,
//     this.bxMallSubDto
//   });
//   //工厂模式-用这种模式可以省略New关键字
//   factory CategoryBigModel.fromJson(dynamic json){
//     return CategoryBigModel(
//       mallCategoryId:json['mallCategoryId'],
//       mallCategoryName:json['mallCategoryName'],
//       comments:json['comments'],
//       image:json['image'],
//       bxMallSubDto:json['bxMallSubDto']
//     );
//   }
// }

// class CategoryBigListModel {
//   List<CategoryBigModel> data;
//   CategoryBigListModel(this.data);
//   factory CategoryBigListModel.formJson(List json){
//     return CategoryBigListModel(
//       json.map((i)=>CategoryBigModel.fromJson((i))).toList()
//     );
//   }
// }

