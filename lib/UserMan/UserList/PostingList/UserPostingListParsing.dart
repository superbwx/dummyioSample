import 'package:flutter/material.dart';

import 'PostingList.dart';
import 'PostingListJson.dart';
import 'UserPostingListService.dart';

class UserPostingListParsing extends StatefulWidget {
  //
  const UserPostingListParsing({
    Key key,
    @required this.idUser,
  }) : super(key: key);

  final String idUser;

  @override
  _UserPostingListParsing createState() => _UserPostingListParsing();
}

class _UserPostingListParsing extends State<UserPostingListParsing> {
  //
  List<DataOwner> _userPosting;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    UserPostingListService.getPosting(widget.idUser).then((userPosting) {
      setState(() {
        _userPosting = userPosting;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Posting List'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _userPosting ? 0 : _userPosting.length,
          itemBuilder: (context, index) {
            DataOwner dataPosting = _userPosting[index];
            return PostingList(
              dataOwner: dataPosting,
              press: () {},
            );
          },
        ),
      ),
    );
  }
}
