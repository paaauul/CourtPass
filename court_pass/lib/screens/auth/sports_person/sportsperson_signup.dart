import 'dart:ui';

import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/database%20services/sports_person_database_service.dart';
import 'package:court_pass/screens/auth/sports_person/sportsperson_login.dart';
import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/auth/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SportsPersonSignupPage extends StatefulWidget {
  const SportsPersonSignupPage({super.key});

  @override
  State<SportsPersonSignupPage> createState() => _SportsPersonSignupPageState();
}

class _SportsPersonSignupPageState extends State<SportsPersonSignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Color firstNameBorderColor = const Color(0xFFFFFAFA);
  Color firstNameTextColor = const Color(0xFFFFFAFA);

  Color lastNameBorderColor = const Color(0xFFFFFAFA);
  Color lastNameTextColor = const Color(0xFFFFFAFA);

  Color emailBorderColor = const Color(0xFFFFFAFA);
  Color emailTextColor = const Color(0xFFFFFAFA);
  Color emailIconColor = const Color(0x90888790);
  String emailHintText = "Email";
  Color emailHintTextColor = const Color(0xFFA19B9B);

  Color passwordBorderColor = const Color(0xFFFFFAFA);
  Color passwordHintTextColor = const Color(0xFFA19B9B);
  Color passwordIconColor = const Color(0x90888790);
  String passwordText = "Password";
  String confirmPasswordText = "Confirm Password";

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      passwordBorderColor = const Color(0xFFFFFAFA);
      passwordHintTextColor = const Color(0xFFA19B9B);
      passwordIconColor = const Color(0x90888790);
      return true;
    } else {
      setState(() {
        _passwordController.clear();
        _confirmPasswordController.clear();
        passwordBorderColor = const Color(0xFFEA4A4A);
        passwordIconColor = const Color(0x80DE2C2C);
        passwordHintTextColor = const Color(0xFFDE2C2C);
        passwordText = "Passwords do not match!";
        confirmPasswordText = "Passwords do not match!";
      });
      return false;
    }
  }

  bool nameIsLetters() {
    // Updated regex to allow for names with spaces
    final RegExp regex = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');

    // Check both first and last names
    if (regex.hasMatch(_firstNameController.text.trim()) &&
        regex.hasMatch(_lastNameController.text.trim())) {
      // Set border and text colors for valid names
      firstNameBorderColor = const Color(0xFFFFFAFA);
      firstNameTextColor = const Color(0xFFFFFAFA);
      lastNameBorderColor = const Color(0xFFFFFAFA);
      lastNameTextColor = const Color(0xFFFFFAFA);
      return true;
    }
    // Check if both first and last names are invalid
    else if (!regex.hasMatch(_firstNameController.text.trim()) &&
        !regex.hasMatch(_lastNameController.text.trim())) {
      setState(() {
        firstNameBorderColor = const Color(0xFFEA4A4A);
        firstNameTextColor = const Color(0xFFDE2C2C);
        lastNameBorderColor = const Color(0xFFEA4A4A);
        lastNameTextColor = const Color(0xFFDE2C2C);
      });
      return false;
    }
    // Check if only first name is invalid
    else if (!regex.hasMatch(_firstNameController.text.trim())) {
      setState(() {
        firstNameBorderColor = const Color(0xFFEA4A4A);
        firstNameTextColor = const Color(0xFFDE2C2C);
      });
      return false;
    }
    // Check if only last name is invalid
    else if (!regex.hasMatch(_lastNameController.text.trim())) {
      setState(() {
        lastNameBorderColor = const Color(0xFFEA4A4A);
        lastNameTextColor = const Color(0xFFDE2C2C);
      });
      return false;
    }
    // Default case, should not be hit
    else {
      return false;
    }
  }

  bool emailTrue() {
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(_emailController.text.trim())) {
      emailBorderColor = const Color(0xFFFFFAFA);
      emailTextColor = const Color(0xFFFFFAFA);
      emailIconColor = const Color(0x90888790);
      emailHintTextColor = const Color(0xFFA19B9B);
      return true;
    } else {
      setState(() {
        emailBorderColor = const Color(0xFFEA4A4A);
        emailBorderColor = const Color(0xFFDE2C2C);
        emailIconColor = const Color(0x80DE2C2C);
      });
      return false;
    }
  }

  Future signup() async {
    bool passwordIsTrue = passwordConfirmed();
    bool nameisTrue = nameIsLetters();
    bool emailIsTrue = emailTrue();

    setState(() {
      _isPasswordVisible = false;
      _isConfirmPasswordVisible = false;
    });

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFF6F64),
            ),
          );
        });

    if (passwordIsTrue && nameisTrue && emailIsTrue) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        SportsPersonDatabaseService().signUpSportsPerson(
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            _emailController.text.trim());

        Navigator.of(context).pop();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VerificationPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          setState(() {
            _emailController.clear();
            emailBorderColor = const Color(0xFFEA4A4A);
            emailBorderColor = const Color(0xFFDE2C2C);
            emailIconColor = const Color(0x80DE2C2C);
            emailHintText = "Email already in-use!";
            emailHintTextColor = const Color(0xFFDE2C2C);
          });
        }
      }
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.85;
    double textFieldHeight = screenHeight * 0.064;

    double textFieldTextSize = screenWidth * 0.041;
    double smallTextSize = screenWidth * 0.0335;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          signUpBackground(),

          //BACK BUTTON
          Positioned(
            top: 55,
            left: 24,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserSelectionPage()));
                },
                child: SplashBackButton()),
          ),

          //TEXT AND TEXTFIELDS
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SIGN UP TEXT
                Container(
                  width: textFieldWidth,
                  margin: EdgeInsets.only(left: screenWidth * 0.04),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: const Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.058,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                //NAME TEXTFIELDS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FIRST NAME
                    Container(
                      width: textFieldWidth * 0.5,
                      height: textFieldHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: firstNameBorderColor),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _firstNameController,
                          style: TextStyle(
                              color: firstNameTextColor,
                              fontSize: textFieldTextSize),
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                                color: const Color(0xFFA19B9B),
                                fontSize: textFieldTextSize,
                                fontWeight: FontWeight.w300),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 11),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: textFieldWidth * 0.025),

                    // LAST NAME
                    Container(
                      width: textFieldWidth * 0.475,
                      height: textFieldHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: lastNameBorderColor),
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _lastNameController,
                          style: TextStyle(
                              color: lastNameTextColor,
                              fontSize: textFieldTextSize),
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                                color: const Color(0xFFA19B9B),
                                fontSize: textFieldTextSize,
                                fontWeight: FontWeight.w300),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 11),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 13),

                //EMAIL TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: emailBorderColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(
                          color: emailTextColor, fontSize: textFieldTextSize),
                      decoration: InputDecoration(
                          hintText: emailHintText,
                          hintStyle: TextStyle(
                            color: emailHintTextColor,
                            fontSize: textFieldTextSize,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 11.5),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 6),
                              child: Icon(
                                Icons.email,
                                color: emailIconColor,
                                size: screenWidth * 0.05,
                              ))),
                    ),
                  ),
                ),

                const SizedBox(height: 13),

                // PASSWORD TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: passwordBorderColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(
                          color: const Color(0xFFFFFAFA),
                          fontSize: textFieldTextSize),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: passwordText,
                        hintStyle: TextStyle(
                          color: passwordHintTextColor,
                          fontSize: textFieldTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 11.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 6),
                          child: Icon(
                            Icons.lock,
                            color: passwordIconColor,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; // Toggle password visibility
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0x90888790),
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 13),

                // CONFIRM PASSWORD TEXT FIELD
                Container(
                  width: textFieldWidth,
                  height: textFieldHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: passwordBorderColor),
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  child: Center(
                    child: TextField(
                      controller: _confirmPasswordController,
                      style: TextStyle(
                          color: const Color(0xFFFFFAFA),
                          fontSize: textFieldTextSize),
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        hintText: confirmPasswordText,
                        hintStyle: TextStyle(
                            color: passwordHintTextColor,
                            fontSize: textFieldTextSize,
                            fontWeight: FontWeight.w300),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 11.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 6),
                            child: Icon(
                              Icons.lock,
                              color: passwordIconColor,
                              size: screenWidth * 0.05,
                            )),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible; // Toggle password visibility
                              });
                            },
                            child: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0x90888790),
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // TERMS AND PRIVACY TEXT
                Container(
                  margin: EdgeInsets.only(
                      left: screenWidth * 0.10, right: screenWidth * 0.1),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: const Color(0xFFFFFAFA),
                        fontSize: smallTextSize,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        const TextSpan(
                          text: 'By signing up, you agree to the ',
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Terms of Service screen or handle tap
                            },
                        ),
                        const TextSpan(
                          text: ' and the ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Privacy Policy screen or handle tap
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // SIGNUP BUTTON
                GestureDetector(onTap: signup, child: MainButton('Sign Up')),

                const SizedBox(height: 18),

                //SIGN UP WITH
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: textFieldWidth * 0.31,
                      height: 1,
                      color: const Color(0xFFFFFAFA),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "Or sign up with",
                        style: TextStyle(
                            color: const Color(0xFFFFFAFA),
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      width: textFieldWidth * 0.31,
                      height: 1,
                      color: const Color(0xFFFFFAFA),
                    )
                  ],
                )),

                const SizedBox(height: 14),

                // ALTERNATIVES
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FACEBOOK
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/icon_facebook.png'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x4013131A),
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ]),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // GOOGLE
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/icons/icon_google.png'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x4013131A),
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ]),
                      ),
                    )
                  ],
                ))

                //END OF TEXT AND TEXTFIELDS
              ],
            ),
          ),

          // BOTTOM BOX
          Positioned(
            bottom: -0.5,
            left: -5,
            right: -5,
            child: Container(
              height: screenHeight * 0.073,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xFFFFFAFA), width: 0.5)),
                  color: Color(0x3013131A),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5513131A),
                        blurRadius: 1,
                        offset: Offset(0, -2))
                  ]),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: const Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.036,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SportsPersonLoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

          // END OF MAIN CHILDREN
        ],
      ),
    );
  }
}
