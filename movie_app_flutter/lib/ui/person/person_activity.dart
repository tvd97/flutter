import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/person/person.dart';
import 'package:movie_app_flutter/models/popular.dart';
import 'package:movie_app_flutter/view_model/person/person_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../film/film_activity.dart';

class PersonActivity extends StatelessWidget {
  PersonActivity({Key? key, required this.id}) : super(key: key);
  int id;
  Person? person;
  Popular? movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => PersonViewModel(id: id),
          builder: (context, child) {
            person = context.watch<PersonViewModel>().person;
            movies = context.watch<PersonViewModel>().movies;
            return person == null
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 20.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 50.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          color: Colors.white,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 2 / 3,
                          width: MediaQuery.of(context).size.width,
                          child: person!.profilePath == null
                              ? Container(
                                  height: MediaQuery.of(context).size.height *
                                      2 /
                                      3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      const BoxDecoration(color: Colors.cyan),
                                )
                              : Image.network(
                                  "https://image.tmdb.org/t/p/w500/${person!.profilePath!}",
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).size.height * 5 / 9,
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 10.0, top: 8.0, left: 10.0, bottom: 5.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 5 / 9,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: ",
                                              style: styleText(),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text("Birthday: ",
                                                style: styleText()),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text("Dead day: ",
                                                style: styleText()),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text("Countryside: ",
                                                style: styleText()),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text("Job: ", style: styleText()),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            person!.name!,
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            person!.birthday != null
                                                ? person!.birthday!
                                                : "",
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            person!.deathday == null
                                                ? ""
                                                : person!.deathday!,
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            person!.placeOfBirth == null
                                                ? ""
                                                : person!.placeOfBirth!,
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            person!.knownForDepartment!,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("As know as:", style: styleText()),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 100,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ...List.generate(
                                                person!.alsoKnownAs!.length,
                                                (index) => Text(
                                                  person!.alsoKnownAs![index],
                                                  style: const TextStyle(
                                                      color: Color(0xff81f800)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Biography", style: styleText()),
                                      Text(person!.biography!)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Participating films",
                                        style: styleText(),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 400.0,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: GridView.builder(
                                          controller: context
                                              .watch<PersonViewModel>()
                                              .controller,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 2 / 3),
                                          scrollDirection: Axis.vertical,
                                          itemCount: movies == null
                                              ? 8
                                              : movies!.results!.length,
                                          itemBuilder: (context, index) {
                                            return movies == null
                                                ? Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[300]!,
                                                    highlightColor:
                                                        Colors.grey[100]!,
                                                    enabled: true,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2.0,
                                                                  bottom: 5.0,
                                                                  left: 1.0,
                                                                  right: 3.0),
                                                          width: 100.0,
                                                          color: Colors.white,
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2.0,
                                                                  bottom: 5.0,
                                                                  left: 1.0,
                                                                  right: 3.0),
                                                          width: 100.0,
                                                          height: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2.0,
                                                                  bottom: 0.0,
                                                                  left: 1.0,
                                                                  right: 3.0),
                                                          width: 100.0,
                                                          height: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff000000),
                                                          width: 0.5,
                                                          style: BorderStyle
                                                              .solid),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => FilmActivity(
                                                                    id: movies!
                                                                        .results![
                                                                            index]
                                                                        .id!)),
                                                          );
                                                        },
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            0.5,
                                                                        color: const Color(
                                                                            0xff9a9a9a),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0)),
                                                              child: movies!
                                                                          .results![
                                                                              index]
                                                                          .posterPath ==
                                                                      null
                                                                  ? Image.asset(
                                                                      "images/bear.jpg")
                                                                  : Image
                                                                      .network(
                                                                      "https://image.tmdb.org/t/p/w200/${movies!.results![index].posterPath!}",
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                    ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  TextStyle styleText() {
    return const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    );
  }

// Widget buildListMoviePerson(BuildContext context, Popular? movies) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 400.0,
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(10.0),
//         topRight: Radius.circular(10.0),
//       ),
//     ),
//     child: GridView.builder(
//       controller: context.watch<PersonViewModel>().controller,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, childAspectRatio: 2 / 3),
//       scrollDirection: Axis.vertical,
//       itemCount: movies!.results == null ? 8 : movies.results!.length,
//       itemBuilder: (context, index) {
//         return movies.results == null
//             ? Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 enabled: true,
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
//                       width: 100.0,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 2.0, bottom: 5.0, left: 1.0, right: 3.0),
//                       width: 100.0,
//                       height: 20.0,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           top: 2.0, bottom: 0.0, left: 1.0, right: 3.0),
//                       width: 100.0,
//                       height: 20.0,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               )
//             : Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: const Color(0xff000000),
//                       width: 0.5,
//                       style: BorderStyle.solid),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 child: Center(
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 FilmActivity(id: movies.results![index].id!)),
//                       );
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                 width: 0.5,
//                                 color: const Color(0xff9a9a9a),
//                               ),
//                               borderRadius: BorderRadius.circular(5.0)),
//                           child: movies.results![index].posterPath == null
//                               ? Image.asset("images/bear.jpg")
//                               : Image.network(
//                                   "https://image.tmdb.org/t/p/w200/${movies.results![index].posterPath!}",
//                                   fit: BoxFit.fitHeight,
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//       },
//     ),
//   );
// }
}
