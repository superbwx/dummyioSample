import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'UserProfileJson.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserOneJson user;

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [if (isHover) kDefaultCardShadow],
      ),
      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.user.picture,
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.id,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.user.email,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: kDefaultPadding * 0.2,
              ),
              Text(
                widget.user.title +
                    ". " +
                    widget.user.firstName +
                    " " +
                    widget.user.lastName +
                    "\n" +
                    widget.user.phone +
                    "\n" +
                    widget.user.location.city +
                    "\n" +
                    widget.user.location.country +
                    "\n",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
