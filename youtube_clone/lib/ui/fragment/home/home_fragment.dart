import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/bloc/app_bloc.dart';
import 'package:youtube_clone/bloc/app_event.dart';
import 'package:youtube_clone/model/entities/video.dart';
import 'package:youtube_clone/ui/fragment/home/home_bloc.dart';
import 'package:youtube_clone/ui/fragment/home/home_event.dart';
import 'package:youtube_clone/ui/fragment/home/home_state.dart';
import 'package:youtube_clone/ui/play/play_bloc.dart';
import 'package:youtube_clone/ui/play/play_event.dart';
import 'package:youtube_clone/ui/play/play_page.dart';

class HomeFragment extends StatefulWidget {
   const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isVisible = true;
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double maxWith = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading : false,
        title: Image.asset(
          "assets/images/ytb_logo.jpg",
          fit: BoxFit.fitWidth,
          height: 20.0,
        ),
        actions: [
          Visibility(
            visible: !isVisible,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.amberAccent,
                        controller: search,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          hintStyle: const TextStyle(fontSize: 17),
                          suffixIcon: InkWell(
                            onTap: () {
                              if (search.text.isNotEmpty) {
                                context.read<HomeBloc>().add(SearchEvent(search.text));
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: const Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      search.text="";
                      isVisible = !isVisible;
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Row(
              children: [
                const Icon(
                  Icons.connected_tv_outlined,
                  color: Colors.black87,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.black87,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.account_circle,
                  color: Colors.black87,
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
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
                AppBar().preferredSize.height - 10.0,
            child:
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is VideoLoading && state.firstLoading) {
                return const SizedBox();
              }
              List<Video> videos = [];
              bool isLoading = false;
              if (state is VideoLoading) {
                videos = state.old;
              }
              if (state is VideoLoadingFinished) {
                videos = state.videos;
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 7.0),
                      height: 50.0,
                      width: maxWith,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 3.0),
                            width: 100.0,
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
                                Text("Explore")
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
                            10,
                                (index) => Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 3.0),
                              decoration: const BoxDecoration(
                                color: Color(0xffbeb8b8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: const Text("Explore"),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    ...List.generate(
                      videos.length,
                          (index) => Container(
                        margin: const EdgeInsets.only(bottom: 7.0),
                        height: 300,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showGeneralDialog(
                                    barrierDismissible: false,
                                    barrierColor:
                                    Colors.black12.withOpacity(0.3),
                                    context: context,
                                    pageBuilder: (ctx, __, ___) =>
                                        GestureDetector(
                                            onPanUpdate: (event) {
                                              if (event.delta.dx > 0 &&
                                                  event.delta.dx < 280) {
                                                Navigator.pop(ctx);
                                              }
                                            },
                                            child:
                                            MultiBlocProvider(providers: [
                                              BlocProvider(
                                                create: (_) => AppBloc()
                                                  ..add(PlayVideoEvent(
                                                    video: videos[index],
                                                  )),
                                              ),
                                              BlocProvider(
                                                create: (_) => PlayBloc()
                                                  ..add(PlayLoadVideoEvent(
                                                      videos[index].id!)),
                                              ),
                                            ], child: PlayPage())));
                              },
                              child: Container(
                                height: 240,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(videos[index]
                                            .snippet
                                            ?.thumbnails
                                            ?.medium
                                            ?.url ??
                                            'https://i0.wp.com/caphekhoanbetong.com/wp-content/uploads/2021/09/cac-mui-vi-cua-mot-ly-cafe-ngon-va-dat-chuan.jpg?fit=750%2C547&ssl=1'))),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: 5.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.red,
                                    width: 50,
                                    height: 50.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            videos[index].snippet?.title ??
                                                'No title',
                                            maxLines: 2,
                                          ),
                                          Text(
                                            videos[index]
                                                .snippet
                                                ?.channelTitle ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
              );
            }),
          )),
    );
  }
}

