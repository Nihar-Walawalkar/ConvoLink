import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    appId: '42c6b2dafc8a42ceb2dbdce25aefbabb',
    channelName: 'fluttering',
    tempToken:
        '007eJxTYOhR55fn1LOdz8bpGvFXfqrN0tsXeB+/2qN6q7Fv/f3lQloKDCZGyWZJRimJackWiUB2KpCdlJKcamSamJqWlJiUlPtodWpDICODMc8lVkYGCATxuRjSckpLSlKLMvPSGRgAuoQiJg==',
  ));

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'VIDEO CALL',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
