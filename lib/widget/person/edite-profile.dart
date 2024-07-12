import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/constant.dart';
import 'package:instagram/controller/edit_controller.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/widget/castom_text_feild.dart';

EditController editController = Get.find<EditController>();

class EditaProfile extends StatelessWidget {
  const EditaProfile({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('EditaProfile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkResponse(
              onTap: () {
                editController.save(context);
              },
              child: const Text(
                "Save",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Avatar.profile(
                text: autLoginController.userModel.value.fullName![0],
                imageNetwork:
                    baseUsrl + autLoginController.userModel.value.picProfile!,
                radius: 50,
                onPickerChange: (file) {
                  editController.getPicImage(file);
                  editController.update();
                },
              ),
              const SizedBox(height: 25.0),
              CastomTextField(
                controller: editController.fullName,
                size: size.width * 0.70,
                text: autLoginController.userModel.value.fullName!,
                icon: Icons.person,
              ),
              const SizedBox(height: 25.0),
              CastomTextField(
                enabled: false,
                size: size.width * 0.70,
                text: autLoginController.userModel.value.email!,
                icon: Icons.email,
              )
            ],
          ),
        ),
      ),
    );
  }
}
