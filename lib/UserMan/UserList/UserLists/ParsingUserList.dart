import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/UserLists/UserListJson.dart';
import 'ListAllUser.dart';
import 'ListService.dart';

class ParsingUserList extends StatefulWidget {
  //
  ParsingUserList() : super();

  @override
  _ParsingUserListState createState() => _ParsingUserListState();
}

class _ParsingUserListState extends State<ParsingUserList> {
  //
  List<Usernya> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    DummyService.getUsers().then((users) {
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
      body: Center(
        child: Container(
          width: 350,
          color: Colors.white,
          child: ListView.builder(
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              Usernya user = _users[index];
              return ListAllUser(
                user: user,
                press: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
TextButton(
              child: Text(
                'All Posting',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostingListParsing()),
                );
              },
            ),
*/
