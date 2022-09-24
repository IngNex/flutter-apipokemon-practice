import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsObjectScreen extends StatefulWidget {
  final objectDetail;
  final Color color;
  final int heroTag;

  const DetailsObjectScreen(
      {super.key,
      required this.objectDetail,
      required this.color,
      required this.heroTag});

  @override
  State<DetailsObjectScreen> createState() => _DetailsObjectScreenState();
}

class _DetailsObjectScreenState extends State<DetailsObjectScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          /* Object name */
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.objectDetail['name'],
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          /* Object name */
          Positioned(
            top: 130,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                child: Text(
                  widget.objectDetail['type'].join(', '),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26),
            ),
          ),
          /* pokeball */
          Positioned(
            top: height * 0.20,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
              color: Colors.white12.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          /*Cuadro Blanco*/
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("name")],
              ),
            ),
          ),
          /* Object img */
          Positioned(
            top: height * 0.20,
            left: (width / 2) - 100,
            child: new CachedNetworkImage(
              imageUrl: widget.objectDetail['img'],
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
