import 'package:json_annotation/json_annotation.dart'; 

part 'order_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class OrderDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'items')
  List<ItemListDto>? items;
  @JsonKey(name: 'noCutlery')
  bool? noCutlery;
  @JsonKey(name: 'noKetchup')
  bool? noKetchup;
  @JsonKey(name: 'totalPrice')
  int? totalPrice;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  OrderDto({this.id, this.user, this.items, this.noCutlery, this.noKetchup, this.totalPrice, this.status, this.createdAt, this.updatedAt});

   factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

   Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class User {
  @JsonKey(name: 'userName')
  String? userName;

  User({this.userName});

   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

   Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ItemListDto {
  @JsonKey(name: 'item')
  ItemDto? item;
  @JsonKey(name: 'quantity')
  int? quantity;

  ItemListDto({this.item, this.quantity});

   factory ItemListDto.fromJson(Map<String, dynamic> json) => _$ItemListDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ItemListDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class ItemDto {
  @JsonKey(name: 'itemName')
  String? itemName;

  ItemDto({this.itemName});

   factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ItemDtoToJson(this);
}

