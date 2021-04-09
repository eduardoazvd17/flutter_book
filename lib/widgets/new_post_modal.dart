import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:get/get.dart';

class NewPostModal extends StatefulWidget {
  final PostsController _postsController;
  NewPostModal(this._postsController);

  @override
  _NewPostModalState createState() => _NewPostModalState();
}

class _NewPostModalState extends State<NewPostModal> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _greyBar(),
            SizedBox(height: 20),
            Text(
              "Nova Postagem",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Get.theme.accentColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
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
          if (_textController.isBlank ||
              _textController.text.replaceAll(" ", "") == "") {
            Get.snackbar(
              "Erro",
              "Seu post não pode ser vazio.",
              backgroundColor: Colors.red[200],
            );
          } else {
            widget._postsController.createPost(_textController.text);
            Get.close(1);
            Get.snackbar(
              "Postagem efetuada",
              "Seu post foi publicado com sucesso!",
              backgroundColor: Colors.green[200],
            );
          }
        },
      );
}
