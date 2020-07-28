import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/enums/notifier_state.dart';
import 'package:skype_clone/ui/views/login_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, LoginViewModel model, widget) {
            return model.state == NotifierState.Loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () => model.signOut(), child: Text("Logout"));
          },
        ),
      ),
    );
  }
}
