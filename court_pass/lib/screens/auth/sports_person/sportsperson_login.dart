import 'package:court_pass/custom%20widgets/backgrounds/backgrounds.dart';
import 'package:court_pass/custom%20widgets/buttons/back_buttons.dart';
import 'package:court_pass/custom%20widgets/buttons/buttons.dart';
import 'package:court_pass/screens/auth/sports_person/sportsperson_signup.dart';
import 'package:court_pass/screens/auth/user_selection.dart';
import 'package:court_pass/screens/pages/sports_person/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SportsPersonLoginPage extends StatefulWidget {
  const SportsPersonLoginPage({super.key});

  @override
  State<SportsPersonLoginPage> createState() => _SportsPersonLoginPageState();
}

class _SportsPersonLoginPageState extends State<SportsPersonLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  Color emailBorderColor = const Color(0xFFFFFAFA);
  Color emailTextColor = const Color(0xFFFFFAFA);
  Color emailIconColor = const Color(0x90888790);
  String emailHintText = "Email";
  Color emailHintTextColor = const Color(0xFFA19B9B);

  Color passwordBorderColor = const Color(0xFFFFFAFA);
  Color passwordHintTextColor = const Color(0xFFA19B9B);
  Color passwordIconColor = const Color(0x90888790);
  String passwordText = "Password";

  bool emailTrue() {
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(_emailController.text.trim())) {
      return true;
    } else {
      setState(() {
        emailBorderColor = const Color(0xFFEA4A4A);
        emailHintTextColor = const Color(0xFFDE2C2C);
        emailIconColor = const Color(0x80DE2C2C);
      });
      Navigator.of(context).pop();
      return false;
    }
  }

  Future login() async {
    // Show loading indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFF6F64),
          ),
        );
      },
    );

    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(_emailController.text.trim())) {
      Navigator.of(context).pop(); // Dismiss loading indicator
      setState(() {
        emailBorderColor = const Color(0xFFEA4A4A);
        emailHintTextColor = const Color(0xFFDE2C2C);
        emailIconColor = const Color(0x80DE2C2C);
        emailHintText = "Invalid Email!";
      });
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();

      print(e);

      setState(() {
        // Handle specific Firebase exceptions
        if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
          _passwordController.clear();

          emailHintText = "Incorrect Email or Password!";
          passwordText = "Incorrect Email or Password!";

          emailBorderColor = const Color(0xFFEA4A4A);
          emailTextColor = const Color(0xFFDE2C2C);
          emailIconColor = const Color(0x80DE2C2C);

          passwordBorderColor = const Color(0xFFEA4A4A);
          passwordHintTextColor = const Color(0xFFDE2C2C);
          passwordIconColor = const Color(0x80DE2C2C);
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.86;
    double textFieldHeight = screenHeight * 0.0645;

    double textFieldTextSize = screenWidth * 0.041;
    double smallTextSize = screenWidth * 0.035;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          logInBackground(),

          // BACK BUTTON
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
              child: SplashBackButton(),
            ),
          ),

          // TEXT AND TEXTFIELDS
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGIN TEXT
                Container(
                  width: textFieldWidth,
                  margin: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: const Color(0xFFFFFAFA),
                      fontSize: screenWidth * 0.058,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // EMAIL TEXT FIELD
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
                          color: const Color(0xFFFFFAFA),
                          fontSize: textFieldTextSize),
                      decoration: InputDecoration(
                        hintText: emailHintText,
                        hintStyle: TextStyle(
                          color: emailHintTextColor,
                          fontSize: textFieldTextSize,
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 11.5),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 4),
                          child: Icon(
                            Icons.email,
                            color: emailIconColor,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 17),

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

                const SizedBox(height: 8),

                // REMEMBER ME AND FORGOT PASSWORD
                Row(
                  children: [
                    // REMEMBER ME
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.1),
                      child: Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: smallTextSize,
                          color: const Color(0xFFFFFAFA),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    // FORGOT PASSWORD
                    GestureDetector(
                      onTap: () {
                        // FORGOT PASSWORD
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.265,
                            right: screenWidth * 0.1),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: smallTextSize,
                            color: const Color(0xFFFFFAFA),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                // LOGIN BUTTON
                GestureDetector(
                  onTap: login,
                  child: MainButton('Login'),
                ),

                const SizedBox(height: 18),

                // LOGIN WITH
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: textFieldWidth * 0.325,
                        height: 1,
                        color: const Color(0xFFFFFAFA),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "Or login with",
                          style: TextStyle(
                            color: const Color(0xFFFFFAFA),
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        width: textFieldWidth * 0.325,
                        height: 1,
                        color: const Color(0xFFFFFAFA),
                      ),
                    ],
                  ),
                ),

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
                              image:
                                  AssetImage('assets/icons/icon_facebook.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4013131A),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
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
                              image: AssetImage('assets/icons/icon_google.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4013131A),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // END OF TEXT AND TEXTFIELDS
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
                      top: const BorderSide(
                          color: Color(0xFFFFFAFA), width: 0.5)),
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
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Signup',
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
                                      const SportsPersonSignupPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
