import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:rogchat/enums/notifier_state.dart';
import 'package:rogchat/providers/user_provider.dart';
import 'package:rogchat/ui/views/home/tabs/call_views/pickup/pickup_layout.dart';
import 'package:rogchat/ui/views/home/tabs/chat_list/chat_list_view.dart';
import 'package:rogchat/ui/views/login/login_viewmodel.dart';

import '../../../constants/app_colors.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController;
  int _page = 0;

  UserProvider userProvider;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser();
    });

    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: kBlackColor,
        body: Center(
          child: Consumer<LoginViewModel>(
            builder: (context, LoginViewModel model, widget) {
              return model.state == NotifierState.Loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : PageView(
                      controller: pageController,
                      onPageChanged: onPageChanged,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Container(
                          child: ChatListView(),
                        ),
                        Center(
                          child: Text('Call Logs'),
                        ),
                        Center(
                          child: GestureDetector(
                              onTap: () => model.signOut(),
                              child: Text("Logout", style: TextStyle(color: kWhiteColor),)),
                        ),
                      ],
                    );
            },
          ),
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CupertinoTabBar(
              backgroundColor: kBlackColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    color: (_page == 0) ? lightBlueColor : greyColor,
                  ),
                  title: Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: (_page == 0) ? lightBlueColor : greyColor,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.call,
                    color: (_page == 1) ? lightBlueColor : greyColor,
                  ),
                  title: Text(
                    "Calls",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: (_page == 1) ? lightBlueColor : greyColor,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.contact_phone,
                    color: (_page == 2) ? lightBlueColor : greyColor,
                  ),
                  title: Text(
                    "Contacts",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: (_page == 2) ? lightBlueColor : greyColor,
                    ),
                  ),
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),
          ),
        ),
      ),
    );
  }
}
