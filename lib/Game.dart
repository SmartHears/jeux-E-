import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'ScoreScreen.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late var answers;
  int indexQuestion = 1;
  int validAnswer = 0;
  final player = AudioPlayer();
  final player2 = AudioPlayer();
  List<Color> colorsList = [
    const Color(0xFF224957),
    const Color(0xFF224957),
    const Color(0xFF224957)
  ];
  late int clickedButton;

  Future<String> loadData() async {
    var data = await rootBundle.loadString("assets/data.json");
    setState(() {
      answers = json.decode(data);
    });
    player.setAsset("assets/audio1.mp3");
    player.play();

    return "success";
  }

  @override
  void initState() {
    loadData();
  }

  void checkAnswer(String answer) async {
    if (answer ==
        answers["questions"][indexQuestion.toString()]["CorrectAnswer"]
            .toString()) {
      validAnswer++;
      setState(() {
        colorsList[clickedButton] = Colors.green;
      });
    } else {
      setState(() {
        colorsList[clickedButton] = Colors.red;
      });
    }

    await Future.delayed(const Duration(seconds: 1));


    setState(() {
      if (indexQuestion != 5) {
        indexQuestion++;
        player.pause();
        player.setAsset("assets/audio${indexQuestion.toString()}.mp3");
        if (indexQuestion >= 2) {
         player2.pause();
         player2.setAsset("assets/bruit${indexQuestion.toString()}.mp3");
         player2.play();
        }
        player.setVolume(0.5);
        player.play();
      }
    });
    colorsList[clickedButton] = const Color(0xFF224957);

    if (indexQuestion == 5) {
      player.dispose();
      player2.dispose();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreScreen(score: validAnswer.toString()),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder =
        FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
      return Center(
        child: Text(
          answers.toString(),
          style: const TextStyle(),
        ),
      );
    });
    return Scaffold(
      body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF224957),
                  Color(0xFFAB87DE),
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "De quoi parle la conversation ?",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(colorsList[0]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {
                        clickedButton = 0;
                        checkAnswer("1");
                      },
                      child: Text(
                        answers["questions"][indexQuestion.toString()]
                                ["answers"]["1"]
                            .toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(colorsList[1]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {
                        clickedButton = 1;
                        checkAnswer("2");
                      },
                      child: Text(
                        answers["questions"][indexQuestion.toString()]
                                ["answers"]["2"]
                            .toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(colorsList[2]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {
                        clickedButton = 2;
                        checkAnswer("3");
                      },
                      child: Text(
                        answers["questions"][indexQuestion.toString()]
                                ["answers"]["3"]
                            .toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                ],
              ))),
    );
  }
}
