// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatistics _$OrderStatisticsFromJson(Map<String, dynamic> json) =>
    OrderStatistics(
      today: json['today'] == null
          ? null
          : TodayOrder.fromJson(json['today'] as Map<String, dynamic>),
      month: json['month'] == null
          ? null
          : MonthOrder.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] == null
          ? null
          : YearOrder.fromJson(json['year'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderStatisticsToJson(OrderStatistics instance) =>
    <String, dynamic>{
      'today': instance.today,
      'month': instance.month,
      'year': instance.year,
    };

TodayOrder _$TodayOrderFromJson(Map<String, dynamic> json) => TodayOrder(
      totalOrders: json['totalOrders'] as int?,
      totalSales: json['totalSales'] as int?,
    );

Map<String, dynamic> _$TodayOrderToJson(TodayOrder instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalSales': instance.totalSales,
    };

MonthOrder _$MonthOrderFromJson(Map<String, dynamic> json) => MonthOrder(
      totalOrders: json['totalOrders'] as int?,
      totalSales: json['totalSales'] as int?,
    );

Map<String, dynamic> _$MonthOrderToJson(MonthOrder instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalSales': instance.totalSales,
    };

YearOrder _$YearOrderFromJson(Map<String, dynamic> json) => YearOrder(
      id: json['_id'] as String?,
      totalOrders: json['totalOrders'] as int?,
      totalSales: json['totalSales'] as int?,
    );

Map<String, dynamic> _$YearOrderToJson(YearOrder instance) => <String, dynamic>{
      '_id': instance.id,
      'totalOrders': instance.totalOrders,
      'totalSales': instance.totalSales,
    };
