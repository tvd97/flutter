import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    required this.context,
  }) : super(key: key);

  final String?  title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 64, 64, 160),
      child: Stack(
        children: [
          Center(
            child: Text( '$title',
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                )),
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 43, 43, 172),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(40.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ))
        ],
      ),
    );
  }
}
