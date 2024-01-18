import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/Game.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
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
          )),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,

                child: Text(
                  "Dans ce mini-jeu, vous allez vous retrouver dans la situation d'une personne malentendante. Vous devrez retrouver le sujet de la conversation malgré les bruits.",
                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
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
                      MaterialPageRoute(builder: (context) => const Game()),
                    );
                  },
                  child: const Text(
                    "Lancer !",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
