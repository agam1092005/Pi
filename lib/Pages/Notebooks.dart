// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';

class Notebooks extends StatefulWidget {
  const Notebooks({super.key});

  @override
  State<Notebooks> createState() => _NotebooksState();
}

class _NotebooksState extends State<Notebooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.125),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  HapticFeedback.selectionClick();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Notebooks",
                style: AppBarTextStyle,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
