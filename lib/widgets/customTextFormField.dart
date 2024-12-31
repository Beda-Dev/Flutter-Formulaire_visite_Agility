import 'package:flutter/material.dart';
import 'package:formulaire/utils/colors.dart';

Widget buildTextField(String label, TextEditingController controller, String errorMessage, bool obscureText , bool validate , TextInputType clavier) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  Text.rich(
  TextSpan(
  text: label,
    style: const TextStyle(
      color: AppColors.gray500,
    ),
    children: [
      if (validate == false)
        const TextSpan(
          text: "*",
          style: TextStyle(
            color: AppColors.red200,
          ),
        ),
    ],
  ),
  ),


      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),

          ),
        ),
        validator: validate
            ? (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        }
            : null,

        keyboardType: clavier,
      ),
    ],
  );
}