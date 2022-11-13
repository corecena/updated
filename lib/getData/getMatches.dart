import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetMatches extends StatelessWidget {
  final String documentId;
  const GetMatches({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference matches = FirebaseFirestore.instance.collection('matches');
    return FutureBuilder<DocumentSnapshot>(
      future: matches.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          /*return Text( '${data['TeamOne']}'' ' + 'Vs' + ' ''${data['TeamTwo']}'  +
              ' ' +  'Goals: ${data['Goals']} ', style: const TextStyle(fontWeight: FontWeight.bold),);*/
          return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: Icon(Icons.sports_soccer),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${data['TeamOne']}'' ' '-' ' ''${data['TeamTwo']}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Goals: ${data['Goals']}',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 30.0,
                            height: 50.0,
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: Icon(Icons.sports_soccer)
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return  const Text('loading.....');
      }),
    );
  }
}