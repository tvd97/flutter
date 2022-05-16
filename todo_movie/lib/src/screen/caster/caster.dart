import 'package:flutter/material.dart';
import 'package:todo_movie/src/common/apivariable.dart';
import 'package:todo_movie/src/model/person/person.dart';
import 'package:todo_movie/src/network/networkapi.dart';
import 'package:todo_movie/src/screen/common/appbarcustom.dart';

class CasterScreen extends StatefulWidget {
  CasterScreen({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  State<CasterScreen> createState() => _CasterScreenState(id: id);
}

class _CasterScreenState extends State<CasterScreen>
    with TickerProviderStateMixin {
  _CasterScreenState({required this.id});
  String person = ApiVariable.urlperson;
  String key = ApiVariable.apikey;
  String w92 = ApiVariable.url92image;
  String w300 = ApiVariable.url300image;
  int id;
  late Future<Person> data;
  late TabController _tabController;
  @override
  void initState() {
    id = id;
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    data = NetworkAPI().fetchPerson('$person$id$key');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: FutureBuilder<Person>(
            future: data,
            builder: (context, snapshot) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    AppBarCustom(
                        title: '${snapshot.data?.name}', context: context),
                    Expanded(
                      child: SizedBox(
                        child: Column(children: [
                          Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.5)),
                            height: 200.0,
                            child: Stack(children: [
                              // Container(
                              //   decoration:BoxDecoration(

                              //   ),
                              //   padding: EdgeInsets.only(top: 15.0),
                              //   child: Image.network(
                              //       '${w300}${snapshot.data?.profilePath}'),
                              // ),
                              Center(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(
                                      '$w300${snapshot.data?.profilePath}'),
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: TabBar(
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black26),
                              labelColor: const Color.fromARGB(0, 0, 0, 0),
                              isScrollable: true,
                              controller: _tabController,
                              tabs: const <Widget>[
                                Tab(
                                  child: Text(
                                    'Biography',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Movie',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  SingleChildScrollView(
                                      child:
                                          Text('${snapshot.data?.biography}', style: TextStyle(color: Colors.white),)),
                                  SingleChildScrollView(
                                      child:
                                          Text('${snapshot.data?.birthday}', style: TextStyle(color: Colors.white),)),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
