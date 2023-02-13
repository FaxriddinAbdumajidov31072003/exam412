import 'package:flutter/material.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintext;
  final String? obscuringCharacter;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onchange;
  final String? label;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomTextFrom({
    Key? key,
    required this.controller,
    required this.hintext,
    this.keyboardType = TextInputType.text,
    this.onchange,
    this.obscuringCharacter,
    this.label,
    this.prefixicon,
    this.suffixIcon,
    this.maxLines,
   this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onchange,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        suffixIcon: suffixIcon,
        hintText: hintext,

        contentPadding:
            const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
}
