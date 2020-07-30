import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/models/call.dart';
import 'package:rogchat/services/call_service.dart';
import 'package:rogchat/ui/views/home/tabs/call_views/call_view.dart';
import 'package:rogchat/ui/views/home/tabs/chat_view.dart';
import 'package:rogchat/utils/permissions.dart';


class PickupScreen extends StatelessWidget {
  final Call call;
  final CallService callService = locator<CallService>();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            CachedImage(
              call.callerPic,
              isRound: true,
              radius: 180,
            ),
            SizedBox(height: 15),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.call_end),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await callService.endCall(call: call);
                  },
                ),
                SizedBox(width: 25),
                IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.green,
                  onPressed: () async =>
                  await Permissions.cameraAndMicrophonePermissionsGranted()
                      ? navigator.push(
                    MaterialPageRoute(
                      builder: (context) => CallView(call: call),
                    ),
                  )
                      : {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}