import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/profile/profilesrceen.dart';
import 'package:zingclone/src/screen/setting/settingscreen.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff525464),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 132.0),
        color: const Color(0xff323440),
        child: ListView(children: <Widget>[
          _buidItem(
            text: 'Home',
            icon: const Icon(Icons.home),
            click: () => _selectitem(context, 0),
          ),
          _buidItem(
            text: 'Profile',
            icon: const Icon(Icons.account_circle_sharp),
            click: () => _selectitem(context, 1),
          ),
          _buidItem(
            text: 'Settings',
            icon: const Icon(Icons.settings),
            click: () => _selectitem(context, 2),
          ),
          _buidItem(
            text: 'Messages',
            icon: const Icon(Icons.mail),
            click: () => _selectitem(context, 3),
          ),
        ]),
      ),
    );
  }

  Widget _buidItem(
      {required String text, required Icon icon, VoidCallback? click}) {
    return InkWell(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40.0),
        height: 75,
        width: 100,
        child: Column(
          children: [
            CircleAvatar(
              child: icon,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _selectitem(BuildContext context, int index) {

  switch (index) {
    case 0:
      break;
    case 1:
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        ),
      );
      break;
    case 3:
      break;
  }
}
