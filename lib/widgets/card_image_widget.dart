import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImageSample extends StatelessWidget {
  String url;
  String? caption;

  CardImageSample({
    super.key,
    required this.url,
    this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Column(
        children: [
          Image.asset(url),
          if (caption != null)
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                caption ?? 'No caption',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
        ],
      ),
    );
  }
}
