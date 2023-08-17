import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

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
          title: const Text(
            "Download",
            style: TextStyle(color: Colors.black87),
          ),
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
        body: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: double.infinity - AppBar().preferredSize.height - 5.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            width: MediaQuery.of(context).size.width - 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
            )),
      ),
    );
  }
}
