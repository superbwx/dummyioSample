import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/PostingList/UserPostingListParsing.dart';
import 'package:usermann/UserMan/UserList/UserOne/ParsingUserProfile.dart';

import '../../../constants.dart';
import 'UserListJson.dart';

class ListAllUser extends StatefulWidget {
  const ListAllUser({
    Key key,
    @required this.user,
    this.press,
  }) : super(key: key);

  final Usernya user;
  final Function press;

  @override
  _ListAllUserState createState() => _ListAllUserState();
}

class _ListAllUserState extends State<ListAllUser> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        height: 140,
        duration: Duration(
          milliseconds: 200,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        //margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.user.picture,
              height: 130,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.user.id,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    widget.user.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.user.title +
                      ". " +
                      widget.user.firstName +
                      " " +
                      widget.user.lastName +
                      "\n",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: TextButton(
                        child: Text(
                          'See Profile',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black45,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParsingUserProfile(
                                      idUser: widget.user.id,
                                    )),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: kDefaultPadding * 0.8,
                    ),
                    Center(
                      child: TextButton(
                        child: Text(
                          'See Posting',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black45,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPostingListParsing(
                                      idUser: widget.user.id,
                                    )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: kDefaultPadding * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
