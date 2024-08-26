import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/Firestor_methods.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMethods {
  final jitsiMeet = JitsiMeet();
  final AuthMethods _authMethods = AuthMethods();
  FirestorMethods _firestorMethods = FirestorMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    try {
      if (userName.isEmpty) {
        userName = _authMethods.user.displayName!;
      }

      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: userName,
          email: _authMethods.user.email,
        ),
      );
      _firestorMethods.addmeeting(meeting: roomName);
      jitsiMeet.join(options);
    } catch (error) {
      print("Error: $error");
    }
  }
}
