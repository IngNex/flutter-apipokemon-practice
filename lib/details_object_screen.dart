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
    return Scaffold(
      backgroundColor: widget.color,
    );
  }
}
