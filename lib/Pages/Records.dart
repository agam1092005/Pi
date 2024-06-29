// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';

class Records extends StatefulWidget {
  final notebook;
  const Records({super.key, required this.notebook});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 80,
                    width: double.maxFinite,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            "The reaction evolved flame red in colour and rats were unconscious with the flame",
                            style: SpeechTextStyle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.cloud_done_outlined,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            });
  }
}
