import 'package:cloud_firestore/cloud_firestore.dart';
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
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   Navigator.pushNamed(context, '/add');
        // },
        child: Icon(Icons.add),
      ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TitleText(title: "Your Recent Notes", fontSize: 22)),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              // show loading spinner while data is loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              // if data is loaded, show the data
              else if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: TitleText(
                                title: snapshot.data.docs[index]
                                    .data()["note_title"],
                                fontSize: 20),
                            subtitle: ContentText(
                              title: snapshot.data.docs[index]
                                  .data()["note_content"],
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("Notes")
                                      .doc(snapshot.data.docs[index].id)
                                      .delete();
                                }),
                          );
                        }));
              }
              // if no data is loaded, show a message
              else {
                return const Center(child: Text("No notes found"));
              }
            },
          ),
        ],
      ),
    );
  }
}
