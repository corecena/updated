import 'package:flutter/material.dart';
import 'package:miic/payments/flutterwave.dart';
import '../main.dart';

class upComingMatches extends StatefulWidget {
  const upComingMatches({Key? key}) : super(key: key);

  @override
  State<upComingMatches> createState() => _upComingMatchesState();
}

class _upComingMatchesState extends State<upComingMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Center(
            child: Column(
              children: [
                Text('YOTICKET', style: TextStyle(color: Colors.blue[500])),
                Text(
                  'Book your tickets early online',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                )
              ],
            ),
          ),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        body: ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  color: Colors.green,
                                  child: const CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.green,
                                      backgroundImage: NetworkImage(
                                          "https://viperssc.co.ug/wp-content/uploads/2018/10/new-vipers-logo.png")),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      " vipers    Vs   KCC",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Time: 2 pm",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                ),
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        color: Colors.green,
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.green,
                                          foregroundImage: NetworkImage(
                                              "https://upload.wikimedia.org/wikipedia/en/c/cd/Kampala_Capital_City_Authority_FC.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: FlatButton(
                              onPressed: () {
                                MyHomePage(title: 'hello');
                              },
                              color: Colors.red[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Text(
                                "Buy Ticket",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
