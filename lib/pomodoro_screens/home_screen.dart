import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  int totalRounds = 0;
  int totalGoals = 0;
  late Timer timer;
  bool isRestTime = false;

  final totalMinutes = [15, 20, 25, 30, 35];
  int selectedMinuteIndex = 2;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        if (isRestTime) {
          isRestTime = false;
        } else {
          // increase total pomodoro if not rest time
          totalPomodoros = totalPomodoros + 1;
        }

        isRunning = false;
        totalSeconds = totalMinutes[selectedMinuteIndex] * 60;

        totalGoals = totalPomodoros ~/ 4;
        totalRounds = totalPomodoros ~/ 4;
        if (totalRounds >= 4) {
          totalRounds = 0;
          totalSeconds = 5 * 60;
          isRestTime = true;
        }
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void restartSession() {
    setState(() {
      isRunning = false;
      totalSeconds = totalMinutes[selectedMinuteIndex] * 60;
    });
    timer.cancel();
  }

  void setTotalSecond(index) {
    if (isRunning) {
      return;
    }

    setState(() {
      selectedMinuteIndex = index;
      totalSeconds = totalMinutes[index] * 60;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(flex: 1, child: Container()),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: (isRunning && !isRestTime)
                      ? Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                color: Theme.of(context).cardColor,
                                iconSize: 45,
                                onPressed: restartSession,
                                icon: const Icon(
                                  Icons.restart_alt_outlined,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => setTotalSecond(index),
                        child: TimeCard(
                          minute: totalMinutes[index],
                          isSelected: index == selectedMinuteIndex,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
                onPressed: isRunning ? onPausePressed : onStartPressed,
              ),
            ),
          ),
          // Flexible(
          //   flex: 1,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       const SizedBox(
          //         height: 100,
          //       ),
          //       Text(
          //         'Total $totalPomodoros Pomos',
          //         style: TextStyle(
          //           fontSize: 20,
          //           color: Theme.of(context).textTheme.displayLarge!.color,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       )
          //     ],
          //   ),
          // ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$totalRounds/4',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            Text(
                              'ROUND',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$totalGoals/12',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                            Text(
                              'GOAL',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final int minute;
  final bool isSelected;

  const TimeCard({
    super.key,
    required this.minute,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).cardColor
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 100,
        height: 50,
        child: Center(
          child: Text(
            minute.toString(),
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).cardColor.withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
