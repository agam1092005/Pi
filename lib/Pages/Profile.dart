// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AdditionalFiles/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                "Profile",
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
