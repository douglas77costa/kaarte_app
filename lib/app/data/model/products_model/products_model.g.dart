// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) {
  return ProductsModel(
    cod: json['cod'] as int?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    nameImage: json['nameImage'] as String?,
    pathImage: json['pathImage'] as String?,
  );
}

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'nameImage': instance.nameImage,
      'pathImage': instance.pathImage,
    };
