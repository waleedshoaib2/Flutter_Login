import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 200),
                _buildPageTitle(),
                SizedBox(height: 20),
                _isSignUp ? _buildCreateAccountForm() : _buildLoginForm(),
                SizedBox(height: 20),
                _isSignUp ? _buildSignUpButton() : _buildLoginButton(),
                SizedBox(height: 90),
                _isSignUp ? _buildSignInPrompt() : _buildCreateAccountPrompt(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Column(children: [
      Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: 50,
            height: 50,
          )),
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          'assets/new.png',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      )
    ]);
  }

  Widget _buildPageTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isSignUp ? "Create Account" : "Login",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            _isSignUp
                ? "Please fill in the form"
                : "Please sign in to continue",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _buildTextField(Icons.email, "Email", false),
        _buildTextField(Icons.lock, "Password", true),
      ],
    );
  }

  Widget _buildCreateAccountForm() {
    return Column(
      children: [
        _buildTextField(Icons.person, "Full Name", false),
        _buildTextField(Icons.email, "Email", false),
        _buildTextField(Icons.lock, "Password", true),
        _buildTextField(Icons.lock, "Confirm Password", true),
      ],
    );
  }

  Widget _buildTextField(IconData icon, String hintText, bool isPassword) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.yellow.shade700),
                color: Colors.white.withOpacity(0.2),
              ),
              child: TextField(
                obscureText: isPassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(icon, color: Colors.yellow.shade700),
                  hintText: hintText,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow.shade700.withOpacity(0.8),
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 18),
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Login"),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow.shade700.withOpacity(0.8),
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 18),
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Sign Up"),
      ),
    );
  }

  Widget _buildCreateAccountPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            setState(() {
              _isSignUp = true;
            });
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.yellow.shade700),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            setState(() {
              _isSignUp = false;
            });
          },
          child: Text(
            "Sign In",
            style: TextStyle(color: Colors.yellow.shade700),
          ),
        ),
      ],
    );
  }
}
