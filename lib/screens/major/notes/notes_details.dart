import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/screens/major/notes/add_notes.dart';
import 'package:notesify/screens/major/notes/edit_notes.dart';
import 'package:notesify/widgets/Text/content_text.dart';
import 'package:notesify/widgets/Text/title.dart';

class NotesDetails extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NotesDetails({Key? key, required this.doc}) : super(key: key);

  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardColors[color_id],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppStyle.cardColors[color_id],
        title: TitleText(
            title: 'Notes details', fontSize: 22, color: Colors.white),
        centerTitle: true,
        actions: [
          // Pop up menu for the app bar
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'delete') {
                FirebaseFirestore.instance
                    .collection('Notes')
                    .doc(widget.doc.id)
                    .delete();

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
              }
              if (value == 'edit') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNotes(note: widget.doc),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'delete',
                child: ContentText(
                  title: 'Delete',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              PopupMenuItem(
                value: 'edit',
                child: ContentText(
                  title: 'Edit',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              title: widget.doc['note_title'],
              fontSize: 20,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            TitleText(
              title: widget.doc["created_date"],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            const SizedBox(
              height: 25,
            ),
            ContentText(
              title: widget.doc["note_content"],
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              color: Colors.white,
              fontSize: 18,
            ),
          ],
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
              "Note Deleted Successfully",
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
}
