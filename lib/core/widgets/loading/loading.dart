import 'package:flutter/material.dart';
import 'package:admin/core/extensions/dimension.dart';

class SmallLoading extends StatelessWidget {
  const SmallLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: const CircularProgressIndicator(strokeWidth: 1.2),
    );
  }
}
