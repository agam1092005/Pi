// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboard,
    this.validator,
  });

  final String hintText;
  final controller;
  final validator;
  final keyboard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.0625,
      child: TextFormField(
        autofocus: false,
        validator: validator,
        cursorColor: Colors.black38,
        controller: controller,
        keyboardType: keyboard,
        style: SpeechTextStyle,
        autovalidateMode: AutovalidateMode.disabled,
        onChanged: (value) {
          controller.text = value;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: BasicTextStyle3,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black38),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
