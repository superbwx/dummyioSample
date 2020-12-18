import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/PostingOne/PostingOneParsing.dart';
import 'package:usermann/UserMan/UserList/TagsList/TagsList.dart';

import '../../../constants.dart';
import 'PostingListJson.dart';

class PostingList extends StatefulWidget {
  const PostingList({
    Key key,
    @required this.dataOwner,
    this.press,
  }) : super(key: key);

  final DataOwner dataOwner;
  final Function press;

  @override
  _PostingListState createState() => _PostingListState();
}

class _PostingListState extends State<PostingList> {
  bool isHover = false;
  List<String> _tags;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostingOneParsing(
                    idPosting: widget.dataOwner.id,
                  )),
        );
      },
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        width: 400,
        duration: Duration(
          milliseconds: 200,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.dataOwner.owner.title +
                  " " +
                  widget.dataOwner.owner.lastName +
                  " Post",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              widget.dataOwner.image,
              width: 390,
            ),
            Container(
              width: 390,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.dataOwner.text,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.dataOwner.publishDate.toString().substring(
                        0, widget.dataOwner.publishDate.toString().length - 5),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    widget.dataOwner.likes.toString() + " Likes",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  TagsList(tagsList: widget.dataOwner.tags),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
