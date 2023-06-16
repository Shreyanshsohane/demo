import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextContainer extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  Color borderColor;
  Color boxColor;
  Color textColor;
  Icon prefixIcon;
  Icon? suffixIcon;

  TextContainer(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.borderColor,
      required this.boxColor,
      required this.textColor,
      required this.prefixIcon,
      this.suffixIcon});

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      //keyboardType: TextInputType.phone,
      maxLines: 1,
      // textAlign: TextAlign.center,\

      style: TextStyle(fontSize: 22.sp, color: widget.textColor),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.5),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.5),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.hintText,
          labelStyle: TextStyle(
            fontSize: 22.sp,
            color: widget.textColor,
          ),
          // floatingLabelAlignment: FloatingLabelAlignment.center,
          fillColor: widget.boxColor,
          filled: true),
    );
  }
}
