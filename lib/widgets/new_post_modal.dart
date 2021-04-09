import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';

class NewPostModal extends StatelessWidget {
  final _textController = TextEditingController();
  final PostsController _postsController;
  NewPostModal(this._postsController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _greyBar(),
          SizedBox(height: 20),
          Text(
            "Nova Postagem",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                _textField(),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: _sendButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _greyBar() => Container(
        height: 5,
        width: 50,
        decoration: new BoxDecoration(
          color: Colors.grey,
          borderRadius: new BorderRadius.all(
            const Radius.circular(30),
          ),
        ),
      );

  _textField() => TextField(
        controller: _textController,
        decoration: InputDecoration(
          labelText: "Conte-nos sobre seu dia...",
          suffixIcon: Icon(CupertinoIcons.text_bubble),
        ),
        maxLength: 280,
        maxLines: 9,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      );

  _sendButton() => ElevatedButton.icon(
        icon: Icon(
          Icons.send,
          color: Colors.white,
        ),
        label: Text(
          "Enviar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          //TODO: Postar
        },
      );
}
