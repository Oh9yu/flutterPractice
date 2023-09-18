import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSecond = 2;
  int pomodoroCount = 0;
  bool isRunning = false;
  late Timer timer;

  String formatSecond(int second) {
    var duration =
        Duration(seconds: second).toString().split('.')[0].split(':');
    var secToMin = '${duration[1]}:${duration[2]}';
    return '$secToMin';
  }

  void onTick(Timer timer) {
    formatSecond(totalSecond);
    setState(() {
      totalSecond--;
      if (totalSecond < 1) {
        onRefresh();
        pomodoroCount++;
      }
    });
  }

  void onRefresh() {
    setState(() {
      totalSecond = 1500;
      isRunning = false;
      timer.cancel();
    });
  }

  void onStartHandler() {
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
      print(totalSecond);
    });
  }

  void onPauseHandler() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatSecond(totalSecond),
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: isRunning ? onPauseHandler : onStartHandler,
                      iconSize: 90,
                      color: Theme.of(context).colorScheme.onBackground,
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline_rounded
                          : Icons.play_circle_outline_rounded)),
                  IconButton(
                      iconSize: 60,
                      color: Theme.of(context).colorScheme.onBackground,
                      onPressed: onRefresh,
                      icon: Icon(Icons.replay_circle_filled_sharp))
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).colorScheme.surface),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        Text(
                          '$pomodoroCount',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
