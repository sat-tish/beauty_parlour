import 'package:beauty_parlour/model/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password;

  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Widget _emailField() {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2D3647)),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff2D3647),
            ),
            labelText: 'E-mail',
            labelStyle: TextStyle(color: Color(0xff2D3647), fontSize: 16)),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: TextFormField(
        cursorColor: Color(0xff2D3647),
        style: TextStyle(fontSize: 14),
        keyboardType: TextInputType.text,
        obscureText: _passwordVisible,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2D3647)),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xff2D3647),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Color(0xff2D3647), fontSize: 16),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff2D3647),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _confirmpasswordField() {
    return Container(
      child: TextFormField(
        cursorColor: Color(0xff2D3647),
        style: TextStyle(fontSize: 14),
        keyboardType: TextInputType.text,
        obscureText: _passwordVisible,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2D3647)),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xff2D3647),
          ),
          labelText: 'Confirm Password',
          labelStyle: TextStyle(color: Color(0xff2D3647), fontSize: 16),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff2D3647),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      elevation: 5.0,
      color: Color(0xffCBB1B8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () {},
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return FlatButton(
      onPressed: () {},
      child: Text("Forgot Password"),
    );
  }

  Widget _container() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          _emailField(),
          _passwordField(),
          _confirmpasswordField(),
          _loginButton()
        ],
      ),
    );
  }

  Widget _backButton() {
    return FlatButton(
      padding: EdgeInsets.only(top: 30),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcd0c0),
      body: Stack(
        children: [
          Positioned(top: 13, left: 0, child: (_backButton())),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16.0)),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
