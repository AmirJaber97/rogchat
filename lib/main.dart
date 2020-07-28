import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/app/locator.dart';
import 'package:skype_clone/caches/preferences.dart';
import 'package:skype_clone/enums/notifier_state.dart';
import 'package:skype_clone/ui/setup/routes.dart';
import 'package:skype_clone/ui/views/home_view.dart';
import 'package:skype_clone/ui/views/login_view.dart';
import 'package:skype_clone/ui/views/login_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.level = Level.info;
  // init locator (DI)
  setupLocator();
  // init hive (cache)
  await Hive.initFlutter();
  await locator<Preferences>().openBox();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(SkypeClone());
}

class SkypeClone extends StatefulWidget {
  @override
  _SkypeCloneState createState() => _SkypeCloneState();
}

class _SkypeCloneState extends State<SkypeClone> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: GetMaterialApp(
        onGenerateRoute: Routes.generateRoute,
        title: "Skype Clone",
        debugShowCheckedModeBanner: false,
        home: Consumer<LoginViewModel>(
          builder: (context, LoginViewModel model, widget) {
            return model.state == NotifierState.Loading
                ? Center(child: CircularProgressIndicator())
                : model.user != null ? HomeView() : LoginView();
          },
        ),
      ),
    );
  }
}
