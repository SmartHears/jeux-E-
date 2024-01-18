import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/Menu.dart';

class ScoreScreen extends StatefulWidget {
  final String score;
  const ScoreScreen({super.key, required this.score});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Votre score: ${widget.score} ${int.parse(widget.score) > 1 ? "Bonnes réponses" : "Bonne réponse"}",
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              const SizedBox(height: 50),
              Container(
                child: SizedBox(
                  width: 200,
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Color(0xFF224957)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Menu()),
                      );
                    },
                    child: const Text(
                      "Menu",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
