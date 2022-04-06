import 'package:flutter/material.dart';

class GalleryImage extends StatefulWidget {
  const GalleryImage({Key? key,required this.image}) : super(key: key);
  final String image;

  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.grey[900]!,),
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Center(
          child: Image.asset(widget.image,fit: BoxFit.contain,)
          ,
        ),
      ),
    );
  }
}
