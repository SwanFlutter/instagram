import 'package:flutter/material.dart';
import 'package:instagram/controller/logout_controller.dart';
import 'package:instagram/screen/login.dart';
import 'package:instagram/widget/person/gallery.dart';
import 'package:instagram/widget/person/igtv.dart';
import 'package:instagram/widget/person/movie.dart';
import 'package:instagram/widget/person/profile_hedear_widget.dart';

class Person extends StatelessWidget {
  const Person({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: autLoginController.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              autLoginController.userModel.value.fullName!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_box_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  autLoginController.openDrawers();
                },
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ProfileHedearWidget(),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  tabs: const [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.travel_explore_rounded,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.local_movies_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    IgTv(),
                    Movie(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              height: 55,
              onPressed: () {
                logOutController.logOut(context);
              },
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              minWidth: MediaQuery.of(context).size.width * 0.7,
              textColor: Colors.white,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
