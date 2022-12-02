import 'package:flutter/material.dart';
import 'package:pet_app/widgets/video_top.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xff6f00ff))),
      body: ListView(children: [VideoTop()]),
    );
  }
}
