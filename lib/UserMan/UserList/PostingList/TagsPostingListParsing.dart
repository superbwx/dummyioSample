import 'package:flutter/material.dart';

import 'PostingList.dart';
import 'PostingListJson.dart';
import 'TagsPostingListService.dart';

class TagsPostingListParsing extends StatefulWidget {
  //
  const TagsPostingListParsing({
    Key key,
    @required this.idTags,
  }) : super(key: key);

  final String idTags;

  @override
  _TagsPostingListParsing createState() => _TagsPostingListParsing();
}

class _TagsPostingListParsing extends State<TagsPostingListParsing> {
  //
  List<DataOwner> _userPosting;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    TagsPostingListService.getPosting(widget.idTags).then((userPosting) {
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
