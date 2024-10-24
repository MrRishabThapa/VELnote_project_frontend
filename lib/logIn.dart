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
  bool rememberUser = false;
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
          'Hello ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: myColor,
          ),
        ),
        _makeGreyText('Please Enter your E-mail and Password '),
        const SizedBox(height: 55),
        _makeGreyText('E-mail Address'),
        _buildInputFeild(emailCotroller),
        const SizedBox(height: 35),
        _makeGreyText('Password'),
        _buildInputFeild(passwordCotroller, isPassword: true),
        const SizedBox(height: 15),
        _buildRememberForget(),
        const SizedBox(height: 15),
        _buildLogInButton(),
        const SizedBox(height: 15),
        _buildOtherLogin()
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

  Widget _buildRememberForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _makeGreyText('Remember Me'),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _makeGreyText('I forget my Password'))
      ],
    );
  }

  Widget _buildLogInButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint('Email : ${emailCotroller.text}');
        debugPrint('Password : ${passwordCotroller.text}');
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        backgroundColor: Colors.deepPurple,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
        child: Column(
      children: [
        _makeGreyText('or Login With'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tab(icon: Image.asset("assets/fb.png")),
            Tab(icon: Image.asset('assets/github.png')),
            Tab(icon: Image.asset('assets/google.png'))
          ],
        )
      ],
    ));
  }
}
