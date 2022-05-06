import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/construction/constructionscreen.dart';

class DetailsCardScreen extends StatelessWidget {
  const DetailsCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailsCardScreenBody(),
    );
  }
}

class DetailsCardScreenBody extends StatefulWidget {
  const DetailsCardScreenBody({Key? key}) : super(key: key);

  @override
  State<DetailsCardScreenBody> createState() => _DetailsCardScreenBodyState();
}

class _DetailsCardScreenBodyState extends State<DetailsCardScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cardScreenBody(context),
    );
  }

  Widget _cardScreenBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 5.0),
                height: 60,
                child: Row(children: const [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: null,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text('Payment cards'),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: null,
                  ),
                ]),
              ),
              Container(
                height: 202.0,
                padding: const EdgeInsets.only(
                    top: 20.0, left: 23.0, right: 23.0, bottom: 19.0),
                margin: const EdgeInsets.only(top: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment(0.7, 0.3),
                    colors: [
                      Color(0xff02DA80),
                      Color(0xff0284D8),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          '**** **** **** 1213',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          '10/24',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '\$25,388',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 40.0, bottom: 16.0),
                child: const Text(
                  'Card Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Color(0xffF7F7F7),
                ),
                child: const Text(
                  '**** **** **** 1213',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 26.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: const Text('Exp. Month'),
                            alignment: Alignment.centerLeft,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: const [
                                  Text('7'),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: const Text('Exp.Year'),
                            alignment: Alignment.centerLeft,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: const [
                                  Text('7'),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: const Text('CVV'),
                            alignment: Alignment.centerLeft,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F7F7),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: const [
                                  Text('7'),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                child: Container(
                  height: 60.0,
                  margin: const EdgeInsets.only(bottom: 40.0),
                  color: const Color(0xFF20C3AF),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConstructionScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Save card',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
