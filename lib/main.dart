import 'package:flutter/material.dart';
import 'package:list_selector/counter_form_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Please fill in your name and age'),
                TextFormField(
                  autovalidate: true,
                  onSaved: (value) => this._name = value,
                  validator: (value) {
                    if (value.length < 3) {
                      return 'a minimum of 3 characters is required';
                    } else {
                      return null;
                    }
                  },
                ),
                CounterFormField(
                  autovalidate: true,
                  validator: (value) {
                    if (value < 0) {
                      return 'Negative values not supported';
                    }
                  },
                  onSaved: (value) => this._age = value,
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      setState(() {
                        this._formKey.currentState.save();
                      });
                    }
                  },
                ),
                SizedBox(height: 50.0),
                Text('${this._name} is ${this._age} years old')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
