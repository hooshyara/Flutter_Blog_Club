import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 19,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 16, right: 16, bottom: 30),
              child: Assets.img.background.logo.image(width: 150),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32))),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'LOGIN',
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              'SIGNUP',
                              style: tabTextStyle.apply(
                                color: selectedTabIndex == signUpTab
                                    ? Colors.white
                                    : Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            )),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: selectedTabIndex == loginTab
                              ? _Login(themeData: themeData)
                              : _SignUP(themeData: themeData),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 25),
          child: Text(
            'Welcome Back',
            style: themeData.textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: Text(
            'Sign in with your Account',
            style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: TextField(
            decoration: InputDecoration(
                label: Text(
              'UserName',
              style: themeData.textTheme.subtitle1,
            )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: PasswordTextField(themeData: themeData),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: const Text(
              'LOGIN',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forget Password ? '),
            TextButton(
              onPressed: () {},
              child: const Text('Reset here'),
            )
          ],
        ),
        Center(
          child: Text(
            'or Sign in with',
            style: themeData.textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 32, height: 32),
            const SizedBox(
              width: 30,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32),
            const SizedBox(
              width: 30,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32)
          ],
        ),
      ],
    );
  }
}

class _SignUP extends StatelessWidget {
  const _SignUP({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 25),
          child: Text(
            'Welcome to Blog Club',
            style: themeData.textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: Text(
            'Please enter your information',
            style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: TextField(
            decoration: InputDecoration(
                label: Text(
              'FullName',
              style: themeData.textTheme.subtitle1,
            )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: TextField(
            decoration: InputDecoration(
                label: Text(
              'UserName',
              style: themeData.textTheme.subtitle1,
            )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: PasswordTextField(themeData: themeData),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: const Text(
              'ُSIGN UP',
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or Sign Up with',
            style: themeData.textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 32, height: 32),
            const SizedBox(
              width: 30,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32),
            const SizedBox(
              width: 30,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32)
          ],
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text(
          'Password',
          style: widget.themeData.textTheme.subtitle1,
        ),
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            obscureText ? 'Show' : 'hide',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
