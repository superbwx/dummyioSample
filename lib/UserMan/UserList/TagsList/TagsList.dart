import 'package:flutter/material.dart';
import 'package:usermann/UserMan/UserList/PostingList/ByTagsPostingListParsing.dart';

class TagsList extends StatelessWidget {
  const TagsList({
    Key key,
    @required this.tagsList,
  }) : super(key: key);

  final List<String> tagsList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagsList
          .map(
            (item) => new TextButton(
              child: Text(item,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black45,
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ByTagsPostingListParsing(
                            idTags: item,
                          )),
                );
              },
            ),
          )
          .toList(),
    );
  
  }
}

class ByTagsList extends StatelessWidget {
  const ByTagsList({
    Key key,
    @required this.tagsList,
  }) : super(key: key);

  final List<String> tagsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: Wrap(
        children: List.generate(
          tagsList.length,
          (index) => new TextButton(
            child: Text(tagsList[index],
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ByTagsPostingListParsing(
                          idTags: tagsList[index],
                        )),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
Row(
      children: tagsList
          .map(
            (item) => new TextButton(
              child: Text(item,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black45,
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ByTagsPostingListParsing(
                            idTags: item,
                          )),
                );
              },
            ),
          )
          .toList(),
    );
  }
   */
