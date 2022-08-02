import 'package:flutter/material.dart';
import 'package:flux_cart/widgetComponents/drawer_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flux_cart/constants.dart';
import 'package:flux_cart/widgetComponents/horizontal_list_view.dart';
import 'package:flux_cart/widgetComponents/products.dart';
import 'package:flux_cart/screens/shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id='home_screen';
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
  int activeIndex = 0;

  var controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    /*Widget image_coursel = Container(
      height: 200.0,
      // child: CarouselSlider(
      //   options: CarouselOptions(
      //       autoPlayCurve: Curves.decelerate,
      //       autoPlay: true,
      //       enlargeCenterPage: true,
      //       autoPlayInterval: Duration(seconds: 3)),
      //   items: imgList.map((item) {
      //     return Padding(
      //       padding: const EdgeInsets.only(left: 30.0),
      //       child: Container(
      //         height: 250,
      //         margin: EdgeInsets.symmetric(vertical: 0),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(16),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.white,
      //               blurRadius: 3,
      //               spreadRadius: 3,
      //             ),
      //           ],
      //         ),
      //         child: Image.asset(
      //           '$item',
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //     );
      //   }).toList(),
      // ),
      child:
    );*/
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
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder:(context)=>Cart()))
              Navigator.pushNamed(context, Cart.id);
            },
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
            DrawerOptions(name: 'Logout', icon: Icons.logout,onTap:()
            {

            }),
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
        children: <Widget>[
          buildCarousel(),
          /*SizedBox(
          height: 10.0,
        ),*/
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(child: buildSlidingIndicator(activeIndex)),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: kCategoryText,
          ),
          //Horizontal List View
          HorizontalList(),

          //Grid View
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: kRecent,
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
          Center(child: const Text('End of List',style: TextStyle(color: Colors.grey,decoration:TextDecoration.overline )))
        ],
      ),
    );
  }

  Widget buildImage(String imagePath, int index) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 1.0),
      height: 200,
      color: Colors.grey,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildSlidingIndicator(int activeIndex) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgList.length,
        effect: SlideEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.greenAccent,
            dotColor: Colors.grey),
        onDotClicked: (index) => controller.animateToPage(index),
      );

  Widget buildCarousel() {
    return CarouselSlider.builder(
        itemCount: imgList.length,
        carouselController: controller,
        itemBuilder: (context, index, realIndex) {
          final imagePath = imgList[index];
          return buildImage(imagePath, index);
        },
        options: CarouselOptions(
            viewportFraction: 1,
            // pageSnapping: false,//If false scroll every pixel manually
            autoPlayCurve: Curves.decelerate,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            autoPlayInterval: Duration(seconds: 8),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index)));
  }
}
