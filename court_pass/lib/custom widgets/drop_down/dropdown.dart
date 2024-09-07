import 'package:flutter/material.dart';

class genderDropDown extends StatefulWidget {
  final String selectedGender;
  genderDropDown(this.selectedGender);

  @override
  _genderDropDownState createState() => _genderDropDownState();
}

class _genderDropDownState extends State<genderDropDown> {
  String? _selectedGender;
  final List<String> choices = ["Male", "Female"];

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.87;
    double textFieldHeight = screenHeight * 0.05;

    double textFieldTextSize = screenWidth * 0.036;
    double labelSize = screenWidth * 0.036;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.025),
          child: Text(
            "Gender:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: labelSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: textFieldWidth,
          height: textFieldHeight,
          decoration: BoxDecoration(
            color: Color(0xFFFFFAFA),
            border: Border.all(color: Color(0xFF13131A), width: 0.1),
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Color(0x2513131A),
                blurRadius: 4,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    _selectedGender ?? 'Select Gender',
                    style: TextStyle(
                      color: _selectedGender == null ? Color(0xFF9B9797) : Colors.black,
                      fontFamily: 'Inter',
                      fontSize: textFieldTextSize,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                color: Color(0xFF9B9797),
                onPressed: () {
                  _showDropdownMenu(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDropdownMenu(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final String? newValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + 40,
        offset.dy + renderBox.size.height,
        MediaQuery.of(context).size.width - offset.dx - renderBox.size.width,
        MediaQuery.of(context).size.height - offset.dy - renderBox.size.height,
      ),
      items: choices.map((String value) {
        return PopupMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: MediaQuery.of(context).size.width * 0.036,
              fontWeight: FontWeight.w200,
            ),
          ),
        );
      }).toList(),
      color: Color(0xFFFFFAFA),
    );

    if (newValue != null) {
      setState(() {
        _selectedGender = newValue;
      });
    }
  }
}
