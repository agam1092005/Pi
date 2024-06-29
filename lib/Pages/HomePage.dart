// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';
import 'package:lablogic/Pages/Notes.dart';
import 'package:lablogic/Pages/Profile.dart';
import 'package:lablogic/Pages/Records.dart';
import 'dart:math' as math;

import '../utils/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  var selectedNotebook;

  String transcription = "Please speak";

  late SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  void activateSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
        (bool result) => setState(() => _isAvailable = result));
    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));
    _speechRecognition.setRecognitionResultHandler(
        (String text) => setState(() => transcription = text));
    _speechRecognition.setRecognitionCompleteHandler(
        (String text) => setState(() => _isListening = false));

    _speechRecognition
        .activate('en_US')
        .then((result) => setState(() => _isAvailable = result));
  }

  void toggleListening() {
    if (_isListening) {
      _speechRecognition
          .stop()
          .then((result) => setState(() => _isListening = false));
    } else {
      if (_isAvailable) {
        _speechRecognition.listen().then((result) => print('$result'));
      }
    }
    setState(() {
      _isListening = !_isListening;
    });
  }

  void showTopModalSheet(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Dismissible(
                      key: const Key('dismiss'),
                      direction: DismissDirection.up,
                      onDismissed: (direction) {
                        Navigator.of(context).pop();
                        HapticFeedback.vibrate();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: 16,
                            right: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Notebooks",
                              style: SubHeadingTextStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              spacing:
                                  MediaQuery.of(context).size.width * 0.025,
                              children: UserData['notebooks']
                                  .map<Widget>(
                                    (e) => Container(
                                      margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(
                                          (math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt(),
                                        ).withOpacity(1.0),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      height: 100,
                                      width: 80,
                                    ),
                                  )
                                  .toList(),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton(
                                backgroundColor: accentColor,
                                onPressed: () async {
                                  var response = await createNotebook(
                                    [],
                                    "Not enough records to generate Research",
                                    UserData['_id'],
                                  );
                                  print(response);
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 5,
                                width: 100,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    activateSpeechRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (selectedNotebook == null)
          ? const SizedBox(
              height: 0,
            )
          : DefaultTabController(
              length: 2,
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    return Colors.transparent;
                  },
                ),
                padding: const EdgeInsets.only(bottom: 16),
                controller: _tabController,
                onTap: (val) {
                  setState(() {});
                },
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
      floatingActionButton: (selectedNotebook == null)
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  toggleListening();
                });
              },
              backgroundColor: accentColor,
              enableFeedback: true,
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
                  showTopModalSheet(context);
                  HapticFeedback.selectionClick();
                },
                child: Text(
                  (selectedNotebook == null)
                      ? "Your Notebooks"
                      : "• Amoeba Research",
                  style: SubHeadingTextStyle,
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
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    auth.currentUser!.photoURL.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: (selectedNotebook == null)
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image(
                        image: const AssetImage(
                          "assets/notebook.png",
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "You haven't created any notebook yet :(",
                      style: BasicTextStyle,
                    ),
                  ],
                ),
              )
            : TabBarView(
                controller: _tabController,
                children: [
                  Records(
                    notebook: selectedNotebook,
                  ),
                  Notes(notebook: selectedNotebook),
                  // Notes(),
                ],
              ),
      ),
    );
  }
}
