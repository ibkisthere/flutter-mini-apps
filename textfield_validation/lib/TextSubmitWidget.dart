import 'package:flutter/material.dart';

// // using text controller
// class TextSubmitWidget extends StatefulWidget {
//   const TextSubmitWidget({super.key, required this.onSubmit});
//   final ValueChanged<String> onSubmit;

//   @override
//   State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
// }

// class _TextSubmitWidgetState extends State<TextSubmitWidget> {
//   final _controller = TextEditingController();
//   bool _submitted = false;

//   String? get _errorText {
//     final text = _controller.value.text;

//     if (text.isEmpty) {
//       return 'Can\'t be empty';
//     }
//     if (text.length < 4) {
//       return 'Too short';
//     }
//     return null;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     void _submit() {
//       setState(() => _submitted = true);
//       if (_errorText == null) {
//         widget.onSubmit(_controller.value.text);
//       }
//     }

//     var _text = '';

//     return ValueListenableBuilder(
//         valueListenable: _controller,
//         builder: (context, TextEditingValue value, __) {
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       labelText: 'Enter your name',
//                       errorText:_submitted ? _errorText : null,
//                     ),
//                     onChanged: (text) => setState(() => _text),
//                   ),
//                   ElevatedButton(
//                       onPressed:
//                           _controller.value.text.isNotEmpty ? _submit : null,
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white70, fontSize: 24),
//                       ))
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

enum AutoValidateMode { disabled, always, onUserInteraction }

// using text controller
class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({super.key, required this.onSubmit});
  final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  bool _submitted = false;

  void _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState!.save();
      widget.onSubmit(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your name'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Can\t be empty';
                  }
                  if (text.length < 4) {
                    return 'Too short';
                  }
                  return null;
                },
                onChanged: (text) => setState(() => _name = text),
                autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: _name.isNotEmpty ? _submit : null,
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
