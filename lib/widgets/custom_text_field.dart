// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notes_app/constants.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.color,
    this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.textController,
  });
  final Color? color;
  final String? hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
    final void Function(String)? onChanged;
  TextEditingController? textController = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      controller: widget.textController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
