import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/make_payment.dart';

class GetUpcomingMatches extends StatelessWidget{
  final String documentId;
  const GetUpcomingMatches({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context){
    CollectionReference upcoming = FirebaseFirestore.instance.collection('upcoming');
    List<String> teamsSelected = [];
    return FutureBuilder<DocumentSnapshot>(
      future: upcoming.doc(documentId).get(),
      builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          //print(data.values.toList());
          List<dynamic> matchDetails = data.values.toList();
            //print(data.values.contains(true));
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
                                '${data['TeamOne']}'' ' 'Vs' ' ''${data['TeamTwo']}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Time: ${data['KickOff']}',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900),
                              ),

                              TextButton(
                                onPressed: () {
                                  if(data.values.contains(true)) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (
                                            context) => MakePayment(data: data)));
                                  }
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.purple,
                                  backgroundColor: Colors.amber,),
                                child: data.values.contains(true) ? const Text(
                                  "Buy Ticket",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ) : const Text(
                                  "Sold Out",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
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