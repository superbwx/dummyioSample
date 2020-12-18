import 'package:flutter/material.dart';

import 'PostingList.dart';
import 'PostingListJson.dart';
import 'PostingListService.dart';

class PostingListParsing extends StatefulWidget {
  //
  PostingListParsing() : super();

  @override
  _PostingListParsing createState() => _PostingListParsing();
}

class _PostingListParsing extends State<PostingListParsing> {
  //
  List<DataOwner> _userPosting;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    PostingListService.getPosting().then((userPosting) {
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
