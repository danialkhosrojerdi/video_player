import 'package:flutter/material.dart';
import 'colors.dart' as color;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Training',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: color.AppColor.homePageTitle,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    color: color.AppColor.homePageIcons,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: color.AppColor.homePageIcons,
                    size: 20,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: color.AppColor.homePageIcons,
                    size: 20,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Your Program',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: color.AppColor.homePageSubtitle,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
