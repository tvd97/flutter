// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  String? title;
  CommonAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        Expanded(
          child: (title == null)
              ? const SizedBox()
              : SizedBox(
                  child: Center(
                    child: Text(
                      ' $title',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          color: Color(0xff525464)),
                    ),
                  ),
                ),
        ),
        IconButton(
          icon: const Icon(Icons.segment_outlined),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ]),
    );
  }
}
