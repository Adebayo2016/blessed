import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class EditFormField extends StatelessWidget {
  EditFormField(
      {Key? key,
      this.label = '',
      this.hint = '',
      this.floatingLabel = '',
      this.prefixIcon,
      this.suffixIcon,
      this.onSaved,
      this.validator,
      this.controller,
      this.alignLabelWithHint = false,
      this.onPasswordToggle,
      this.initialValue,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.autocorrect = true,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false,
      this.onTapped,
      this.keyboardType,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.inputFormatters,
      this.focusedColorBorder,
      this.suffixIconColor,
      this.labelStyle,
      this.hintStyle,
      this.textStyle,
      this.decoration,
      this.onChange,
      this.edgeInsetsGeometry,
      this.textCapitalization = TextCapitalization.none,
      this.formKey,
      this.bgColor,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.clickable,
      this.prefixWidget,
      this.prefixIconColor,
      this.fillColor = false,
      this.counterLength = 0,
      this.isTyping = false,
      this.autoValidate = false,
      this.suffixWidget,
      this.height,
      this.showMaxLengthCounter = false,
      this.radius = 8})
      : super(key: key);

  final double? height;
  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;

  final String? initialValue;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool? autocorrect;
  final AutovalidateMode? autoValidateMode;
  final bool? enabled;
  final bool? obscureText;
  final bool? readOnly;
  final bool? alignLabelWithHint;
  final bool? isTyping;

  final bool? clickable;
  final Function()? onTapped;

  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final Color? focusedColorBorder;
  final Color? bgColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final Key? formKey;

  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final FocusNode? focusNode;
  bool fillColor;
  bool autoValidate;
  bool showMaxLengthCounter;
  final int counterLength;
  double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffECF0F4), width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        readOnly: readOnly!,
        onTap: onTapped,
        key: formKey,
        cursorColor: kColorMainPrimary,
        keyboardType: keyboardType,
        enabled: enabled,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization!,
        autovalidateMode: autoValidateMode,
        onSaved: onSaved,
        onChanged: onChange,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        // ignore: deprecated_member_use
        // autovalidate: autoValidate,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            fontStyle: FontStyle.normal),
        autocorrect: autocorrect!,
        minLines: minLines,
        obscureText: obscureText!,
        maxLength: maxLength,
        validator: validator,
        initialValue: initialValue,
        controller: controller,
        decoration: decoration ??
            InputDecoration(
                counterText: '',
                counter: showMaxLengthCounter
                    ? Text(
                        '$counterLength/$maxLength characters',
                        style: const TextStyle(color: Colors.green),
                      )
                    : null,
                filled: fillColor,
                fillColor: bgColor,
                floatingLabelBehavior: floatingLabelBehavior,
                alignLabelWithHint: alignLabelWithHint,
                errorStyle: const TextStyle(color: Colors.red),
                contentPadding: edgeInsetsGeometry ??
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hint,
                hintStyle: hintStyle ??
                    GoogleFonts.roboto(
                        color: kColorLightMediumGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        fontStyle: FontStyle.normal),
                labelText: label,
                labelStyle: labelStyle ??
                    GoogleFonts.firaSans(
                        color: kColorLightMediumGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                // prefix: prefixWidget,
                prefixIcon: prefixIcon != null
                    ? IconButton(
                        onPressed: onPasswordToggle,
                        icon: Icon(
                          prefixIcon,
                          color: prefixIconColor,
                        ))
                    : prefixWidget,
                // suffix: suffixWidget,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                        onPressed: onPasswordToggle,
                        icon: Icon(
                          suffixIcon,
                          color: suffixIconColor ,
                        ))
                    : suffixWidget),
      ),
    );
  }
}
