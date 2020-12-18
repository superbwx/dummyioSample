import 'package:flutter/material.dart';
import 'package:usermann/constants.dart';

import 'UserMan/UserList/UserLists/ParsingUserList.dart';
import 'UserMan/UserList/PostingList/PostingListParsing.dart';
import 'UserMan/UserList/TagsList/TagsList.dart';
import 'UserMan/UserList/TagsList/TagsService.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> _tagsList;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    TagsService.getTags().then((tagsJson) {
      setState(() {
        _tagsList = tagsJson;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersMann Menu'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              TextButton(
                child: Text(
                  'All User',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black45,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParsingUserList()),
                  );
                },
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
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
                    MaterialPageRoute(
                        builder: (context) => PostingListParsing()),
                  );
                },
              ),
            ],
          ),
          Text(
            'All Tags',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          ByTagsList(tagsList: _tagsList),
        ],
      ),
    );
  }
}
