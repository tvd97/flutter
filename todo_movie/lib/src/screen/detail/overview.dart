import 'package:flutter/material.dart';
import 'package:todo_movie/src/model/filmdetail/filmdetail.dart';
import 'package:todo_movie/src/model/filmdetail/imagefilm.dart';

class OverView extends StatelessWidget {
  const OverView({
    Key? key,
    required this.uriitem,
    required this.snapshot,
    required this.imagefilm,
  }) : super(key: key);

  final String uriitem;
  final AsyncSnapshot<DetailFilm> snapshot;
  final Future<ImageFIlm> imagefilm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0),
          top: BorderSide(width: 1.0),
        ),
      ),
      height: 250,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ImageItem(
                uriitem: uriitem,
                snapshot: snapshot,
                imagefilm: imagefilm,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 140.0,
              margin: const EdgeInsets.only(top: 8.0),
              child: Text('${snapshot.data?.overview}'),
            )
          ]),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key? key,
      required this.uriitem,
      required this.snapshot,
      required this.imagefilm})
      : super(key: key);

  final String uriitem;
  final AsyncSnapshot<DetailFilm> snapshot;
  final Future<ImageFIlm> imagefilm;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageFIlm>(
        future: imagefilm,
        builder: (context, image) {
        return  Row(
            children: [
              ...List.generate(10, (index) {
                return image.data?.posters?[index].filePath != null
                    ? Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 1.0)),
                        margin: const EdgeInsets.all(4.0),
                        height: 92.0,
                        width: 92.0,
                        child: Image.network(
                            '$uriitem${image.data?.posters?[index].filePath}'),
                      )
                    : Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 1.0)),
                        height: 92.0,
                        margin: const EdgeInsets.all(4.0),
                        width: 92.0,
                      );
              }),
            ],
          );
        });
  }
}
