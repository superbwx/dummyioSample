import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/UserOne/ProfileService.dart';
import 'UserProfile.dart';
import 'UserProfileJson.dart';

class ParsingUserProfile extends StatefulWidget {
  const ParsingUserProfile({
    Key key,
    @required this.idUser,
  }) : super(key: key);

  final String idUser;

  @override
  _ParsingUserProfileState createState() => _ParsingUserProfileState();
}

class _ParsingUserProfileState extends State<ParsingUserProfile> {
  //
  UserOneJson _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    ProfileService.getUsers(widget.idUser).then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Profile User'),
      ),
      body: Center(
        child: Container(
          width: 350,
          color: Colors.white,
          child: Column(
            children: [
              UserProfile(
                user: _users,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black45,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
