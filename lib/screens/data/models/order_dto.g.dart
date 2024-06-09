// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemListDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      noCutlery: json['noCutlery'] as bool?,
      noKetchup: json['noKetchup'] as bool?,
      totalPrice: json['totalPrice'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'items': instance.items,
      'noCutlery': instance.noCutlery,
      'noKetchup': instance.noKetchup,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
    };

ItemListDto _$ItemListDtoFromJson(Map<String, dynamic> json) => ItemListDto(
      item: json['item'] == null
          ? null
          : ItemDto.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ItemListDtoToJson(ItemListDto instance) =>
    <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
    };

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      itemName: json['itemName'] as String?,
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'itemName': instance.itemName,
    };
