import 'package:blog_assesment/Screens/Authentications/register_screen.dart';
import 'package:blog_assesment/Utils/Widgets/custome_widgets.dart';
import 'package:blog_assesment/businessLogics/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
key: _authProvider.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "WELCOME",
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
                "BACK!",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor),
              ),
              const SizedBox(
                height: 60,
              ),
               CustomeTextFField(
                label: "Email",
                controller : _authProvider.emailController,
                prefixIcon: Icons.email_outlined,
                hintText: "Enter your Email",
             validator:  (val){
                return      authProvider.checkIfEmailValidate(val)  ?  null : "Invalid Email";

             },
              ),
              const SizedBox(
                height: 10,
              ),
               CustomeTextFField(
                label: "Password",
             validator:  (val){
                return      authProvider.isPasswordValid(val)  ?  null : "Invalid Password";

             },

                controller : _authProvider.passwordController,
                prefixIcon: Icons.lock_person_outlined,
                hintText: "Enter your password",
              ),
              const SizedBox(
                height: 5,
              ),
              if(authProvider.showErrorMsg) 
              Container(decoration: BoxDecoration(color:theme.primaryColor.withOpacity(0.1),borderRadius: BorderRadius.circular(5)),child: Padding(
                padding: const EdgeInsets.symmetric(vertical :4.0,horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(authProvider.errorMessage,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red),),
                  InkWell(
                    onTap: (){authProvider.cancelErrorMsg(); },
                    child: Icon(Icons.clear,color: Colors.red,))
                  ],
                ),
              ),),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextLabel(
                    label: "Forget Password?",
                    onTap: () {
                    },
                  )
                ],
              ),
              // SizedBox(
              //   height: 60,
              // ),
              const Spacer(flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextLabel(
                    label: "Don't have an account?",
                    onTap: () {
                      authProvider.emailController.clear();
                      authProvider.passwordController.clear();
;                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
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
            CustomeLargeButton(onTap: (){
              authProvider.cancelErrorMsg();              authProvider.doLogin(context);
            },textLabel: "Sign In",),
                        const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
