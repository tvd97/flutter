import 'package:flutter/material.dart';
import 'package:zingclone/src/model/notificationmodel.dart';
import 'package:zingclone/src/screen/paymentscards/detailcardscreen.dart';

class PaymetsCardScreen extends StatelessWidget {
  const PaymetsCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymetsCardScreenBody(),
    );
  }
}

class PaymetsCardScreenBody extends StatefulWidget {
  const PaymetsCardScreenBody({Key? key}) : super(key: key);

  @override
  State<PaymetsCardScreenBody> createState() => _PaymetsCardScreenBodyState();
}

class _PaymetsCardScreenBodyState extends State<PaymetsCardScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _notificationScreenBody(context),
    );
  }

  List<Notifications> entries = [
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
  ];
  Widget _notificationScreenBody(BuildContext context) {
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                  ),
                  child: Center(child: _listView()),
                ),
              ),
              Container(
                height: 60.0,
                margin: const EdgeInsets.only(bottom: 25.0),
                color: const Color(0xFF20C3AF),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsCardScreen(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Add new card",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
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

  Widget _listView() {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (_, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsCardScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: const Color.fromARGB(0, 0, 0, 0),
              border: Border.all(width: 0.5, color: const Color(0xffE2E2E0)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            height: 90.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                children: [
                  Container(
                    height: 42.0,
                    width: 65.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      gradient: index != 2
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment(0.7, 0.3),
                              colors: [
                                Color(0xff02DA80),
                                Color(0xff0284D8),
                              ],
                            )
                          : const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment(0.7, 0.3),
                              colors: [
                                Color(0xffF6A11A),
                                Color(0xffF23B14),
                              ],
                            ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.0,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '**** **** **** 1323',
                                  style: TextStyle(
                                      fontSize: 3.17,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  '10/24',
                                  style: TextStyle(
                                      fontSize: 3.17,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: const Text(
                            '\$3009',
                            style: TextStyle(
                                fontSize: 8.0,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            '**** **** **** 1323',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            '10/2024',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    width: 30.0,
                    child: index == 2
                        ? Image.asset("assets/images/mcard.png")
                        : Image.asset("assets/images/visa.png"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
