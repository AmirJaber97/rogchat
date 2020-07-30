import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/models/call.dart';
import 'package:rogchat/providers/user_provider.dart';
import 'package:rogchat/services/call_service.dart';
import 'package:rogchat/ui/views/home/tabs/call_views/pickup/picker_screen.dart';

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallService callService = locator<CallService>();

  PickupLayout({
    @required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return (userProvider != null && userProvider.getUser != null)
        ? StreamBuilder<DocumentSnapshot>(
      stream: callService.callStream(uid: userProvider.getUser.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.data != null) {
          Call call = Call.fromJson(snapshot.data.data);

          if (!call.hasDialled) {
            return PickupScreen(call: call);
          }
        }
        return scaffold;
      },
    )
        : Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}