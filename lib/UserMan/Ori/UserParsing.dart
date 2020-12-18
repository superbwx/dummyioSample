import 'package:flutter/material.dart';
import 'Services.dart';
import 'Users.dart';

class UserParsing extends StatefulWidget {
  //
  UserParsing() : super();

  @override
  _UserParsingState createState() => _UserParsingState();
}

class _UserParsingState extends State<UserParsing> {
  //
  List<User> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
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
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            User user = _users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.username +
                  ".\n" +
                  user.email +
                  ".\n" +
                  user.address.city +
                  ".\n" +
                  user.phone +
                  ".\n" +
                  user.website +
                  ".\n" +
                  user.address.street +
                  ".\n" +
                  user.address.city),
            );
          },
        ),
      ),
    );
  }
}
