import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoData = [];
  bool _isVideoPlayed = false;
  VideoPlayerController? _controller;
  bool _isPlaying = false;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoData = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

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
            _isVideoPlayed == false
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    padding:
                        const EdgeInsets.only(top: 70, right: 30, left: 30),
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
                        const SizedBox(
                          height: 40,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Legs Toning\n',
                            style: TextStyle(
                              fontSize: 30,
                              color: color.AppColor.secondPageTitleColor,
                            ),
                            children: const [
                              TextSpan(text: 'and Glutes Workout'),
                            ],
                          ),
                        ),
                        const SizedBox(
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
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
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
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
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
                  )
                : Container(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 50),
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor,
                            )
                          ],
                        ),
                        _playView(context),
                        _getVideoControll(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          'Circuit 1 : Legs Toning',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 25,
                              color: color.AppColor.loopColor,
                            ),
                            const SizedBox(
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
                      child: ListView.builder(
                        itemCount: videoData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _getVideo(index);
                              setState(() {
                                if (_isVideoPlayed == false) {
                                  _isVideoPlayed = true;
                                }
                              });
                            },
                            child: _getListTile(index, context, videoData),
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
      ),
    );
  }

  Container _getListTile(int i, BuildContext context, videoData) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoData[i]['thumbnail'],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoData[i]['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      videoData[i]['time'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: color.AppColor.loopColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color.AppColor.loopColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '15s rest',
                      style: TextStyle(
                          color: color.AppColor.gradientFirst.withOpacity(0.5)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 80; i++)
                      i.isEven
                          ? Container(
                              width: 3,
                              height: 1,
                              decoration: BoxDecoration(
                                color: color.AppColor.setsColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            )
                          : Container(
                              width: 3,
                              height: 1,
                              color: Colors.white,
                            )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Text(
          'Loading...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  _getVideo(int index) {
    final controller =
        VideoPlayerController.network(videoData[index]['videoUrl']);
    _controller = controller;
    setState(() {});

    controller
      ..initialize().then((_) {
        controller.addListener(_onControllerUpdate());
        controller.play();
        setState(() {});
      });
  }

  Widget _getVideoControll(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {}, child: const Icon(Icons.fast_rewind)),
        TextButton(
          onPressed: () async {
            if (_isPlaying) {
              _isPlaying = false;
              _controller?.pause();
            } else {
              _isPlaying = true;
              _controller?.play();
            }
          },
          child: _isPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
        ),
        TextButton(
            onPressed: () async {}, child: const Icon(Icons.fast_forward)),
      ],
    );
  }

  _onControllerUpdate() async {
    final controller = _controller;
    if (controller == null) {
      print('controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      print('Cant ini');
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }
}
