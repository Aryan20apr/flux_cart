import 'package:flutter/material.dart';
import 'package:flux_cart/widgetComponents/drawer_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> imgList = [
  ('images/c1.jpg'),
  ('images/m1.jpeg'),
  ('images/m2.jpg'),
  ('images/w1.jpeg'),
  ('images/w3.jpeg'),
  ('images/w4.jpeg')
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_coursel = Container(
      height: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
            autoPlayCurve: Curves.decelerate,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3)),
        items: imgList.map((item) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              height: 250,
              margin: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 3,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Image.asset(
                '$item',
                fit: BoxFit.fill,
              ),
            ),
          );
        }).toList(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        //backgroundColor: Colors.cyanAccent,
        title: Text('FluxCart'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            // color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            // color: Colors.white,
          )
        ],
      ),
      drawer: Drawer(
        //backgroundColor: Colors.greenAccent,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Aryan Singh'),
              accountEmail: Text('apraryan.20@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: const Icon(Icons.photo),
                ),
              ),
              //decoration: BoxDecoration(color: Colors.redAccent),
            ),
            DrawerOptions(name: 'Home', icon: Icons.home),
            DrawerOptions(name: 'My Account', icon: Icons.person),
            DrawerOptions(name: 'Categories', icon: Icons.category),
            DrawerOptions(name: 'Wishlist', icon: Icons.favorite),
            DrawerOptions(name: 'My Orders', icon: Icons.shopping_bag),
            Divider(
              thickness: 2.0,
              // color: Colors.white,
            ),
            DrawerOptions(
              name: 'Settings',
              icon: Icons.settings,
              color: Colors.redAccent,
            ),
            DrawerOptions(
              name: 'About',
              icon: Icons.question_mark_rounded,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[image_coursel],
      ),
    );
  }
}
