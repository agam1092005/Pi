// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return (NotebookData['records'].length == 0)
        ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image(
                    image: const AssetImage(
                      "assets/records.png",
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "No records found, try recording something",
                  style: BasicTextStyle,
                ),
                const Text(
                  "psst, Press the mic icon",
                  style: BasicTextStyle3,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: NotebookData['records'].length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 80,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            NotebookData['records'][index]['message']
                                .toString(),
                            style: SpeechTextStyle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            NotebookData['records'][index]['status']
                                ? Icons.cloud_done_outlined
                                : Icons.cloud_off_outlined,
                            color: NotebookData['records'][index]['status']
                                ? Colors.green
                                : Colors.red,
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
