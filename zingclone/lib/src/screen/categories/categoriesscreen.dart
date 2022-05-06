import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zingclone/src/screen/common/drawer.dart';
import 'package:zingclone/src/screen/paymentscards/paymetscardscreen.dart';
import 'package:zingclone/src/screen/profile/profilesrceen.dart';
import '../../model/categoriesmodel.dart';
import '../common/appbar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreenBody(),
    );
  }
}

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);
  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  final List<Categories> entries = [
    Categories(
        id: 1, name: 'Furniture works', icon: 'assets/svgs/furniture_icon.svg'),
    Categories(
        id: 2, name: 'Cleaning services', icon: 'assets/svgs/clean_icon.svg'),
    Categories(
        id: 3,
        name: 'Equipment repair',
        icon: 'assets/svgs/equipment_icon.svg'),
    Categories(
        id: 4, name: 'Courier services', icon: 'assets/svgs/courier_icon.svg'),
    Categories(
        id: 5, name: 'Interior design', icon: 'assets/svgs/furniture_icon.svg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return _categoriesbody();
      }),
      endDrawer: const CommonDrawer(),
    );
  }

  Widget _categoriesbody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
           CommonAppBar(title:"Categories",),
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
                const SizedBox(
                  width: 10.0,
                ),
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
                padding: const EdgeInsets.symmetric(vertical: 20.0),
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
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          //color: const Color.fromARGB(255, 255, 255, 255),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                height: 80,
                width: 80,
                color: const Color.fromARGB(255, 232, 236, 236),
                child: Center(
                  child: SvgPicture.asset(entries[index].icon),
                ),
              ),
              Text(
                "Item ${entries[index].name}",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymetsCardScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(
                    0xffFFFFFF,
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xffE2E2E0),
                  )),
              child: const Center(
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  0xff20C3AF,
                ),
              ),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
