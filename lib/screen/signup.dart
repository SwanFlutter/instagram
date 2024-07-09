import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/constant.dart';
import 'package:instagram/controller/aut_signup_controller.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/widget/button.dart';
import 'package:instagram/widget/castom_text_feild.dart';
import 'package:instagram/widget/create_account.dart';

AutControllerSignUp autControllerSignUp = Get.find<AutControllerSignUp>();

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
                width: 200,
                height: 150,
              ),
              CastomTextField(
                controller: autControllerSignUp.fullName,
                text: "Full Name",
                size: size.width * 0.90,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 12.0,
              ),
              CastomTextField(
                controller: autControllerSignUp.email,
                text: "Email",
                size: size.width * 0.90,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Obx(
                () => CastomTextField(
                  controller: autControllerSignUp.password,
                  text: "Password",
                  size: size.width * 0.90,
                  icon: Icons.lock,
                  obscureText: autControllerSignUp.isObscure.value,
                  iconPassword: IconButton(
                    onPressed: () {
                      autControllerSignUp.togglePassword();
                    },
                    icon: Icon(
                      autControllerSignUp.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: autControllerSignUp.isObscure.value
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Obx(
                () => CastomTextField(
                  controller: autControllerSignUp.confirmPassword,
                  text: "ConfirmPassword",
                  size: size.width * 0.90,
                  icon: Icons.lock,
                  obscureText: autControllerSignUp.isObscure.value,
                  iconPassword: IconButton(
                    onPressed: () {
                      autControllerSignUp.togglePassword();
                    },
                    icon: Icon(
                      autControllerSignUp.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: autControllerSignUp.isObscure.value
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Button(
                height: size.height * 0.08,
                minWidth: 343.0,
                text: 'Sign Up',
                onPressed: () {
                  //   print(autControllerSignUp.confirmPassword.text);
                  autControllerSignUp.signUp(context);
                },
              ),
              const Spacer(),
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
              SizedBox(
                height: size.height * 0.02,
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
              SizedBox(
                height: size.height * 0.03,
              ),
              CreateAccount(
                style: ConstantAuthen.textStyleSwitch,
                text: 'Login',
                onPressed: () {
                  Get.to(() => const Login());
                },
              ),
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
