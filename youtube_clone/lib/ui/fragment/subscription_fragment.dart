import 'package:flutter/material.dart';
import 'package:youtube_clone/ui/component/app_bar.dart';

class Subscription extends StatelessWidget {
  Subscription({Key? key}) : super(key: key);
  List<String> list = [
    "Today",
    "Yesterday",
    "This week",
    "This month",
    "Continues"
  ];

  @override
  Widget build(BuildContext context) {
    double maxWith = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarComponent(context: context,),
      body: SizedBox(
        width: maxWith,
        height: maxHeight -
            kBottomNavigationBarHeight -
            AppBar().preferredSize.height -
            5.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                width: maxWith,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: maxWith - 50,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                10,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 7.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.cyan,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 3.5,
                                            right: 6.0,
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Text("name abcd"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "All",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 5.0,
                color: Colors.black,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
                height: 50.0,
                width: maxWith,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 3.0),
                      width: 70.0,
                      height: 25.0,
                      decoration: const BoxDecoration(
                        color: Color(0xffbeb8b8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.outbond, size: 20.0),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("All")
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          width: 2.0,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          width: 2.0,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ...List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        decoration: const BoxDecoration(
                          color: Color(0xffbeb8b8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Text(list[index]),
                      ),
                    ),
                  ]),
                ),
              ),
              ...List.generate(
                20,
                (index) => SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        height: 240,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        height: 60,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Column(
                              children: const [Text("abcxyz"), Text("data")],
                            ),
                            const Spacer(),
                            const Icon(Icons.more_vert)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
