import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/models/post_model.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  PostTile(this.post);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _author(),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            _postContent(),
            SizedBox(height: 20),
            _postReview(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _author() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.network(
              post.user.imageUrl,
              width: 30,
            ),
          ),
          SizedBox(width: 10),
          Text(
            post.user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  _postContent() => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.post.text.length > 280
                  ? this.post.text.substring(0, 276) + "..."
                  : this.post.text,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                post.formattedDate,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      );

  _postReview() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.reply,
                size: 20,
              ),
              Text(
                post.answers.toString(),
              ),
            ],
          ),
          Container(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.square_favorites,
                size: 20,
              ),
              Text(
                post.version.toString(),
              ),
            ],
          ),
        ],
      );
}
