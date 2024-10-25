import 'package:flutter/material.dart';

class PaymentOption extends StatefulWidget {
  final String logoPath;
  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;
  final bool isSelected;

  PaymentOption({
    required this.logoPath,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.screenWidth * 0.9,
        height: widget.screenHeight * 0.065,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFAFA),
          border: Border.all(color: const Color(0xFFB6B6B6), width: 0.6),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x30091621),
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widget.screenWidth * 0.04),
              child: Image.asset(widget.logoPath),
            ),
            Padding(
              padding: EdgeInsets.only(right: widget.screenWidth * 0.04),
              child: Container(
                width: widget.screenWidth * 0.033,
                height: widget.screenWidth * 0.033,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF696969), width: 0.6),
                  color: widget.isSelected ? Color.fromARGB(255, 101, 231, 105) : const Color(0xFFCECECE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}