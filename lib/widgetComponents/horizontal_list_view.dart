import 'package:flutter/material.dart';
import 'package:flux_cart/widgetComponents/category.dart';
List categoryList=[Category('Dress','images/cats/dress.png'),Category('Formal','images/cats/formal.png'),Category('Shoes','images/cats/shoe.png'),Category('Accessories','images/cats/accessories.png'),Category('Informal','images/cats/informal.png'),Category('Jeans','images/cats/jeans.png'),Category('T-shirts','images/cats/tshirt.png')];
class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryTile(
              image_location: categoryList[index].getImage(),
              image_caption: categoryList[index].getName());
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile(
      {Key? key, required this.image_location, required this.image_caption})
      : super(key: key);
  final String image_location;
  final String image_caption;
  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: EdgeInsets.all(2.0),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image_location ?? 'images/image1.jpg',
                  width: 100,
                  height: 80,
                ),
                Text(
                  image_caption ?? 'Name',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15,color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
