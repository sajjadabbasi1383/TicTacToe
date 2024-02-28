import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const myTextStyle = TextStyle(
    fontSize: 17,
    color: Colors.white,
    fontFamily: 'PressStart2P',
    letterSpacing: 2,
  );
  static const myTextStyle3 = TextStyle(
    fontSize: 23,
    color: Colors.white,
    fontFamily: 'PressStart2P',
    letterSpacing: 2,
  );
  static const myTextStyle2 = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontFamily: 'PressStart2P',
    letterSpacing: 2,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "TIC TAC TOE",
                style: myTextStyle3,
              ),
            )),
            Expanded(
                child: AvatarGlow(
              duration: const Duration(seconds: 3),
              glowColor: Colors.white,
              repeat: true,
              startDelay: const Duration(seconds: 1),
              glowRadiusFactor: 0.3,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.grey[900],
                  child: Image.asset(
                    'assets/logo.png',
                    color: Colors.white,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[700]!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          //index.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
