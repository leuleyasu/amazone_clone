import 'package:amazone_clone/constanant.dart';
import 'package:amazone_clone/feature/presentation/widget/custom_Button.dart';
import 'package:amazone_clone/feature/presentation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const authroute = 'auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signUp;
  final _signUpkeyForm = GlobalKey<FormState>();
  final _singinkeyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  void initState() {
    emailController;
    passwordController;
    nameController;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome"),
            SizedBox(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        color: auth == Auth.signUp
                            ? GlobalVariables.backgroundColor
                            : GlobalVariables.greyBackgroundCOlor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 150),
                          child: ListTile(
                            tileColor: auth == Auth.signUp
                                ? GlobalVariables.backgroundColor
                                : GlobalVariables.greyBackgroundCOlor,
                            leading: Radio(
                                value: Auth.signUp,
                                groupValue: auth,
                                onChanged: (Auth? value) {
                                  setState(() {
                                    auth = value!;
                                    print(auth.name);
                                  });
                                }),
                            trailing: const Text(
                              "Create Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      if (auth == Auth.signUp)
                        Container(
                            color: auth == Auth.signUp
                                ? GlobalVariables.backgroundColor
                                : GlobalVariables.greyBackgroundCOlor,
                            child: Form(
                              key: _signUpkeyForm,
                              child: Column(
                                children: [
                                  CustomTextfield(
                                      controller: nameController,
                                      lable: "Name"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextfield(
                                      controller: emailController,
                                      lable: "Email"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextfield(
                                      controller: passwordController,
                                      lable: "Password"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CutomButton(onTap: () {}, text: "Sign Up"),
                                ],
                              ),
                            )),
                      Container(
                        color: auth == Auth.signIn
                            ? GlobalVariables.backgroundColor
                            : GlobalVariables.greyBackgroundCOlor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 170),
                          child: ListTile(
                            tileColor: auth == Auth.signIn
                                ? GlobalVariables.backgroundColor
                                : GlobalVariables.greyBackgroundCOlor,
                            leading: Radio(
                                value: Auth.signIn,
                                groupValue: auth,
                                onChanged: (Auth? value) {
                                  setState(() {
                                    auth = value!;
                                  });
                                }),
                            trailing: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      if (auth == Auth.signIn)
                        Container(
                            color: auth == Auth.signIn
                                ? GlobalVariables.backgroundColor
                                : GlobalVariables.greyBackgroundCOlor,
                            child: Form(
                                key: _singinkeyForm,
                                child: Column(
                                  children: [
                                    CustomTextfield(
                                        controller: emailController,
                                        lable: "Email"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextfield(
                                        controller: passwordController,
                                        lable: "Password"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CutomButton(onTap: () {}, text: "Sign In")
                                  ],
                                )))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
