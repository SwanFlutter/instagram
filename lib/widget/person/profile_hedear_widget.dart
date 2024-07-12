import 'package:avatar_better/avatar_better.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/constant.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/widget/person/edite-profile.dart';

class ProfileHedearWidget extends StatefulWidget {
  const ProfileHedearWidget({super.key});

  @override
  State<ProfileHedearWidget> createState() => _ProfileHedearWidgetState();
}

class _ProfileHedearWidgetState extends State<ProfileHedearWidget> {
  bool isFlowing = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () {
                    var user = autLoginController.userModel.value;
                    return Avatar(
                      text: user.fullName != null ? user.fullName! : '',
                      radius: 40,
                      imageNetwork: baseUsrl + user.picProfile!,
                    );
                  },
                ),
                const Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "23",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.0),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(letterSpacing: 4, fontSize: 15.0),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          "1.5M",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.0),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(letterSpacing: 4, fontSize: 15.0),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          "123",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.0),
                        ),
                        Text(
                          "following",
                          style: TextStyle(letterSpacing: 4, fontSize: 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Obx(
              () {
                var user = autLoginController.userModel.value;
                return Text(
                  user.fullName!,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            const Text(
              "Bio: I love my life",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: MaterialButton(
                      onPressed: () {
                        setState(
                          () {
                            isFlowing = !isFlowing;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditaProfile(),
                              ),
                            );
                          },
                        );
                      },
                      height: size.height * 0.065,
                      color: isFlowing ? Colors.blue : Colors.white,
                      shape: BeveledRectangleBorder(
                        side: isFlowing
                            ? BorderSide.none
                            : const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Text("Edit Profile"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: 85,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: picList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.5),
                            child: Avatar(
                              text: "Text",
                              radius: 27,
                              image: picList[index],
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text("Text")
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
