import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/TagsList/TagsPostService.dart';

import 'PostingList.dart';
import 'PostingListJson.dart';

class ByTagsPostingListParsing extends StatefulWidget {
  //
  const ByTagsPostingListParsing({
    Key key,
    @required this.idTags,
  }) : super(key: key);

  final String idTags;

  @override
  _ByTagsPostingListParsing createState() => _ByTagsPostingListParsing();
}

class _ByTagsPostingListParsing extends State<ByTagsPostingListParsing> {
  //
  List<DataOwner> _tagsPosting;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    TagsPostService.getIdTag(widget.idTags).then((tagsJson) {
      setState(() {
        _tagsPosting = tagsJson;
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
          itemCount: null == _tagsPosting ? 0 : _tagsPosting.length,
          itemBuilder: (context, index) {
            DataOwner dataPosting = _tagsPosting[index];
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
