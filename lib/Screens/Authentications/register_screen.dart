import 'package:blog_assesment/Screens/Authentications/login_screen.dart';
import 'package:blog_assesment/Utils/Widgets/custome_widgets.dart';
import 'package:blog_assesment/businessLogics/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late AuthProvider _authProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: authProvider.registrationFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Sign Up",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Create new account",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: theme.primaryColor),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomeTextFField(
                label: "Name",
                validator: (val) {
                  return authProvider.isNameValidate(val)
                      ? null
                      : "Invalid Name";
                },
                controller: authProvider.nameController,
                prefixIcon: Icons.person_2_outlined,
                hintText: "Enter your name",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFField(
                label: "Email",
                validator: (val) {
                  return authProvider.checkIfEmailValidate(val)
                      ? null
                      : "Invalid Email";
                },
                controller: authProvider.emailController,
                prefixIcon: Icons.email_outlined,
                hintText: "Enter your Email",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFField(
                label: "Create Password",
                validator: (val) {
                  return authProvider.isPasswordValid(val)
                      ? null
                      : "Invalid Password";
                },
                controller: authProvider.passwordController,
                prefixIcon: Icons.lock_person_outlined,
                hintText: "Enter your password",
              ),
              const SizedBox(
                height: 20,
              ),

              // SizedBox(
              //   height: 60,
              // ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextLabel(
                    label: "Already have an account?",
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false, // This condition removes all routes
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    child: Divider(
                      color: theme.primaryColor,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomTextLabel(label: "OR", onTap: () {}),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 100,
                    child: Divider(
                      color: theme.primaryColor,
                      height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  CustomTextLabel(
                      label: "agree to the terms & conditions", onTap: () {})
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomeLargeButton(
                onTap: () {
                  authProvider.doRegister(context);
                },
                textLabel: "Sign Up",
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
