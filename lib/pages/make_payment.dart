import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:uuid/uuid.dart';

class MakePayment extends StatefulWidget {
  final Map<String, dynamic> data;
  const MakePayment({Key? key, required this.data}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  Map<String, dynamic> singleMatch = {};
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final nameController = TextEditingController();
  final currencyController = TextEditingController();
  final ticketTypeController = TextEditingController();
  final countController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";
  String selectedCount = "";
  String selectedTicketType = "";

  bool isTestMode = true;

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;
    countController.text = selectedCount;
    ticketTypeController.text = selectedTicketType;
    //print(countController.value.text);

    singleMatch = widget.data;
    // print(singleMatch['TeamOne']);
    // print(singleMatch['TeamTwo']);
    // print(singleMatch['Stadium']);
    // print(singleMatch['KickOff']);

    if(ticketTypeController.value.text == "Ordinary"){
      amountController.text = "20000";
    } else if(ticketTypeController.value.text == "VIP"){
      amountController.text = "50000";
    } else if (ticketTypeController.value.text == "VVIP") {
      amountController.text = "100000";
    } else {
      amountController.text = "0";
    }

    if(countController.value.text == "2"){
       var newAmount = int.parse(amountController.text) * int.parse(countController.value.text);
      //print(newAmount);
      amountController.text = newAmount.toString();
    } else if(countController.value.text == "4"){
      var newAmount = int.parse(amountController.text) * int.parse(countController.value.text);
      //print(newAmount);
      amountController.text = newAmount.toString();
    } else if(countController.value.text == "6"){
      var newAmount = int.parse(amountController.text) * int.parse(countController.value.text);
      //print(newAmount);
      amountController.text = newAmount.toString();
    } else if(countController.value.text == "8"){
      var newAmount = int.parse(amountController.text) * int.parse(countController.value.text);
      //print(newAmount);
      amountController.text = newAmount.toString();
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Make Payment for ticket",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    '${singleMatch['TeamOne']}'' ' 'Vs' ' ''${singleMatch['TeamTwo']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${singleMatch['Stadium']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Time: ${singleMatch['KickOff']}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 15.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Ordinary:20,000Ugx',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    'VIP:50,000Ugx',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    'VVIP:100,000Ugx',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: ticketTypeController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  readOnly: true,
                  onTap: _openBottomSheetForTicketType,
                  decoration: const InputDecoration(
                    hintText: "Select the type of ticket here",
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : "Type of ticket is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(hintText: "Enter Amount"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Amount is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: countController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  readOnly: true,
                  onTap: _openBottomSheetForCount,
                  decoration: const InputDecoration(
                    hintText: "Number of tickets",
                  ),
                  validator: (value) =>
                  value!.isNotEmpty ? null : "Number of tickets is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  initialValue: "UGX",
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Currency is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Enter your name here",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Enter your email here",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Enter your phone number here",
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,),
                  onPressed: _onPressed,
                  child: const Text(
                    "Pay",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    if (formKey.currentState!.validate()) {
      _handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final Customer customer = Customer(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text);

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: publicKeyController.text.trim().isEmpty
            ? getPublicKey()
            : publicKeyController.text.trim(),
        currency: "UGX",
        redirectUrl: 'https://facebook.com',
        txRef: const Uuid().v1(),
        amount: amountController.text.toString().trim(),
        customer: customer,
        paymentOptions: "card, barter, bank transfer, ussd",
        customization: Customization(title: "Purchase Ticket"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      showLoading(response.status.toString());
      if (kDebugMode) {
        print("${response.toJson()}");
      }
    } else {
      showLoading("No Response!");
    }
  }

  String getPublicKey() {
    if (isTestMode) return "FLWPUBK_TEST-ef7bd4f1bd8a112740eb300dd20083d4-X";
    return "FLWPUBK_TEST-ef7bd4f1bd8a112740eb300dd20083d4-X";
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }
  void _openBottomSheetForCount() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCount();
        });
  }

  void _openBottomSheetForTicketType(){
    showModalBottomSheet(context: context, builder: (context){
      return _getTicketType();
    });
  }

  Widget _getTicketType(){
    final types = ["Ordinary", "VIP", "VVIP"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: types.map((type) => ListTile(
          onTap: () => {_handleTypeTap(type)},
          title: Column(
            children: [
              Text(
                type,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Divider(height: 1)
            ],
          ),
        ))
            .toList(),
      ),
    );
  }

  Widget _getCurrency() {
    final currencies = ["UGX", "KES", "USD", "GHS", "TZS"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _getCount(){
    final counts = ["1", "2", "4", "6", "8"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: counts.map((count) => ListTile(
          onTap: () => {_handleCountTap(count)},
          title: Column(
            children: [
              Text(
                count,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Divider(height: 1)
            ],
          ),
        ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  _handleCountTap(String count){
    setState(() {
      selectedCount = count;
      countController.text = count;
    });
    Navigator.pop(context);
  }

  _handleTypeTap(String type){
    setState(() {
      selectedTicketType = type;
      ticketTypeController.text = type;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(20.0),
            width: double.infinity,
            height: 100,
            child:
                Text('Booking ${message}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          ),
        );
      },
    );
  }
}
