import 'package:flutter/material.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/widgets/Text/content_text.dart';
import 'package:notesify/widgets/Text/title.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: TitleText(
          title: "Notesify",
          fontSize: 25,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppStyle.primaryColor
            : Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ContentText(title: "THis is good")],
        ),
      ),
    );
  }
}
