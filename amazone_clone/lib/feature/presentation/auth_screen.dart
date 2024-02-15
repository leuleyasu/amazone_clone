import 'package:amazone_clone/constanant.dart';
import 'package:amazone_clone/feature/domian/Repositories/auth_repositories.dart';
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
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpNameController = TextEditingController();
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();
  AuthServiceRepositories signUp = AuthServiceRepositories();

  @override
  void dispose() {
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpNameController.dispose();
    signInEmailController.dispose();
    signInPasswordController.dispose();

    super.dispose();
  }

  void signUpuser() {
    signUp.signUpUser(
      context: context,
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
      name: signUpNameController.text,
    );
  }

  void signInUser() {
    signUp.signInUser(
        context: context,
        email: signInEmailController.text,
        password: signInPasswordController.text);
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
                              },
                            ),
                            trailing: const Text(
                              "Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                                  controller: signUpNameController,
                                  lable: "Name",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield(
                                  controller: signUpEmailController,
                                  lable: "Email",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield(
                                  controller: signUpPasswordController,
                                  lable: "Password",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CutomButton(
                                  onTap: () async {
                                    if (_signUpkeyForm.currentState!
                                        .validate()) {
                                      signUpuser();
                                      print(
                                          "email ${signUpEmailController.text}  ");
                                    }
                                  },
                                  text: "Sign Up",
                                ),
                              ],
                            ),
                          ),
                        ),
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
                              },
                            ),
                            trailing: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
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
                                  controller: signInEmailController,
                                  lable: "Email",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield(
                                  controller: signInPasswordController,
                                  lable: "Password",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CutomButton(
                                  onTap: () {
                                    if (_singinkeyForm.currentState!
                                        .validate()) {
                                      signInUser();
                                    }
                                  },
                                  text: "Sign In",
                                ),
                              ],
                            ),
                          ),
                        ),
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
