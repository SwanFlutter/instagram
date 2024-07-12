import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/aut_login_controller.dart';
import 'package:instagram/screen/signup.dart';

import '../constant.dart';
import '../widget/button.dart';
import '../widget/castom_text_feild.dart';
import '../widget/create_account.dart';

AutLoginController autLoginController = Get.find<AutLoginController>();

class Login extends StatelessWidget {
  const Login({super.key});
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
              const SizedBox(
                height: 30.0,
              ),
              CastomTextField(
                controller: autLoginController.email,
                text: "Email",
                size: size.width * 0.90,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Obx(
                () => CastomTextField(
                  controller: autLoginController.password,
                  text: "Password",
                  size: size.width * 0.90,
                  obscureText: autLoginController.isObscureLogin.value,
                  icon: Icons.lock,
                  iconPassword: IconButton(
                    onPressed: () {
                      autLoginController.togglePassword();
                    },
                    icon: Icon(
                      autLoginController.isObscureLogin.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: autLoginController.isObscureLogin.value
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "forgot password?",
                      style: ConstantAuthen.textStyleSwitch,
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
                text: 'Log in',
                onPressed: () {
                  autLoginController.login(context);
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
                    "Log in with facebook",
                    style: ConstantAuthen.textStyleSwitch,
                  ),
                ],
              ),
              const Spacer(),
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
              const Spacer(),
              CreateAccount(
                style: ConstantAuthen.textStyleSwitch,
                textQuestion: "Don't have an account?",
                text: 'Sign Up',
                onPressed: () {
                  Get.to(() => const SignUp());
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
