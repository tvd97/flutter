import 'package:flutter/material.dart';
import 'package:zingclone/src/screen/construction/model/construction.dart';
import 'package:zingclone/src/screen/payment/paymentscreen.dart';

class ConstructionScreen extends StatelessWidget {
  const ConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConstructionScreenBody(),
    );
  }
}

class ConstructionScreenBody extends StatefulWidget {
  const ConstructionScreenBody({Key? key}) : super(key: key);

  @override
  State<ConstructionScreenBody> createState() => _ConstructionScreenBodyState();
}

class _ConstructionScreenBodyState extends State<ConstructionScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _constructionbody(),
    );
  }

  List<Construction> entries = [
    Construction(
      id: 1,
      text: "Welding works",
      icon: Icons.check,
      color: const Color(0xffffb19d),
    ),
    Construction(
      id: 2,
      text: "Foundation works",
      icon: Icons.check,
      color: const Color(0xffffb19d),
    ),
    Construction(
      id: 3,
      text: "Roofing",
      icon: Icons.add,
      color: const Color(0xffF7F7F7),
    ),
    Construction(
      id: 4,
      text: "Waterproofing",
      icon: Icons.check,
      color: const Color(0xffffb19d),
    ),
    Construction(
      id: 5,
      text: "Architecture",
      icon: Icons.add,
      color: const Color(0xffF7F7F7),
    ),
    Construction(
      id: 6,
      text: "Design",
      icon: Icons.add,
      color: const Color(0xffF7F7F7),
    ),
  ];
  Widget _constructionbody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
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
                    child: Text(
                      'Construction works',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: null,
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 60.0,
            color: const Color.fromARGB(255, 235, 234, 234),
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Icon(Icons.search),
                ),
                 const SizedBox(width: 10.0,),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by categories ',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Center(child: _listView())),
          ),
          Expanded(
            child: Container(
              height: 60.0,
              padding: const EdgeInsets.only(bottom: 40.0),
              child: InkWell(
                child: _contButton(context),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (_, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: entries[index].color),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          alignment: Alignment.center,
          height: 60,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  entries[index].text,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              Container(
                width: 60,
                color: entries[index].color,
                child: Center(child: Icon(entries[index].icon)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: const Color(
                    0xffE2E2E0,
                  ),
                ),
              ),
              child: const Center(child: Text("Skip")),
            ),
          ),
        ),
        const SizedBox(width: 15.0,),
        Expanded(
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                 color: Color(
                    0xff20C3AF,
                  ),
              ),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: const Text("Done",style: TextStyle(color: Colors.white),)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
