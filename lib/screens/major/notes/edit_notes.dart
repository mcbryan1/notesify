import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/screens/major/home/home_screen.dart';
import 'package:notesify/widgets/Text/title.dart';

// ignore: must_be_immutable
class EditNotes extends StatefulWidget {
  QueryDocumentSnapshot note;
  EditNotes({Key? key, required this.note}) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String updatedTitle = "";
  String updatedContent = "";

  @override
  void initState() {
    updatedTitle = widget.note['note_title'];
    updatedContent = widget.note['note_content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColors[widget.note['color_id']],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: AppStyle.cardColors[widget.note['color_id']],
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
                TextFormField(
                  initialValue: widget.note['note_title'],
                  onChanged: (value) => updatedTitle = value,
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
                  initialValue: widget.note['note_content'],
                  onChanged: (value) => updatedContent = value,
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
            onPressed: updatedTitle.isEmpty || updatedContent.isEmpty
                ? // Add a snackbar to show the user that they need to enter a title and content
                () {
                    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
                  }
                : () async {
                    // Update the note in the database
                    await FirebaseFirestore.instance
                        .collection('Notes')
                        .doc(widget.note.id)
                        .update({
                      'note_title': updatedTitle,
                      'note_content': updatedContent,
                    }).then((value) {
                      // Navigate back to the notes screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
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
              "Note Eddited Successfully",
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
