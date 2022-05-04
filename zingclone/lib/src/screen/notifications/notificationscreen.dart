import 'package:flutter/material.dart';
import 'package:zingclone/src/model/notificationmodel.dart';
import 'package:zingclone/src/screen/construction/constructionscreen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationScreenBody(),
    );
  }
}

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({Key? key}) : super(key: key);

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _notificationScreenBody(context),
    );
  }

  List<Notifications> entries = [
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
    Notifications(id: 1, src: "", name: "", company: "", content: ""),
  ];
  Widget _notificationScreenBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 15.0,
            ),
            child: Column(children: [
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
                        child: Text('Notification'),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                  ),
                  child: Center(child: _listView()),
                ),
              ),
              InkWell(
                child: Container(
                  height: 60.0,
                  margin: const EdgeInsets.only(bottom: 40.0),
                  color: const Color(0xFF20C3AF),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConstructionScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (_, int index) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(0, 0, 0, 0),
            border: Border(
              
                bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 10, 10, 10))),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          height: 190.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                  child: Row(
                    children: [
                      const Center(
                        child: SizedBox(
                          // decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     borderRadius: BorderRadius.circular(54.0)),
                          height: 54.0,
                          width: 54.0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/img.png'),
                            radius: 54.0,                       
                          
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: const [
                              Expanded(
                                child: Text("Joel Rowe"),
                              ),
                              Expanded(
                                child: Text("Joel Rowe"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    height: 100,
                    child: const Text(
                        'Sorry, all the artists in the Interior Design category are busy right now. If your task is still relevant - go to the task details page and click "Extend task”.'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
