import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

class UIChallenge2 extends StatelessWidget {
  const UIChallenge2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.lime,
                      radius: 30,
                      child: Text(
                        'DS',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '+',
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'MONDAY 16',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Text(
                      'TODAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                    const Text(
                      '·',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 45,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '18',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '19',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
              DesignCard(
                color: Colors.yellow.shade300,
                names: const ['ALEX', 'HELENA', 'NANA'],
                startTime: const ['11', '30'],
                endTime: const ['12', '20'],
                titles: const ['DESIGN', 'MEETING'],
              ),
              const SizedBox(
                height: 5,
              ),
              DesignCard(
                color: Colors.deepPurple.shade400,
                names: const ['ME', 'RICHARD', 'CIRY', '+4'],
                startTime: const ['12', '35'],
                endTime: const ['14', '10'],
                titles: const ['DAILY', 'PROJECT'],
              ),
              const SizedBox(
                height: 5,
              ),
              const DesignCard(
                color: Colors.lightGreenAccent,
                names: ['DEN', 'NANA', 'MARK'],
                startTime: ['15', '00'],
                endTime: ['16', '30'],
                titles: ['WEEKLY', 'PLANNING'],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DesignCard extends StatelessWidget {
  final Color color;
  final List<String> names;
  final List<String> startTime;
  final List<String> endTime;
  final List<String> titles;

  const DesignCard({
    super.key,
    required this.color,
    required this.names,
    required this.startTime,
    required this.endTime,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      startTime[0],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      startTime[1],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      endTime[0],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      endTime[1],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles[0],
                      style: const TextStyle(
                        fontSize: 70,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      titles[1],
                      style: const TextStyle(
                        fontSize: 70,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          names[0],
                          style: TextStyle(
                            fontSize: 18,
                            color: names[0] == 'ME'
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          names[1],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          names[2],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (names.length > 3)
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              names[3],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
