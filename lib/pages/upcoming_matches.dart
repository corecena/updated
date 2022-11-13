import 'package:flutter/material.dart';
import '../getData/getUpcomingMatches.dart';
import '../main.dart';
import 'homePage.dart';
import 'make_payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class upComingMatches extends StatefulWidget {
  const upComingMatches({Key? key}) : super(key: key);

  @override
  State<upComingMatches> createState() => _upComingMatchesState();
}

class _upComingMatchesState extends State<upComingMatches> {
  //list to hold document ids
  List<String> docIDs = [];

  //GET THE Document ids
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('upcoming')
        .get()
        .then((snapshot) => {
      snapshot.docs.forEach((document) {
        docIDs.add(document.reference.id);
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Column(
              children: const [
                Text('Yo-Ticket', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w900)),
                Text(
                  'Book your tickets early online',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
        body:
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Padding(
          padding: const EdgeInsets.only(left: 90.0, top: 25.0),
          child: Row(
            children: const [
              Icon(Icons.calendar_month),
              Text(
                "Upcoming Matches",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot){
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(title: GetUpcomingMatches(documentId: docIDs[index])),
                  );
                },
              );
            },
          ),
        ),
      ],
    )),
    );
  }
}
