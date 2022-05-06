import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zingclone/src/screen/common/drawer.dart';
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
      endDrawer: const CommonDrawer(),
      body: Builder(builder: (context) {
        return _profileBody(context);
      }),
    );
  }

  Widget _profileBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          borderRadius: BorderRadius.circular(125),
                          border: Border.all(width: 0.5, color: Colors.black),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avata.png'),
                        ),
                        width: 125.0,
                        height: 125.0,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Center(
                        child: Text(
                      'Jeremías del Pozo',
                      style: TextStyle(
                        color: Color(0xff525464),
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    )),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'New York',
                            style: TextStyle(
                              color: Color(0xff838391),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            height: 5.0,
                            width: 5.0,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffB5C3C7),
                            ),
                          ),
                          const Text(
                            'ID: 1120611',
                            style: TextStyle(
                              color: Color(0xff838391),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xffFFB19D),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 40.0),
                  child: _contButton()),
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
                  _itemProfile(
                      src: 'assets/svgs/p_icon.svg',
                      text: 'Phone number',
                      ntext: '+3746589923'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _itemProfile(
                      src: 'assets/svgs/m_icon.svg',
                      text: 'Email',
                      ntext: 'conrad@gmail.com'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  _itemProfile(
                      src: 'assets/svgs/sh_icon.svg',
                      text: 'Completed projects',
                      ntext: '248'),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderScreen(),
                ),
              );
            },
            child: Container(
              height: 60.0,
              decoration: const BoxDecoration(
                color: Color(
                  0xffE2E2E0,
                ),
              ),
              child: const Center(
                child: Text(
                  "About Me",
                  style: TextStyle(
                    color: Color(0xff838391),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: Container(
              height: 60.0,
              decoration: const BoxDecoration(
                color: Color(
                  0xff20C3AF,
                ),
              ),
              child: const Center(
                child: Text(
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
      ],
    );
  }

  Widget _itemProfile(
      {required String src, required String text, required String ntext}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(0, 0, 0, 0),
        border: Border.all(width: 1.0, color: const Color(0xffE2E2E0)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(0, 0, 0, 0),
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Color(0xffECECEB),
                ),
              ),
            ),
            padding: const EdgeInsets.only(right: 10.0),
            height: 42.0,
            width: 52.0,
            child: Center(
              child: SvgPicture.asset(src),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  ntext,
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
