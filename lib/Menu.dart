import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/Intro.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
              Stack(children: [
               Text("SmartHears",
                  style: TextStyle(fontSize: 60, foreground: Paint() ..style = PaintingStyle.stroke ..strokeWidth = 7 ..color = Colors.white)),
                Text("SmartHears", style: TextStyle(fontSize: 60, color:  Color(0xFF224957)),)
              ],),
              const SizedBox(height: 50),
              Container(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xFF224957)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Intro()),
                    );
                  },
                  child: const Text(
                    "Jouer !",
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
