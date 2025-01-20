import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final double buttonWidth;
  final Color? color;
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MenuButton({
    super.key,
    required this.buttonWidth,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.0,
            children: [
              Icon(icon, color: Colors.white),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
