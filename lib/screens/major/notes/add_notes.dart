import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/widgets/Text/title.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  int colorId = Random().nextInt(AppStyle.cardColors.length);

  String title = "";
  String content = "";
  String date = DateTime.now().toString().substring(0, 10);
  String time = DateTime.now().toString().substring(11, 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColors[colorId],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: AppStyle.cardColors[colorId],
        title: const TitleText(
            title: "Add A New Note", fontSize: 20, color: Colors.white),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    hintText: "Enter a title for your note",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      content = value;
                    });
                  },
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text(
                      "Content",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    labelStyle: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    hintText: "Enter the content of your note",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : AppStyle.primaryColor,
            onPressed: title.isEmpty || content.isEmpty
                ? // Add a snackbar to show the user that they need to enter a title and content
                () {
                    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
                  }
                : () async {
                    await FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": title,
                      "note_content": content,
                      "created_date": date,
                      "created_time": time,
                      "color_id": colorId,
                    }).then((value) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successSnackBar);
                    }).catchError((error) {
                      if (kDebugMode) {
                        print(error);
                      }
                    });
                  },
            child: Icon(
              Icons.save,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppStyle.primaryColor
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  get successSnackBar => SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Note Added Successfully",
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      );

  get errorSnackBar => SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Please enter a title and content",
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
}
