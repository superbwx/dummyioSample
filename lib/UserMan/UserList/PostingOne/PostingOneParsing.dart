import 'package:flutter/material.dart';

import 'PostingOne.dart';
import 'PostingOneService.dart';
import 'PostnigOneJson.dart';

class PostingOneParsing extends StatefulWidget {
  //
  const PostingOneParsing({
    Key key,
    @required this.idPosting,
  }) : super(key: key);

  final String idPosting;

  @override
  _PostingOneParsing createState() => _PostingOneParsing();
}

class _PostingOneParsing extends State<PostingOneParsing> {
  //
  PostingOneJson _postingOneJson;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    PostingOneService.getPostingOne(widget.idPosting).then((idOnePosting) {
      setState(() {
        _postingOneJson = idOnePosting;
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
      body: Center(
        child: Container(
          width: 390,
          color: Colors.white,
          child: Column(
            children: [
              PostingOne(
                idPosting: _postingOneJson,
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
