import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/constant.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/widget/button.dart';
import 'package:instagram/widget/create_account.dart';
import 'package:instagram/widget/text_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/IG logo.png",
                width: 150,
                height: 100,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CastomTextField(
                text: "Email",
                size: size.width * 0.90,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 12.0,
              ),
              CastomTextField(
                text: "Password",
                size: size.width * 0.90,
                icon: Icons.lock,
                iconPassword: Icons.visibility,
              ),
              const SizedBox(
                height: 12.0,
              ),
              CastomTextField(
                text: "ConfirmPassword",
                size: size.width * 0.90,
                icon: Icons.lock,
                iconPassword: Icons.visibility,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Button(
                minWidth: 343.0,
                text: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(
                height: 37.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  Text(
                    "Sign Up with facebook",
                    style: ConstantAuthen.textStyleSwitch,
                  ),
                ],
              ),
              const SizedBox(
                height: 37.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 37.0,
              ),
              CreateAccount(
                style: ConstantAuthen.textStyleSwitch,
                text: 'Login',
                onPressed: () {
                  Get.to(() => const Login());
                },
              ),
              const SizedBox(
                height: 60,
              ),
              const Divider(),
              const Spacer(),
              const Text(
                "instagram To Facebook",
                style: TextStyle(color: Colors.grey),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Align(
                  child: Divider(
                    indent: 110.0,
                    endIndent: 110.0,
                    thickness: 3,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
