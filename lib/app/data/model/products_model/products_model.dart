import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {

  int? cod;
  String? name;
  double? price;
  String? description;
  String? nameImage;
  String? pathImage;

  ProductsModel({
    this.cod,
    this.name,
    this.price,
    this.description,
    this.nameImage,
    this.pathImage
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
