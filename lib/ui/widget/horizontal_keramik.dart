import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:keramik/model/keramik_model.dart';

class HorizontalKeramik extends StatelessWidget {
  const HorizontalKeramik({Key? key, required this.keramikModel,this.total}) : super(key: key);

  final KeramikModel keramikModel;
  final double? total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: keramikModel.gambar!,
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
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
        SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                keramikModel.nama ?? "-",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                keramikModel.deskripsi ?? "-",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              if(total!=null)
              Text(
                "Hasil : ${total!.toStringAsFixed(4)}%",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
            ],
          ),
        )
      ],
    );
  }
}
