// ignore_for_file: file_names, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
            image: const AssetImage('assets/login.jpg'),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.7), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _bulidButtom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book_online,
            size: 1,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }

  Widget _bulidButtom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: _bulidForm(),
          )),
    );
  }

  Widget _bulidForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WELCOME TO VELNote',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
            color: myColor,
          ),
        ),
        _makeGreyText('Please Enter your E-mail and Password '),
        const SizedBox(height: 50),
        _makeGreyText('E-mail Address'),
        _buildInputFeild(emailCotroller),
        _makeGreyText('Password'),
        _buildInputFeild(passwordCotroller),
      ],
    );
  }

  Widget _makeGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildInputFeild(TextEditingController controller,
      {isPassword = false}) {
    return TextField();
  }
}
