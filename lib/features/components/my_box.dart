// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Color? borderColor;
  final Widget? child;
  final void Function()? onTap;
  const MyBox({
    super.key,
    required this.onTap,
    required this.borderColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: borderColor ?? Theme.of(context).colorScheme.tertiary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.all(2),
        child: child,
      ),
    );
  }
}
