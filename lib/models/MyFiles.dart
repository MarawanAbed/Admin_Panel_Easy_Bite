import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final IconData? svgSrc;
  String? title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Today",
    numOfFiles: 1328,
    svgSrc: Icons.calendar_today,
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Last month",
    numOfFiles: 1328,
    svgSrc: Icons.center_focus_weak,
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Last week",
    numOfFiles: 1328,
    svgSrc: Icons.calendar_month,
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Last year",
    numOfFiles: 5328,
    svgSrc: Icons.calendar_month_sharp,
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
