import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:untitled/login_api.dart';
import 'package:untitled/chat/views/home_page.dart';
import 'package:untitled/chat/views/call.dart';

final localUserID = Random().nextInt(1000).toString();

class JoinMeetingPage extends StatefulWidget {
  @override
  _JoinMeetingPageState createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  final TextEditingController _meetingIDController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String conferenceID = '';
  String userName = '';
  bool dontConnectToAudio = false;
  bool turnOffMyVideo = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
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
            SizedBox(
              width: 70,
            ),
            Text(
              "Join a Meeting",
              style: TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.1,
                  height: 40,
                ),
                Container(
                  width: size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      controller: _meetingIDController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Meeting ID",
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Join with a personal link name",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      controller: _userNameController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                conferenceID = _meetingIDController.text;
                userName = _userNameController.text;
              });
              var user = await LoginAPI.login();
              if (user != null) {
                Get.to(() => VideoCallScreen(
                  conferenceID: conferenceID,
                  userName: userName,
                  dontConnectToAudio: dontConnectToAudio,
                  turnOffMyVideo: turnOffMyVideo,
                ), transition: Transition.zoom);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Logged in as ${user.email}"),
                  ),
                );
              }
            },
            child: Container(
              width: size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffe4e4ed),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "If you received an invitation link, tap on the link again to join the meeting",
              style: TextStyle(color: Colors.black54, height: 1),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Invite people through call",
              style: TextStyle(color: Colors.black54, height: 1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => PhoneCall(), transition: Transition.zoom);
            },
            child: Container(
              width: size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffe4e4ed),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "JOIN OPTIONS",
                style: TextStyle(color: Colors.grey[600], height: 1.3),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don't Connect To Audio",
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    activeColor: Colors.blue,
                    value: dontConnectToAudio,
                    onChanged: (value) {
                      setState(() {
                        dontConnectToAudio = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Turn Off My Video",
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    activeColor: Colors.blue,
                    value: turnOffMyVideo,
                    onChanged: (value) {
                      setState(() {
                        turnOffMyVideo = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoCallScreen extends StatelessWidget {
  final String conferenceID;
  final String userName;
  final bool dontConnectToAudio;
  final bool turnOffMyVideo;

  const VideoCallScreen({
    Key? key,
    required this.conferenceID,
    required this.userName,
    required this.dontConnectToAudio,
    required this.turnOffMyVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'VIDEO CALL',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: ZegoUIKitPrebuiltVideoConference(
        appID: 671255443, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: 'd97a3f2db227ef8a84396de092c91a1310dd23245b2ebeb4117d633ee2c372c5', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: localUserID,
        userName: userName,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
