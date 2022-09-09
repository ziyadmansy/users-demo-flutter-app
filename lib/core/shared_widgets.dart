import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class SharedWidgets {
  static void focusOut(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static Widget buildRoundedOutlinedButton({
    required String btnText,
    required VoidCallback onPress,
    bool isEnabled = true,
  }) =>
      SizedBox(
        height: 48,
        child: OutlinedButton(
          child: Text(btnText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
            ),
          ),
          onPressed: isEnabled ? onPress : null,
        ),
      );

  static Widget buildTextButton({
    required String btnText,
    required VoidCallback onPress,
    bool isEnabled = true,
  }) =>
      SizedBox(
        height: 40,
        child: TextButton(
          child: Text(btnText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
            ),
          ),
          onPressed: isEnabled ? onPress : null,
        ),
      );

  static Widget buildRoundedElevatedButton({
    required String btnText,
    required Color btnColor,
    required VoidCallback onPress,
    bool isEnabled = true,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        child: Text(btnText),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
          ),
        ),
        onPressed: isEnabled ? onPress : null,
      ),
    );
  }

  static Widget buildRoundedIconElevatedButton({
    required String btnText,
    required Color btnColor,
    required IconData icon,
    required VoidCallback onPress,
    bool isEnabled = true,
    AlignmentGeometry? titleAlign,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton.icon(
        label: titleAlign == null
            ? Text(btnText)
            : Align(
                alignment: titleAlign,
                child: Text(btnText),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
          ),
        ),
        onPressed: isEnabled ? onPress : null,
        icon: Icon(icon),
      ),
    );
  }

  static Widget mainAppBar(
    BuildContext context, {
    required String title,
    PreferredSizeWidget? bot,
    List<Widget>? actions,
    double elevation = 4,
  }) {
    return AppBar(
      elevation: elevation,
      title: Text(
        title.toString(),
        style: TextStyle(color: Colors.blue[900]!),
      ),
      bottom: bot,
      actions: actions ?? [],
    );
  }

  static Widget buildClickableTextForm({
    TextEditingController? controller,
    String? hint,
    VoidCallback? onClick,
    String? Function(String? val)? onValidate,
    Function(String? val)? onSaved,
    Function(String? val)? onSubmitted,
    void Function(String)? onChanged,
    String? label,
    bool isIgnoringTextInput = false,
    bool isEnabled = true,
    bool isObscure = false,
    String? initialText,
    TextInputType? inputType,
    TextInputAction? textInputAction,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? suffix,
    Widget? suffixIcon,
    FocusNode? focusNode,
    AutovalidateMode validateMode = AutovalidateMode.disabled,
    int maxLines = 1,
    int? minLines,
  }) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(kSearchFieldBorderRadius),
      child: IgnorePointer(
        ignoring: isIgnoringTextInput,
        child: TextFormField(
          controller: controller,
          initialValue: initialText,
          validator: onValidate,
          enabled: isEnabled,
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: kEnabledBorder,
            focusedBorder: kFocusedBorder,
            disabledBorder: kDisabledBorder,
            errorBorder: kErrorBorder,
            hintText: hint,
            labelText: label ?? hint,
            prefix: prefix,
            suffix: suffix,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: Colors.grey,
          ),
          obscureText: isObscure,
          focusNode: focusNode,
          autovalidateMode: validateMode,
          keyboardType: inputType,
          textInputAction: textInputAction,
          onSaved: onSaved,
          onFieldSubmitted: onSubmitted,
          maxLines: maxLines,
          minLines: minLines,
        ),
      ),
    );
  }

  static Widget build8HeightSizedBox() {
    return const SizedBox(
      height: 8,
    );
  }

  static Widget build16HeightSizedBox() {
    return const SizedBox(
      height: 16,
    );
  }
}
