import 'package:json_annotation/json_annotation.dart'; 

part 'order_statistics.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class OrderStatistics {
  @JsonKey(name: 'today')
  TodayOrder? today;
  @JsonKey(name: 'month')
  MonthOrder? month;
  @JsonKey(name: 'year')
  YearOrder? year;

  OrderStatistics({this.today, this.month, this.year});

   factory OrderStatistics.fromJson(Map<String, dynamic> json) => _$OrderStatisticsFromJson(json);

   Map<String, dynamic> toJson() => _$OrderStatisticsToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class TodayOrder {
  @JsonKey(name: 'totalOrders')
  int? totalOrders;
  @JsonKey(name: 'totalSales')
  int? totalSales;

  TodayOrder({this.totalOrders, this.totalSales});

   factory TodayOrder.fromJson(Map<String, dynamic> json) => _$TodayOrderFromJson(json);

   Map<String, dynamic> toJson() => _$TodayOrderToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class MonthOrder {
  @JsonKey(name: 'totalOrders')
  int? totalOrders;
  @JsonKey(name: 'totalSales')
  int? totalSales;

  MonthOrder({this.totalOrders, this.totalSales});

   factory MonthOrder.fromJson(Map<String, dynamic> json) => _$MonthOrderFromJson(json);

   Map<String, dynamic> toJson() => _$MonthOrderToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class YearOrder {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'totalOrders')
  int? totalOrders;
  @JsonKey(name: 'totalSales')
  int? totalSales;

  YearOrder({this.id, this.totalOrders, this.totalSales});

   factory YearOrder.fromJson(Map<String, dynamic> json) => _$YearOrderFromJson(json);

   Map<String, dynamic> toJson() => _$YearOrderToJson(this);
}

