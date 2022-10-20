// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productid: json['productid'] as int?,
      price: json['price'] as int?,
      productname: json['productname'] as String?,
      imgname: json['imgname'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productid': instance.productid,
      'price': instance.price,
      'productname': instance.productname,
      'imgname': instance.imgname,
    };
