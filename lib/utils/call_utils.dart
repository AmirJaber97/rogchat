import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/models/call.dart';
import 'package:rogchat/models/user.dart';
import 'package:rogchat/services/call_service.dart';
import 'package:rogchat/ui/views/home/tabs/call_views/call_view.dart';

class CallUtils {
  static final CallService callService = locator<CallService>();

  static dial({User from, User to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callService.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallView(call: call),
          ));
    }
  }
}
