import 'package:flutter/material.dart';

class TextfieldWithEdit extends StatefulWidget {
  final String label;
  final String text;

  TextfieldWithEdit(this.label, this.text);

  @override
  _FillupTextFieldState createState() => _FillupTextFieldState();
}

class _FillupTextFieldState extends State<TextfieldWithEdit> {
  bool _isEditable = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.9;
    double textFieldHeight = screenHeight * 0.05;

    double textFieldTextSize = screenWidth * 0.036;
    double labelSize = screenWidth * 0.036;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.025),
          child: Text(
            "${widget.label}:",
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
            ]
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  enabled: _isEditable,
                  style: TextStyle(color: Color(0x9513131A), fontSize: textFieldTextSize),
                  decoration: InputDecoration(
                    hintText: widget.text,
                    hintStyle: TextStyle(
                      color: Color(0xFF9B9797),
                      fontFamily: 'Inter',
                      fontSize: textFieldTextSize,
                      fontWeight: FontWeight.w200,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(_isEditable ? Icons.check : Icons.edit, color: Color(0xFF514F4F)),
                onPressed: () {
                  setState(() {
                    _isEditable = !_isEditable;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
