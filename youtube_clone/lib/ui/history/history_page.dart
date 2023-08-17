import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          automaticallyImplyLeading: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text("History",style: TextStyle(color: Colors.black87),),
          actions: const [
            Icon(
              Icons.connected_tv_outlined,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.notifications_none_sharp,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.search_outlined,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity - AppBar().preferredSize.height - 5.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Stack(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration.collapsed(
                              border: InputBorder.none,
                              hintText: 'Enter a search term',
                            ),
                           // style: const TextStyle(height: 2.5),
                            autofocus: false,
                          ),
                          const Positioned(
                            right: 5.0,
                            top: 0.0,
                            bottom: 0.0,
                            child: Icon(Icons.search),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 3.0,
                    color: Colors.black26,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Today"),
                        Container(
                          height: 350,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/pngaaa.png"),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text("Storts")
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 20.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...List.generate(
                                          10,
                                          (index) => Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0,
                                                    bottom: 10.0,
                                                    right: 10.0),
                                                width: 200.0,
                                                height: 300.0,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      color:
                                                          Colors.yellowAccent,
                                                    ),
                                                    const Positioned(
                                                      top: 10.0,
                                                      right: 10.0,
                                                      child:
                                                          Icon(Icons.more_vert),
                                                    ),
                                                    Positioned(
                                                        bottom: 5.0,
                                                        left: 5.0,
                                                        child: SizedBox(
                                                          width: 170.0,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                  text:
                                                                      const TextSpan(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        color: Colors
                                                                            .black87),
                                                                    text:
                                                                        "Em cảm ơn và chúc cả nhà một buổi chiều làm việc vui vẻ không quạo ạ✨",
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 3),
                                                              const Text(
                                                                  "24M views")
                                                            ],
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                          10,
                          (index) => Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 100.0,
                                  color: Colors.cyanAccent,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width:
                                      MediaQuery.of(context).size.width - 230,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black87),
                                            text:
                                                "Em cảm ơn và chúc cả nhà một buổi chiều làm việc vui vẻ không quạo ạ✨",
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3),
                                      const Text("laydadsdasd"),
                                      const Text("5.5m views")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
