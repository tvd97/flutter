import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/start/model/startsceenmodel.dart';
import '../signin-sigout/signin/signin.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreenBody(),
    );
  }
}

class StartScreenBody extends StatefulWidget {
  const StartScreenBody({Key? key}) : super(key: key);

  @override
  State<StartScreenBody> createState() => _StartScreenBodyState();
}

class _StartScreenBodyState extends State<StartScreenBody> {
  List<StartScreenModel> data = [
    StartScreenModel("Proven specialis", "assets/images/src1.png",
        "We check each specialis before he start work"),
    StartScreenModel("Honest ratings", "assets/images/src2.png",
        "We carefully check each specialist and put honest ratings"),
    StartScreenModel("Insured oders", "assets/images/src3.png",
        'We insure each oders for the amount of 500'),
    StartScreenModel("Create oders", "assets/images/src4.png",
        "Its easy, just click on th plus"),
    StartScreenModel("Proven specialis", "assets/images/src5.png",
        "We check each specialis before he start work")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _startBody(context),
    );
  }

  int postion = 0;
  var pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    autoNextPage();
  }

  autoNextPage() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (postion < data.length - 1) {
          setState(() {
            postion = postion + 1;
          });
        }
        pageController.animateToPage(postion,
            duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
        // }
      },
    );
  }

  onPageChange(int index) {
    setState(
      () {
        postion = index;
      },
    );
  }

  Widget _startBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              onPageChanged: (index) => onPageChange(index),
              controller: pageController,
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  color: const Color.fromARGB(0, 115, 178, 238),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            data[index].title,
                            style: const TextStyle(fontSize: 70),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(child: Image.asset(data[index].src)),
                      ),

                      Expanded(
                        child: Text(
                          data[index].text,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        flex: 2,
                      ),
                      //_listGeneric(data.length),
                    ],
                  ),
                );
              },
            ),
          ),
          InkWell(
            child: postion == data.length - 1
                ? FloatingActionButton(
                    child: _textButton(text: "Skip"),
                    onPressed: () {},
                  )
                : Container(
                    height: 60.0,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    color: const Color(0xFF20C3AF),
                    child: Center(
                      child: _textButton(text: "Next"),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _textButton({required String text}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SigninScreen()),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
