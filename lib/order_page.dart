import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_cricdesing/list_page.dart';
import 'package:new_cricdesing/paint_pages.dart';

class Order_Page extends StatefulWidget {
  const Order_Page({super.key});

  @override
  State<Order_Page> createState() => _Order_PageState();
}

class _Order_PageState extends State<Order_Page> {
  List Data = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  List ImageData = [
    {
      'title': "Inkjet Printer",
      'images': "assets/images/z1.jpeg",
    },
    {'title': "Cartoon Printer", 'images': "assets/images/z2.jpeg"},
    {'title': "Inkjet Printer", 'images': "assets/images/z3.jpeg"},
    {'title': "Cartoon Printer", 'images': "assets/images/z4.jpeg"},
    {'title': "Inkjet Printer", 'images': "assets/images/z5.jpeg"},
    {'title': "Cartoon Printer", 'images': "assets/images/z1.jpeg"},
    {'title': "Inkjet Printer", 'images': "assets/images/z2.jpeg"},
    {'title': "Cartoon Printer", 'images': "assets/images/z3.jpeg"},
  ];

  final CarouselController carouselController = CarouselController();
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .01,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: SizeConfig.screenHeight * .28,
                    scrollPhysics: BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currenIndex = index;
                      });
                    },
                  ),
                  items: Data.map(
                    (e) => Container(
                      // margin: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                      margin: EdgeInsets.all(getProportionateScreenHeight(10)),
                      height: SizeConfig.screenHeight * .2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.screenHeight * .027),
                        color: e,
                      ),
                    ),
                  ).toList(),
                  carouselController: carouselController,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Data.asMap().entries.map((e) {
                return Container(
                  width: currenIndex == e.key
                      ? SizeConfig.screenHeight * .02
                      : SizeConfig.screenHeight * .01,
                  height: SizeConfig.screenHeight * .01,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenHeight(10)),
                    color: currenIndex == e.key ? Colors.blue : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .015,
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(12)),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: getProportionateScreenHeight(6),
                    mainAxisExtent: SizeConfig.screenHeight * .305,
                    mainAxisSpacing: getProportionateScreenHeight(6)),
                itemCount: ImageData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => List_Page(),
                          settings: RouteSettings(
                            arguments: ImageData[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  getProportionateScreenHeight(15)),
                              topRight: Radius.circular(
                                  getProportionateScreenHeight(15)),
                            ),
                            child: Image.asset(
                              ImageData[index]['images'],
                              height: SizeConfig.screenHeight * .23,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  getProportionateScreenHeight(8)),
                              child: Container(
                                height: SizeConfig.screenHeight * .07,
                                child: Text(
                                  ImageData[index]['title'],
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(14),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                        
                      ),
                    ),
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
