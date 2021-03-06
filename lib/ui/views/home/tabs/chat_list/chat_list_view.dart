import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rogchat/constants/app_routes.dart';
import 'package:rogchat/services/auth_service.dart';
import 'package:rogchat/ui/views/home/tabs/call_views/pickup/pickup_layout.dart';
import 'package:rogchat/ui/views/home/tabs/chat_list/components/custom_app_bar.dart';
import 'package:rogchat/ui/views/home/tabs/chat_list/components/custom_tile.dart';

import '../../../../../app/locator.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../utils/utils.dart';

class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

final AuthService _authService = locator<AuthService>();

class _ChatListViewState extends State<ChatListView> {
  String currentUserId;
  String initials = "";

  @override
  void initState() {
    super.initState();
    _authService.getCurrentUser().then((user) {
      setState(() {
        currentUserId = user.uid;
        initials = Utils.getInitials(user.displayName);
      });
    });
  }

  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: kWhiteColor,
        ),
        onPressed: () {},
      ),
      title: UserCircle(initials),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: kWhiteColor,
          ),
          onPressed: () {
            Get.toNamed(RoutePaths.Search);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
          backgroundColor: kBlackColor,
          appBar: customAppBar(context),
          floatingActionButton: NewChatButton(),
          body: ChatListContainer(currentUserId)),
    );
  }
}

class UserCircle extends StatelessWidget {
  final String text;

  const UserCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: separatorColor),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: lightBlueColor,
                fontSize: 13.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12.0,
              width: 12.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kBlackColor,
                    width: 2,
                  ),
                  color: onlineDotColor),
            ),
          )
        ],
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: fabGradient,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Icon(
        Icons.edit,
        color: kWhiteColor,
        size: 25.0,
      ),
      padding: EdgeInsets.all(15.0),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  final String currentUserId;

  const ChatListContainer(this.currentUserId);

  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 2,
        itemBuilder: (context, index) {
          return CustomTile(
            mini: false,
            onTap: () {},
            title: Text(
              "Test",
              style: TextStyle(color: kWhiteColor, fontSize: 19.0),
            ),
            subtitle: Text(
              "Test",
              style: TextStyle(color: greyColor, fontSize: 14.0),
            ),
            leading: Container(
              constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: greyColor,
                    backgroundImage: NetworkImage(
                        "https://i.picsum.photos/id/807/200/300.jpg?hmac=9ZZk1Nj28qIecGuVvozSN7I4LW0zotTPqeYfdGR3YdE"),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 13.0,
                      width: 13.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: onlineDotColor,
                          border: Border.all(
                            color: kBlackColor,
                            width: 2,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
