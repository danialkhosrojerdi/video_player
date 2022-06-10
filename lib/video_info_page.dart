import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: EdgeInsets.only(top: 70, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: color.AppColor.secondPageTopIconColor,
                          size: 20,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        color: color.AppColor.secondPageTopIconColor,
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Legs Toning\n',
                      style: TextStyle(
                        fontSize: 30,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                      children: [
                        TextSpan(text: 'and Glutes Workout'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Resistent band, Kettle bell',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Circuit 1 : Legs Toning',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 25,
                              color: color.AppColor.loopColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '3 Sets',
                              style: TextStyle(color: color.AppColor.setsColor),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: DefaultAssetBundle.of(context)
                            .loadString('json/videoinfo.json'),
                        builder: (context, snapshot) {
                          var videoData = json.decode(snapshot.data.toString());
                          return ListView.builder(
                            itemCount: videoData == null ? 0 : videoData.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                leading: Image(
                                  image: AssetImage(
                                    videoData[i]['thumbnail'],
                                  ),
                                ),
                                title: Text(videoData[i]['title']),
                                subtitle: Text(videoData[i]['time']),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 300),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(80),
        //     ),
        //   ),

        // ),
        // ),
      ),
    );
  }
}
