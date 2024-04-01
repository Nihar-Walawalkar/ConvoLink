import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PhoneCall extends StatelessWidget {
  const PhoneCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[50],
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 40,
                  ),
                ),
                title: Text(
                  "Nihar - AI & DS",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('+919321649058');
                  },
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 40,
                  ),
                ),
                title: Text(
                  "Raj - AI & DS",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('+919819324873');
                  },
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 40,
                  ),
                ),
                title: Text(
                  "Pranav - AI & DS",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('+919321531659');
                  },
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 40,
                  ),
                ),
                title: Text(
                  "Kushal - AI & DS",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    FlutterPhoneDirectCaller.callNumber('+917208416785');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
