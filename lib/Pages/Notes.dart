// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  final notebook;
  const Notes({super.key, required this.notebook});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
