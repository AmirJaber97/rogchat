import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rogchat/app/locator.dart';
import 'package:rogchat/caches/preferences.dart';
import 'package:rogchat/enums/notifier_state.dart';
import 'package:rogchat/providers/imageUploadProvider.dart';
import 'package:rogchat/ui/setup/routes.dart';
import 'package:rogchat/ui/views/home/home_view.dart';
import 'package:rogchat/ui/views/login/login_view.dart';
import 'package:rogchat/ui/views/login/login_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.level = Level.info;
  // init locator (DI)
  setupLocator();
  // init hive (cache)
  await Hive.initFlutter();
  await locator<Preferences>().openBox();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(RogChat());
}

class RogChat extends StatefulWidget {
  @override
  _RogChatState createState() => _RogChatState();
}

class _RogChatState extends State<RogChat> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<ImageUploadProvider>(
          create: (context) => ImageUploadProvider(),
        ),
      ],
      child: GetMaterialApp(
        onGenerateRoute: Routes.generateRoute,
        title: "RogChat",
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
