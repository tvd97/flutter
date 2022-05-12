import 'package:flutter/material.dart';
import 'package:todo_movie/src/screen/detail/detailscreen.dart';

class BuilderAPI extends StatefulWidget {
  BuilderAPI({
    Key? key,
    this.uri,
    this.future,
  }) : super(key: key);

  final String? uri;
  final Future? future;
  double blur = 0.0;
  double getBlur() {
    return blur;
  }

  @override
  State<BuilderAPI> createState() => _BuilderAPIState();
}

class _BuilderAPIState extends State<BuilderAPI> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: widget.future,
      builder: (context, snapshot) {
        // ignore: unnecessary_null_comparison
        if (snapshot.connectionState == ConnectionState.done) {
          return gridviewBuilder(uri: widget.uri, snapshot: snapshot);
        } else {
          return const Center(
            child: Text('khong load du lieu'),
          );
        }
      },
    );
  }

  Widget gridviewBuilder({String? uri, AsyncSnapshot? snapshot}) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        setState(() {
          if (notification.metrics.pixels > 0) {
            widget.blur = 50.0;
          } else {
            widget.blur = 0.0;
          }
        });

        return true;
      },
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 2.5,
            childAspectRatio: 0.7,
          ),
          itemCount: snapshot?.data?.result?.length,
          itemBuilder: (_, index) {
            return Builder(builder: (context) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailFilmScreen(
                            id: snapshot?.data?.result?[index].id),
                      ));
                },
                child: Center(
                  child: snapshot?.data?.result?[index].srcPoster != null
                      ? Image.network(
                          '${widget.uri}${snapshot?.data?.result?[index].srcPoster}')
                      : const Text('loading date'),
                ),
              );
            });
          }),
    );
  }
}
