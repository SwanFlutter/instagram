import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/constant.dart';
import 'package:instagram/test.dart';

import '../widget/post_widget.dart';
import '../widget/story_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44.0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 30.0,
            ),
          ),
          title: Image.asset("assets/IG logo.png"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
          ],
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Divider(),
              StoryList(size: size),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Post.image(
                        onTapCommente: () {
                          Get.to(() => const Screen());
                        },
                        /* onTapSharePost: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Test2(),
                            ),
                          );
                        },*/
                        captions:
                            "لورم ایپسوم یا طرح‌نما (به انگلیسی: Lorem ipsum) به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود. طراح گرافیک از این متن به عنوان عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید، تا از نظر گرافیکی نشانگر چگونگی نوع و اندازه فونت و ظاهر متن باشد. معمولا طراحان گرافیک برای صفحه‌آرایی، نخست از متن‌های آزمایشی و بی‌معنی استفاده می‌کنند تا صرفا به مشتری یا صاحب کار خود نشان دهند که صفحه طراحی یا صفحه بندی شده بعد از اینکه متن در آن قرار گیرد چگونه به نظر می‌رسد و قلم‌ها و اندازه‌بندی‌ها چگونه در نظر گرفته شده‌است. از آنجایی که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می‌باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه‌آرایی می‌کنند تا مرحله طراحی و صفحه‌بندی را به پایان برند.",
                        size: size,
                        listImage: imageUrls1,
                        userName: 'Sajjad',
                        like: 44.456,
                        picAvatar: picList[3],
                        picAvatarLiked: picList[2],
                        likeCount: 100,
                        showPointStackPic: size.width <= 390 ? true : false,
                        showAnimatedContainerBottom:
                            size.width >= 390 ? true : false,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
