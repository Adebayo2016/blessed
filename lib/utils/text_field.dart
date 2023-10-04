// ignore_for_file: must_be_immutable

import 'package:blessed_academy/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../src/themes.dart';
import '../views/widgets/textview.dart';

class BlessedTextField extends StatefulWidget {
  String? hintText;
  Widget? prefixIcon;
  String? prefixText;
  TextStyle? textStyle;
  TextInputType? keyboardType;
  String label;
  double width;
  bool password;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  TextEditingController? controller;
  num? maxLines;
  BlessedTextField(
      {Key? key,
      this.hintText,
      this.prefixIcon,
      this.prefixText,
      this.label = '',
      this.password = false,
      this.width = 90, // width is in percentage
      this.textStyle,
      this.keyboardType,
      this.validator,
      this.onChanged,
      this.maxLines,
      this.controller})
      : super(key: key);
  @override
  BlessedTextFieldState createState() => BlessedTextFieldState();
}

class BlessedTextFieldState extends State<BlessedTextField> {
  FocusNode? focusNode;
  Widget? textField;
  double? width;
  double height = 50;
  double lineHeight = 1.5;
  double fontSize = 16;
  TextEditingController? controller;

  Widget? _suffixWidget;
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    // // fill in default values
    // width = S.width(widget.width);
    widget.textStyle ??= TextStyle(fontSize: fontSize, height: lineHeight);
    controller = widget.controller ?? TextEditingController();
    widget.keyboardType ??= TextInputType.text;

    _buildField();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: kCTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 10),
        textField!
      ],
    );
  }

  _buildField() {
    if (controller!.text != '') {
      textField = _buildFilledField();
    } else {
      textField = _buildFilledField();
    }
  }

  Widget _buildEmptyField() {
    return TextFormField(
      onTap: () {
        setState(() {
          textField = _buildFilledField();
        });
      },
      validator: widget.validator,
      obscureText: widget.password && !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: widget.maxLines?.toInt(),
      decoration: InputDecoration(
        suffixIcon: _buildSuffix(),
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: const Color(0xFFA3A3AE),
        ),
        // fillColor: const Color(0xFFF5F5F5),
        // filled: true,
        // focusColor: Colors.blue,
        focusedErrorBorder: errorBorder,
        focusedBorder: normalBorder,
        enabledBorder: emptyBorder,
      ),
    );
  }

  Widget _buildFilledField() {
    focusNode!.requestFocus();
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          if (controller!.text == '') {
            setState(() {
              textField = _buildEmptyField();
            });
          }
        }
      },
      child: TextFormField(
        focusNode: focusNode,
        validator: widget.validator,
        controller: controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.password && !showPassword,
        style: widget.textStyle,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          prefixText: widget.prefixText,
          suffixIcon: _buildSuffix(),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: fontSize,
            color: const Color(0xFFA3A3AE),
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            height: lineHeight,
          ),
          //  fillColor: Colors.white,
          filled: false,
          errorBorder: errorBorder,
          focusedErrorBorder: normalBorder,
          focusedBorder: normalBorder,
          enabledBorder: normalBorder,
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.password) {
      return TextButton(
        child: showPassword ? const Text('Hide') : const Text('Show'),
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
            _buildField();
          });
        },
      );
    } else {
      return null;
    }
  }

  makeFocus() {
    setState(() {
      textField = _buildFilledField();
    });
  }
}

class BlessedProfileTextField extends StatelessWidget {
  const BlessedProfileTextField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.textSize,
    required this.fontWeight,
    required this.istext,
    required this.controller,
    required this.isreadonly,
  }) : super(key: key);
  final String text;
  final String hintText;
  final int textSize;
  final FontWeight fontWeight;
  final bool istext;
  final TextEditingController? controller;
  final bool isreadonly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        istext
            ? kDefaultText(
                text: text,
                size: 18,
                align: TextAlign.start,
                defaultFontFamily: false,
                fontFamily: GoogleFonts.poppins().fontFamily,
              )
            : const SizedBox(),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          readOnly: isreadonly,
          style: TextStyle(
            color: kColorWhite,
            fontSize: textSize.toDouble(),
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: fontWeight,
          ),
          decoration: InputDecoration(
            focusedBorder: normalProfileBorder,
            border: normalProfileBorder,
            enabledBorder: normalProfileBorder,
            errorBorder: errorBorder,
            hintText: hintText,
            hintStyle: TextStyle(
              color: kColorWhite,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
