import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:skype_clone/app/locator.dart';
import 'package:skype_clone/constants/app_colors.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/services/firebase_service.dart';
import 'package:skype_clone/ui/views/home/tabs/chat_list/components/custom_tile.dart';
import 'package:skype_clone/ui/views/home/tabs/chat_view.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  FirebaseService _firebaseService = locator<FirebaseService>();

  List<User> userList;
  String query = "";
  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseService.getCurrentUser().then((FirebaseUser user) {
      print("My user id : ${user.uid}");
      _firebaseService.fetchAllUsers(user).then((List<User> list) {
        setState(() {
          userList = list;
          print(userList[0].name);
        });
      });
    });
  }

  searchAppBar(BuildContext context) {
    return GradientAppBar(
      gradient: LinearGradient(colors: [gradientColorStart, gradientColorEnd]),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              setState(() {
                query = val;
              });
            },
            cursorColor: kBlackColor,
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildSuggestions(String query) {
    final List<User> suggestionList = query.isEmpty
        ? []
        : userList.where((User user) {
      String _getUsername = user.username.toLowerCase();
      String _query = query.toLowerCase();
      String _getName = user.name.toLowerCase();
      bool matchesUsername = _getUsername.contains(_query);
      bool matchesName = _getName.contains(_query);

      return (matchesUsername || matchesName);

      // (User user) => (user.username.toLowerCase().contains(query.toLowerCase()) ||
      //     (user.name.toLowerCase().contains(query.toLowerCase()))),
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        User searchedUser = User(
            uid: suggestionList[index].uid,
            profilePhoto: suggestionList[index].profilePhoto,
            name: suggestionList[index].name,
            username: suggestionList[index].username);

        return CustomTile(
          mini: false,
          onTap: () {
            Get.to(ChatView(receiver: searchedUser,));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(searchedUser.profilePhoto),
            backgroundColor: Colors.grey,
          ),
          title: Text(
            searchedUser.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            searchedUser.name,
            style: TextStyle(color: greyColor),
          ),
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: searchAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: buildSuggestions(query),
      ),
    );
  }
}
