import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const MyTextFormField({
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        validator: validator ?? (value) => value == null || value.isEmpty ? '$label must not be empty' : null,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: const Color(0xFFF1DDF8),
          hintText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
