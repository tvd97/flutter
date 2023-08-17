import 'package:flutter/material.dart';

class ShortVideo extends StatelessWidget {
  const ShortVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWith = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      removeTop: true,
      child: SizedBox(
          width: maxWith,
          height: maxHeight,
          child: Stack(
            children: [
              Container(
                width: maxWith,
                height: maxHeight,
                color: Colors.yellow,
              ),
              Positioned(
                bottom: 30.0,
                right: 15.0,
                child: SizedBox(
                  width: 30.0,
                  child: Column(
                    children: const [
                      Icon(Icons.account_circle),
                      Icon(Icons.account_circle),
                      Icon(Icons.account_circle),
                      Icon(Icons.account_circle),
                      Icon(Icons.account_circle),
                      Icon(Icons.account_circle)
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 30.0,
                  left: 10.0,
                  child: Container(
                    height: 200.0,
                    width: maxWith * 3 / 4,
                    color: Colors.cyan,
                  ))
            ],
          ),
        ),

    );
  }
}
