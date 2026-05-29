import 'package:flutter/material.dart';

class InputElvo extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleObscure;
  final TextInputType? keyboardType;

  const InputElvo({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleObscure,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? obscureText : false,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color.fromRGBO(255, 255, 255, 0.6),
          size: 20,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  size: 20,
                ),
                onPressed: onToggleObscure,
                splashRadius: 20,
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.4),
          fontSize: 14,
        ),
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.07),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
      ),
    );
  }
}
