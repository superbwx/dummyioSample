import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/PostingOne/PostnigOneJson.dart';

import '../../../constants.dart';

class PostingOne extends StatefulWidget {
  const PostingOne({
    Key key,
    @required this.idPosting,
    this.press,
  }) : super(key: key);

  final PostingOneJson idPosting;
  final Function press;

  @override
  _PostingOneState createState() => _PostingOneState();
}

class _PostingOneState extends State<PostingOne> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.idPosting.owner.title +
                " " +
                widget.idPosting.owner.lastName +
                " Post",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            widget.idPosting.image,
            width: 390,
          ),
          Container(
            width: 390,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.idPosting.text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.idPosting.publishDate.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.idPosting.likes.toString() + " Likes",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
