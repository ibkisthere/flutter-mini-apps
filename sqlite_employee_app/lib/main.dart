import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String firstname = '';
  String lastname = '';
  String emailId = '';
  String mobileno = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    validate(val) {
      if (val == null || val.isEmpty) {
        return 'Can\t be empty';
      }
      if (val.length < 4) {
        return 'Too short';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Employee'),
        actions: [
          IconButton(
              onPressed: () {
                navigateToEmployeeList();
              },
              tooltip: 'Next Choice',
              icon: const Icon(Icons.view_list))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (val) => validate(val),
                  onChanged: (val) => setState(() {
                    firstname = val;
                  }),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (val) => validate(val),
                  onChanged: (val) => setState(() {
                    lastname = val;
                  }),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Mobile No'),
                  validator: (val) => validate(val),
                  onChanged: (val) => setState(() {
                    mobileno = val;
                  }),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email Id'),
                  validator: (val) => validate(val),
                  onChanged: (val) => setState(() {
                    emailId = val;
                  }),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                        onPressed: _submit, child: const Text('Login')))
              ],
            ),
          )),
    );
  }

  void _submit() {
    if (this.formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    var employee = Employee(firstname, lastname, mobileno, emailId);
    var dbHelper = ;
  }
}
