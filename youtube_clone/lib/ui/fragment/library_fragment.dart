import 'package:flutter/material.dart';
import 'package:youtube_clone/ui/component/app_bar.dart';
import 'package:youtube_clone/ui/download/download_page.dart';

import '../history/history_page.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWith = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarComponent(context: context,),
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        removeTop: true,
        child: SizedBox(
          width: maxWith,
          height: maxHeight -
              kBottomNavigationBarHeight -
              AppBar().preferredSize.height -
              30,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12.0, left: 10.0),
                width: maxWith,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recent"),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, child) => InkWell(
                          onTap: () {
                            // showGeneralDialog(
                            //     barrierDismissible: false,
                            //     barrierColor: Colors.black12.withOpacity(0.3),
                            //     context: context,
                            //     pageBuilder: (ctx, __, ___) => GestureDetector(
                            //         onPanUpdate: (event) {
                            //           if (event.delta.dx > 0 &&
                            //               event.delta.dx < 280) {
                            //             Navigator.pop(ctx);
                            //           }
                            //         },
                            //         child:  PlayPage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            padding: const EdgeInsets.all(4.0),
                            width: 200.0,
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.purple,
                                  height: 120.0,
                                  width: 200.0,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 5.0, left: 5.0, top: 5.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "cuoc song o cty",
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            Text("name")
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.more_vert_outlined)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.black54,
                height: 3.0,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 25.0, left: 20.0, right: 10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HistoryPage()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(Icons.restore_outlined),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("History"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.play_circle),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Your videos"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DownloadPage()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.download_outlined),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: const [
                                Text("Downloads"),
                                Text("67 videos"),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.check_circle)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.local_movies),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Your movies"),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.access_time_outlined),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: const [
                              Text("Watch later"),
                              Text("67 videos"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black54,
                height: 3.0,
              ),
              Container(
                width: maxWith,
                padding: const EdgeInsets.only(
                    top: 20.0, left: 12.0, right: 15.0, bottom: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text("Playlists"),
                        Spacer(),
                        Text("Recently added"),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.add),
                        SizedBox(width: 10.0),
                        Text("New playlist")
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 20.0,
                                height: 20.0,
                                color: Colors.blueGrey),
                            const SizedBox(width: 10.0),
                            Column(
                              children: const [
                                Text("data"),
                                Text("data"),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
