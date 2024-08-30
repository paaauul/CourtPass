import 'package:court_pass/classes/sport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSportSelector extends StatefulWidget {
  final Sport sport;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  HomeSportSelector({
    required this.sport,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _HomeSportSelectorState createState() => _HomeSportSelectorState();
}

class _HomeSportSelectorState extends State<HomeSportSelector> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var sportContainerSize = screenWidth * 0.055;

    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.sport.sportName);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(sportContainerSize / 2),
        decoration: BoxDecoration(
          gradient: widget.isSelected
            ? const LinearGradient(
                colors: [Color(0xFFFF4D82), Color(0xFFE58577)],
                begin: FractionalOffset(-0.2, 0),
                end: FractionalOffset(0.4, 1),
              )
            : null,
          color: widget.isSelected ? null : const Color(0xFFFFFAFA),
          borderRadius: BorderRadius.circular(widget.isSelected ? 24.0 : 50.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3013131A),
              offset: Offset(0, 3),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.sport.sportIcon,
              color: widget.isSelected ? const Color(0xFFFFFAFA) : const Color(0xFF13131A),
              width: sportContainerSize,
              height: sportContainerSize,
            ),
            if (widget.isSelected) ...[
              const SizedBox(width: 8.0),
              Text(
                widget.sport.sportName,
                style: TextStyle(
                  color: Color(0xFFFFFAFA),
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
