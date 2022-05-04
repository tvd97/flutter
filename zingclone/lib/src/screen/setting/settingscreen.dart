import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/paymentscards/paymetscardscreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettingScreenBody(),
    );
  }
}

class SettingScreenBody extends StatefulWidget {
  const SettingScreenBody({Key? key}) : super(key: key);

  @override
  State<SettingScreenBody> createState() => _SettingScreenBodyState();
}

class _SettingScreenBodyState extends State<SettingScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _settingBody(context),
    );
  }

  Widget _settingBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        children: [
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
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600),
                    ),
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
            flex: 3,         
            child: Column(
              children: [
                _itemColumn('Payment cards'),
                _itemColumn('Write to us'),
                _itemColumn('Rate us on app store'),
                _itemColumn('About Us'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymetsCardScreen(),
                          ),
                        );
                    },
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                          color: Color(0xffFFB19D),
                          fontSize: 16.0,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _itemColumn(String text) {
    return Container(
      height: 80.0,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffF7F7F7),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
