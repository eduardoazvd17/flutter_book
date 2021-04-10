import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/models/post_model.dart';
import 'package:flutterbook/widgets/main_layout.dart';
import 'package:get/get.dart';

class NewPostModal extends StatefulWidget {
  final PostsController _postsController;
  final PostModel editPost;
  NewPostModal(this._postsController, {this.editPost});

  @override
  _NewPostModalState createState() => _NewPostModalState(
        TextEditingController(
          text: editPost == null ? "" : editPost.text,
        ),
      );
}

class _NewPostModalState extends State<NewPostModal> {
  final _textController;
  _NewPostModalState(this._textController);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _greyBar(),
            SizedBox(height: 20),
            Text(
              widget.editPost == null ? "Nova Postagem" : "Editar Postagem",
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
                    child: widget.editPost == null
                        ? _newPostButton()
                        : _editPostButton(),
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
        autofocus: true,
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

  _newPostButton() => ElevatedButton.icon(
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
          if (_textController.text.replaceAll(" ", "") == "") {
            //Error
            Get.snackbar(
              "Erro",
              "Seu post não pode ser vazio.",
              icon: Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.black,
              ),
              backgroundColor: Colors.red[200],
              colorText: Colors.black,
            );
          } else {
            //Success
            widget._postsController.createPost(_textController.text);
            Get.close(1);
            Get.snackbar(
              "Postagem efetuada",
              "Seu post foi publicado com sucesso!",
              icon: Icon(
                CupertinoIcons.chevron_down_circle,
                color: Colors.black,
              ),
              backgroundColor: Colors.green[200],
              colorText: Colors.black,
            );
          }
        },
      );

  _editPostButton() => ElevatedButton.icon(
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          "Salvar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          if (_textController.text.replaceAll(" ", "") == "") {
            //Error
            Get.snackbar(
              "Erro",
              "Seu post não pode ser vazio.",
              icon: Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.black,
              ),
              backgroundColor: Colors.red[200],
              colorText: Colors.black,
            );
          } else if (_textController.text == widget.editPost.text) {
            //Nothing Changed
            Get.close(1);
          } else {
            //Success
            widget._postsController
                .editPost(widget.editPost.id, _textController.text);
            Get.close(1);
            Get.snackbar(
              "Postagem editada",
              "Seu post foi editado com sucesso!",
              icon: Icon(
                CupertinoIcons.pencil_circle,
                color: Colors.black,
              ),
              backgroundColor: Colors.green[200],
              colorText: Colors.black,
            );
          }
        },
      );
}
