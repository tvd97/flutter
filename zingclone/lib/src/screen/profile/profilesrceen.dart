import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zingclone/src/screen/notifications/notificationscreen.dart';
import 'package:zingclone/src/screen/orders/orderscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreenBody(),
    );
  }
}

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({Key? key}) : super(key: key);

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _profileBody(context),
    );
  }

  Widget _profileBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              SizedBox(
                height: 60,
                child: Row(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // Drawer(
                      //   child: Column(
                      //     children: const [
                      //       Text("data"),
                      //       Text("data"),
                      //       Text("data"),
                      //       Text("data"),
                      //       Text("data"),
                      //     ],
                      //   ),
                      // );
                    },
                  ),
                ]),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            borderRadius: BorderRadius.circular(125),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          child: Image.asset('assets/images/src5.png'),
                          width: 125.0,
                          height: 125.0,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      const Center(child: Text('Jeremías del Pozo')),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Center(
                        child: Row(
                          children: const [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              child: Center(child: Text('New York')),
                            ),
                            Expanded(
                              child: Center(child: Text('ID: 1120611')),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Center(
                          child: TextButton(
                              onPressed: () {}, child: const Text('Edit')))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    child: _contButton(),
                  ),
                ),
              ),
            ]),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: const Color(0xff525464),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _itemProfile(src: 'assets/svgs/p_icon.svg'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _itemProfile(src: 'assets/svgs/m_icon.svg'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _itemProfile(src: 'assets/svgs/sh_icon.svg'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _contButton() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  0xffE2E2E0,
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "About Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  0xff20C3AF,
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Reviews",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemProfile({required String src}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 0, 0, 0),
        border: Border.all(width: 0.5, color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      height: 60,
      child: Center(
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 0, 0, 0),
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 10, 10, 10),
                    ),
                  ),
                ),
              height: 42.0,
              width: 42.0,
              child: Center(
                child: SvgPicture.asset(src),
              ),
            ),
            Expanded(
              child: Container(
                
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                        child: Text(
                      'Phone number',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    )),
                    Expanded(
                      child: Text(
                        '+3746589923',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
