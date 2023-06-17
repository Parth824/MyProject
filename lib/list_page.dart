import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:new_cricdesing/paint_pages.dart';

class List_Page extends StatefulWidget {
  const List_Page({super.key});

  @override
  State<List_Page> createState() => _List_PageState();
}

class _List_PageState extends State<List_Page> {
  List Inki = ["BK", "M", "LM", "C", "LC", "YK"];
  List Jelly = ["250 ml", "1 kg", "5 kg"];
  List X_ray_fimli = [
    "8 X 10",
    "10 X 12",
    "11 X 14",
    "14 X 17",
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Map k = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate Page"),
      ),
      body: Column(
        children: [
          ProductImage(k['images']),
          Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(10)),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  k['title'],
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Paper",
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenHeight * .13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              AntDesign.minussquare,
                              size: getProportionateScreenHeight(25),
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(18),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              AntDesign.plussquare,
                              size: getProportionateScreenHeight(25),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                Text(
                  "Select Ink",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                InkData(Inki: Inki),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                Text(
                  "Select Jelly",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                JellyData(Jelly: Jelly),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                Text(
                  "Select X-Ray Filmis",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * .012,
                ),
                X_RayData(X_ray_fimli: X_ray_fimli),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * .0675,
          ),
          Container(
            height: SizeConfig.screenHeight * .1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "₹ 500",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(
                      22,

                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * .07,
                  width: SizeConfig.screenWidth * .5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Rate"),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ProductImage(String image) {
    return Container(
      height: SizeConfig.screenHeight * .3,
      width: double.infinity,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

class X_RayData extends StatelessWidget {
  const X_RayData({
    super.key,
    required this.X_ray_fimli,
  });

  final List X_ray_fimli;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...X_ray_fimli.map(
            (e) => Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(2)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: SizeConfig.screenHeight * 0.05,
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: (e == "8 X 10")? Colors.blue: Colors.grey,width: getProportionateScreenHeight(2)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}

class JellyData extends StatelessWidget {
  const JellyData({
    super.key,
    required this.Jelly,
  });

  final List Jelly;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...Jelly.map(
            (e) => Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(2)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: SizeConfig.screenHeight * 0.05,
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: (e == "5 kg")? Colors.blue: Colors.grey,width: getProportionateScreenHeight(2)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}

class InkData extends StatelessWidget {
  const InkData({
    super.key,
    required this.Inki,
  });

  final List Inki;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...Inki.map(
            (e) => Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(2)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: SizeConfig.screenHeight * 0.05,
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: (e == "M")? Colors.blue: Colors.grey,width: getProportionateScreenHeight(2)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}
