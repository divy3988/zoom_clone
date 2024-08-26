import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/Create_meeting.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingHome extends StatefulWidget {
  const MeetingHome({super.key});

  @override
  State<MeetingHome> createState() => _MeetingHomeState();
}

class _MeetingHomeState extends State<MeetingHome> {
  JitsiMethods _jitsiMethods = JitsiMethods();

  createMeeting() async {
    var rand = Random();
    String roomName = (rand.nextInt(10000000) + 10000000).toString();

    _jitsiMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  _joinMeeting() {
    Navigator.of(context).pushNamed('/video-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createMeeting,
                text: 'New Meeting',
                icon: Icons.videocam,
              ),
              HomeMeetingButton(
                onPressed: _joinMeeting,
                text: 'Join Meeting',
                icon: Icons.add_box_rounded,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: 'Schedule',
                icon: Icons.calendar_today,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings with just a click!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
