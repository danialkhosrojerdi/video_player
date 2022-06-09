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
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.AppColor.gradientFirst.withOpacity(0.8),
                          color.AppColor.gradientSecond.withOpacity(0.9)
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(70),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        )
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next workout',
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Legs Toning',
                            style: TextStyle(
                                fontSize: 25,
                                color: color.AppColor.homePageContainerTextBig),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'and Glutes Workout',
                            style: TextStyle(
                                fontSize: 25,
                                color: color.AppColor.homePageContainerTextBig),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: color
                                        .AppColor.homePageContainerTextSmall,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '60 min',
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(4, 8),
                                          blurRadius: 10,
                                          color: color.AppColor.gradientFirst)
                                    ]),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 60,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/card.jpg'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 8),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3),
                              blurRadius: 20,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 200, bottom: 30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/figure.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: EdgeInsets.only(left: 150, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You are doing great',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Keep it up\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.homePagePlanColor,
                                ),
                                children: [
                                  TextSpan(text: 'Stick to your plan'),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
