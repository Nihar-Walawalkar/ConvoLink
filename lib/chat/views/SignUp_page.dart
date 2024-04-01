import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:untitled/chat/views/home_page.dart';
import 'package:get/get.dart';
import 'package:untitled/chat/views/join_meeting_page.dart';
import 'package:untitled/login_api.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[50],
          shadowColor: Colors.transparent,
          title: GestureDetector(
            onTap: () {
              Get.to(() => HomePage(), transition: Transition.fade);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.blue[700], fontSize: 18),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "For verification , please\n              confirm\n     your date of birth",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Text(
                  "Select Date",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () async {
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    initialDate: DateTime(1994),
                    firstDate: DateTime(1960),
                    lastDate: DateTime(2012),
                    dateFormat: "dd-MMMM-yyyy",
                    locale: DateTimePickerLocale.en_us,
                    looping: true,
                  );

                  if (datePicked != null) {
                    // Redirect to a new page using Navigator
                    var user = await LoginAPI.login();
                    if (user != null) {
                      Get.to(
                            () => JoinMeetingPage(),
                        transition: Transition.zoom,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Logged in as ${user.email}"),
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                "This data will not be stored",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}