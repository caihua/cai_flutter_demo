import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaiKeyboard extends StatefulWidget {
  CaiKeyboard();

  @override
  _CaiRawKeyboardListenerState createState() =>
      new _CaiRawKeyboardListenerState();
}

class _CaiRawKeyboardListenerState extends State<CaiKeyboard> {
  final TextEditingController _controller = new TextEditingController();
  FocusNode _textNode = new FocusNode();

  @override
  initState() {
    super.initState();
  }

  //Handle when submitting
  void _handleSubmitted(String finalinput) {
    print("_handleSubmitted");
    // setState(() {
    //   SystemChannels.textInput
    //       .invokeMethod('TextInput.hide'); //hide keyboard again
    //   _controller.clear();
    // });
  }

  // handleKey(RawKeyEventDataAndroid key) {
  //   String _keyCode;
  //   _keyCode = key.keyCode.toString(); //keycode of key event (66 is return)
  //   print("why does this run twice $_keyCode");
  // }

// var x = EditableText();
  @override
  Widget build(BuildContext context) {
    TextField _textField = new TextField(
      controller: _controller,
      onSubmitted: _handleSubmitted,
    );

    // FocusScope.of(context).requestFocus(_textNode);

    return RawKeyboardListener(
        focusNode: _textNode,
        // onKey: (key) => handleKey(key.data),
        onKey: (RawKeyEvent event) {
          print(event);
        },
        child: _textField);
  }
}
