import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_movie/src/model/home/homebutton.dart';
import 'package:todo_movie/src/screen/home/itembuider.dart';

class MenuBottomBar extends StatelessWidget {
  const MenuBottomBar({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<HomeButton> data;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              data.length,
              (index) =>
                  ItemBuider(icon: data[index].data, text: data[index].text),
            )
          ],
        ),
      ),
    );
  }
}
