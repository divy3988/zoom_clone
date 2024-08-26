import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/Firestor_methods.dart';

class HistoryMeeting extends StatefulWidget {
  const HistoryMeeting({super.key});

  @override
  State<HistoryMeeting> createState() => _HistoryMeetingState();
}

class _HistoryMeetingState extends State<HistoryMeeting> {
  FirestorMethods _firestorMethods = FirestorMethods();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestorMethods.meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data as dynamic).docs.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  ' Meeting Name: ${(snapshot.data as dynamic).docs[index]['meeting Name']}'),
              subtitle: Text(
                  'Joined at : ${DateFormat.yMMMd().format((snapshot.data as dynamic).docs[index]['Date-Time'].toDate())}'),
            );
          },
        );
      },
    );
  }
}
