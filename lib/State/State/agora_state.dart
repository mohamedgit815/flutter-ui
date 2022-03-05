import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:tests/Helper/Widgets/Custom/custom_widgets.dart';


class AgoraVideoCallState extends ChangeNotifier {
  bool switchMute = false;

  final List<int> users = <int>[];

  final List<String> infoListUsers = <String>[];


  RtcEngineEventHandler evenHandler(BuildContext context){
    notifyListeners();
    return RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid ,int elapsed){
          final String _info = 'onJoinChannel: $channel , uid: $uid';
          infoListUsers.add(_info);
          notifyListeners();
        },
        userJoined: (int uid, int elapsed){
          customSnackBar(text: '$uid Join a Channel', context: context);

          final String _info = 'UserJoined: $uid';

          infoListUsers.add(_info);

          users.add(uid);
          notifyListeners();
        },
        userOffline: (int uid, UserOfflineReason reason){
          final String _info = 'UserOffline: $uid';

          infoListUsers.add(_info);

          customSnackBar(text: '$uid Offline', context: context);

          users.remove(uid);
          notifyListeners();
        },
        leaveChannel: ( state ){
          infoListUsers.add('OnLeaveChannel');
          users.clear();
          notifyListeners();
        },
        rejoinChannelSuccess: (String channel, int uid ,int elapsed){
          final String _info = 'RejoinChannelSuccess: $channel , uid: $uid';

          infoListUsers.add(_info);

          notifyListeners();
        },
        firstRemoteVideoFrame: (uid, width, height, elapsed) {
          final String _info = 'FirstRemoteVideo: $uid ${width}x $height';

          infoListUsers.add(_info);

          notifyListeners();
        });
  }

  bool muteSwitch() {
    notifyListeners();
    return switchMute = !switchMute;
  }
}