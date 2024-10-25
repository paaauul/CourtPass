import 'package:court_pass/classes/sport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SportSelector extends StatefulWidget {
  final Sport sport;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  SportSelector({
    required this.sport,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _SportSelector createState() => _SportSelector();
}

class _SportSelector extends State<SportSelector> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var sportContainerSize = screenWidth * 0.054;

    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.sport.sportName);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        padding: EdgeInsets.all(sportContainerSize / 2),
        decoration: BoxDecoration(
          gradient: widget.isSelected
            ? const LinearGradient(
                colors: [Color(0xFFFF4D82), Color(0xFFFF6F64)],
                stops: [0, 0.3]
              )
            : null,
          color: widget.isSelected ? null : const Color(0xFFFFFAFA),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x2513131A),
              offset: Offset(0, 3),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.sport.sportIcon,
              color: widget.isSelected ? const Color(0xFFFFFAFA) : const Color.fromARGB(255, 151, 151, 151),
              width: sportContainerSize,
              height: sportContainerSize,
            ),
            const SizedBox(width: 4.0),
            Text(
              widget.sport.sportName,
              style: TextStyle(
                color: widget.isSelected ? const Color(0xFFFFFAFA) : const Color.fromARGB(255, 150, 150, 150),
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
