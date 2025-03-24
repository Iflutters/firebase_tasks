import 'package:flutter/material.dart';

class CustomTextFiel extends StatelessWidget {
  const CustomTextFiel(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.isPassword,
      this.onPressed,
      this.validator,
      this.onChanged});

  final String hintText;
  final Widget? prefixIcon;
  final bool? isPassword;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 20, left: 20),
      child: TextFormField(
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.grey.shade100,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.teal.shade400,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: Colors.grey.shade50)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color: Colors.grey.shade50.withValues(alpha: 0.5))),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color: Colors.grey.shade50.withValues(alpha: 0.5))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.teal, width: 2),
          ),
          suffixIcon: isPassword != null
              ? IconButton(
                  color: isPassword! ? Colors.grey : Colors.teal,
                  onPressed: onPressed,
                  icon: !isPassword!
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : null,
        ),
        obscureText: isPassword ?? false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
