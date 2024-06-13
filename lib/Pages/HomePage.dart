// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';
import 'package:lablogic/Pages/Notebooks.dart';
import 'package:lablogic/Pages/Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 2,
        child: TabBar(
          controller: _tabController,
          dividerHeight: 0,
          splashBorderRadius: BorderRadius.zero,
          dividerColor: Colors.transparent,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: secondaryColor,
          ),
          tabs: const [
            Tab(
              child: Center(
                child: Text(
                  "Record",
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text(
                  "Notes",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: accentColor,
        child: const Icon(
          Icons.mic,
          color: Colors.white,
        ),
      ),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.125),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => const Notebooks(),
                    ),
                  );
                  HapticFeedback.selectionClick();
                },
                child: const Text(
                  "• Amoeba Research",
                  style: AppBarTextStyle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => const Profile(),
                    ),
                  );
                  HapticFeedback.selectionClick();
                },
                child: const CircleAvatar(
                  radius: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TabBarView(
          controller: _tabController,
          children: const [
            Text("Records"),
            Text("Notes"),
          ],
        ),
      ),
    );
  }
}
