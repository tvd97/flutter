import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/ui/fragment/home/home_bloc.dart';
import 'package:youtube_clone/ui/fragment/home/home_event.dart';
import 'package:youtube_clone/ui/fragment/home/home_state.dart';

class AppBarComponent extends AppBar implements StatefulWidget {
  AppBarComponent({super.key,required this.context});

  bool isVisible = true;
  BuildContext context;
  TextEditingController search = TextEditingController();

  @override
  Color? get backgroundColor => Colors.white;

  @override
  double? get elevation => 1.0;

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get title => Image.asset(
        "assets/images/ytb_logo.jpg",
        fit: BoxFit.fitWidth,
        height: 20.0,
      );

  @override
  List<Widget>? get actions => [

        Visibility(
          visible: !isVisible,
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
              SizedBox(
                height: 40,
                width: double.infinity * 0.6,
                child: BlocProvider(
                  create: (context) => HomeBloc(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {
                            if (search.text.isNotEmpty) {
                              context
                                  .read<HomeBloc>()
                                  .add(SearchEvent(search.text));
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: const Icon(Icons.search),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        hintStyle: const TextStyle(fontSize: 17),
                        suffixIcon: const Icon(Icons.clear),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {

                  setState() {
                    isVisible = !isVisible;
                    print(isVisible);
                  }

                },
                icon: const Icon(
                  Icons.clear,
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
            onPressed: () {
              setState() {
                isVisible = !isVisible;
                print(isVisible);
              }
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

      ];
}


