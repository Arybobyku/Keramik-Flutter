import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/model/keramik_model.dart';

class BookContainer extends StatelessWidget {
  const BookContainer(
      {Key? key,
      this.imageHeight = 200,
      this.onTapBook,
      required this.keramikModel})
      : super(key: key);
  final double imageHeight;
  final KeramikModel keramikModel;
  final Function()? onTapBook;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBook,
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: keramikModel.gambar!,
              imageBuilder: (context, imageProvider) => Container(
                height: imageHeight,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10),
            Text(
              keramikModel.nama ?? "-",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Expanded(
              child: Text(
                keramikModel.ruang ?? "-",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
