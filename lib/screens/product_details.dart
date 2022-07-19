import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flux_cart/products_list.dart';
import 'package:flux_cart/product_detail_widgets/drop_down_button.dart';
import 'package:flux_cart/constants.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
class ProductDetails extends StatefulWidget {
  static String id = 'product_details';
  ProductDetails({Key? key, required this.index}) : super(key: key);
  late final name, picture;
  late final oldPrice, price;
  final int index;
  final List imageDetailList = [];
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    widget.name = product_list[widget.index]['name'];
    widget.picture = product_list[widget.index]['picture'];
    widget.oldPrice = product_list[widget.index]['old_price'];
    widget.price = product_list[widget.index]['price'];
    widget.imageDetailList.add(widget.picture);

    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        //backgroundColor: Colors.cyanAccent,
        title: Text('Details'),
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
      body: ListView(
        children: <Widget>[
          Container(
              height: 300.0,
              color: Colors.white,
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.name ?? 'Product Name',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '₹${widget.oldPrice}',
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '₹${widget.price}',
                            style: const TextStyle(
                              color: Color(0xFF2962FF),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    itemCount: widget.imageDetailList.length,
                    itemBuilder: (context, index, realIndex) {
                      final imageAdd = widget.imageDetailList[index];
                      return buildImage(imageAdd, index);
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      initialPage: 0,
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      viewportFraction: 0.8,
                      pauseAutoPlayOnTouch: true,
                      pauseAutoPlayOnManualNavigate: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                  ),
                ),
              )),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))),
            child: Row(
              children: [
                Expanded(flex: 1,child: DropDownButton(dropdownValue: null, itemsList: sizeList, hintText: 'Select Size')),
                Expanded(flex:1,child: DropDownButton(dropdownValue: null, itemsList: colors, hintText: 'Select Color')),
                Expanded(flex:1,child: DropDownButton(dropdownValue: null, itemsList: quantity, hintText: 'Select Quantity'))
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(color:Colors.white54,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: BuyButton()),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_rounded),color: Colors.red,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart),color: Colors.red,)
                ],

              ),
            ),
          ),
          ListTile(
            title: new Text('Product Description',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
            subtitle: Text(lorem(paragraphs: 2, words: 200)),
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child:  Text('Product Nme',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.name),)
            ],
          ),
          //ToDo: Complete Product Brand
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child:  Text('Product Brand',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),)
            ],
          ),
          //ToDo: Complete Product Condition
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child:  Text('Product Condition',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),)
            ],
          )
        ],
      ),
    );
  }

  Widget buildImage(String imagePath, int index) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 1.0),
      height: 300,
      color: Colors.black,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

/*
class SizeDropDown extends StatefulWidget {
  const SizeDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {},
        elevation: 2,
        color: Colors.lightGreenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('Size'),
            ),
            Expanded(
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }
}

class ColorPalette extends StatefulWidget {
  const ColorPalette({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorPalette> createState() => _ColorPalette();
}

class _ColorPalette extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {},
        elevation: 2,
        color: Colors.lightGreenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textColor: Colors.black,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('Color'),
            ),
            Expanded(
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }
}

class Quantity extends StatefulWidget {
  const Quantity({Key? key}) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        elevation: 2,
        color: Colors.lightGreenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        enableFeedback: true,
        onPressed: () {},
        textColor: Colors.black,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text('Quantity'),
            ),
            Expanded(
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }
}*/

class BuyButton extends StatelessWidget {
  const BuyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Buy Now'),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.red),
            ),
            primary: Colors.blueAccent,
            elevation: 5,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

