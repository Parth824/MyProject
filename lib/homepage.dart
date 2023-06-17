import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_cricdesing/paint_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text("Doctor"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: Container(
                // margin: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                margin: EdgeInsets.all(getProportionateScreenHeight(10)),
                height: SizeConfig.screenHeight * .24,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenHeight * .027),
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight *.03,
            ),
            Expanded(
              flex: 6,
              child: Container(
                // color: Theme.of(context).primaryColor,
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(30)),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenHeight(100)),
                      ),
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: SizeConfig.screenWidth * .12,
                      mainAxisSpacing: SizeConfig.screenHeight * .02,
                      children: [
                        itmeDashbord("Order", "assets/images/Cart Icon.svg",
                            Colors.blue),
                        itmeDashbord("Payment\n Due", "assets/images/Cash.svg",
                            Colors.red),
                        itmeDashbord(
                            "Ledgar", "assets/images/ledger.svg", Colors.blue),
                        itmeDashbord(
                            "Payment", "assets/images/Cash.svg", Colors.green),
                        itmeDashbord("Complain", "assets/images/complain.svg",
                            Colors.blue),
                        itmeDashbord("Order\n Received",
                            "assets/images/order_recieved.svg", Colors.blue),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itmeDashbord(String title, String svgimage, Color color) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
              height: SizeConfig.screenHeight * .08,
              width: SizeConfig.screenWidth * .18,
              decoration: BoxDecoration(
                  // color: color,
                  // shape: BoxShape.circle,
                  ),
              child: SvgPicture.asset(
                svgimage,
                color: color,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * .01),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
