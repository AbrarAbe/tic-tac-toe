import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Color? boxShadow;
  final Color? borderColor;
  final Widget? child;
  final void Function()? onTap;
  const MyBox({
    super.key,
    required this.onTap,
    required this.boxShadow,
    required this.borderColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color:
                  boxShadow ??
                  Theme.of(context).colorScheme.onSecondary.withAlpha(99),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            width: 1,
            color: borderColor ?? Theme.of(context).colorScheme.tertiary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.all(3),
        child: child,
      ),
    );
  }
}
