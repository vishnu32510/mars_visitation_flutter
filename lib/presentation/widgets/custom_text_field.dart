import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final String labelText;
  final bool isValid;
  final String? errorText;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      required this.onChanged,
      required this.labelText,
      this.isValid = false,
      this.errorText,
      this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        key: key,
        onChanged: onChanged,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          icon: prefixIcon,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          errorText: errorText,
          suffixIcon: !isValid
              ? SizedBox()
              : Icon(
                  Icons.check_circle,
                ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,width: 2),
          ),
        ),
      ),
    );
  }
}
