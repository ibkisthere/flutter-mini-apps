import 'package:flutter/material.dart';
import 'package:password_strength_checker/passwordstrengthchecker.dart';
import 'package:password_strength_checker/utils/validators.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _passwordController = TextEditingController();
  bool _isStrong = false;
  bool _isObscure = true;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Strength Checker'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText:_isObscure,
              controller: _passwordController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon( _isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.black,),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade200,
                  hintText: 'Password',
                  filled: true),
            ),
            SizedBox(height: 16.0),
            AnimatedBuilder(
                animation: _passwordController,
                builder: (context, child) {
                  final password = _passwordController.text;

                  return PasswordStrengthChecker(
                    password: password,
                    onStrengthChanged: (bool value) {
                      setState(() {
                        _isStrong = value;
                      });
                    },
                    validators: validators,
                  );
                }),
            SizedBox(height: 24.0),
            Center(
              child: FilledButton(
                  onPressed: _isStrong ? () {} : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text('Submit'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
