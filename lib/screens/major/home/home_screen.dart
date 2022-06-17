import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/screens/major/notes/add_notes.dart';
import 'package:notesify/screens/major/notes/notes_details.dart';
import 'package:notesify/widgets/Cards/notes_card.dart';
import 'package:notesify/widgets/Text/title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : AppStyle.primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNotes(),
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppStyle.primaryColor
                  : Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: TitleText(
          title: "Notesify",
          fontSize: 25,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : AppStyle.primaryColor,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppStyle.primaryColor
            : Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TitleText(title: "Your Recent Notes", fontSize: 22)),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // show loading spinner while data is loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                // if data is loaded, show the data
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotesDetails(
                                      doc: note,
                                    ),
                                  ),
                                );
                              }, note))
                          .toList(),
                    ),
                  );
                }
                // if no data is loaded, show a message
                else {
                  return const Center(
                      child: Text("No notes found",
                          style: TextStyle(fontSize: 20, color: Colors.white)));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
