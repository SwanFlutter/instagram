// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const primeryColor = Color.fromRGBO(55, 151, 239, 1);

class ConstantAuthen {
  BuildContext context;

  ConstantAuthen({required this.context});

  static const textStyle = TextStyle(fontWeight: FontWeight.bold);
  static const textStyleSwitch =
      TextStyle(fontWeight: FontWeight.w700, color: primeryColor);

  static const textStylebottom =
      TextStyle(fontWeight: FontWeight.w400, color: Colors.grey);

  static const textStylebottom1 =
      TextStyle(fontWeight: FontWeight.w700, color: Colors.black);
}

class ConstantHome {
  static const textStyleUser =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  static const textStyleLocationUser =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400);

  static const textStyleLocationUserLike =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w800);
}

const List<String> postlist1 = [
  "assets/post.jpg",
  "assets/post1.jpg",
  "assets/Rectangle.png",
];
/*
List<Widget> imageWidgets = <Widget>[
  Image.network(
      "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
  Image.network(
      "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600"),
  Image.network(
      "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1600"),
  Image.network(
      "https://images.pexels.com/photos/207353/pexels-photo-207353.jpeg?auto=compress&cs=tinysrgb&w=1600"),
  Image.network(
      "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1600"),
  Image.network(
      "https://images.pexels.com/photos/1042423/pexels-photo-1042423.jpeg?auto=compress&cs=tinysrgb&w=1600"),
];
*/

List<String> imageUrls = <String>[
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/207353/pexels-photo-207353.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1042423/pexels-photo-1042423.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/207353/pexels-photo-207353.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1042423/pexels-photo-1042423.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
];

List<String> imageUrls1 = <String>[
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  "https://images.pexels.com/photos/1496372/pexels-photo-1496372.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/207353/pexels-photo-207353.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1042423/pexels-photo-1042423.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
];

const List<String> postlist = [
  "assets/post.jpg",
  "assets/post1.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
  "assets/post1.jpg",
  "assets/post.jpg",
  "assets/Rectangle.png",
];

const List<String> picList = [
  "assets/2.png",
  "assets/3.png",
  "assets/1.png",
  "assets/6.jpg",
  "assets/Oval.png",
  "assets/2.png",
  "assets/3.png",
  "assets/1.png",
  "assets/Oval.png",
  "assets/2.png",
  "assets/7.jpg",
  "assets/3.png",
  "assets/1.png",
  "assets/Oval.png",
];

String baseUsrl = 'http://192.168.1.105/instagram/upload/avatar/';
