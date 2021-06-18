import 'package:gp/components/tools.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:gp/screens/calendar_patient.dart';
import 'package:gp/screens/calendar_screen.dart';
import 'package:gp/components/maindrawer.dart';
import 'package:chewie/chewie.dart';

class ExaminationScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ExaminationScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  VideoPlayerController _controller;
  ChewieController _chewieController;
  //Future<void> _initializeVideoPlayer;
  @override
  void initState() {
    // _controller = VideoPlayerController.asset('videos/bc_exam.mp4');
    // _initializeVideoPlayer= _controller.initialize();
    // _controller.setLooping(true);
    // _controller.setVolume(1.0);

    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.asset('videos/bc_exam.mp4'),
      autoInitialize: true,
      looping: true,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
    );

    super.initState();
  }

  double extent = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Examination'),
        backgroundColor: KMainColor,
      ),
      key: _scaffoldkey,
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Container(
              height: 400,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Chewie(
                  controller: _chewieController,
                ),
              )),
          SizedBox.expand(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                if (mounted)
                  setState(() {
                    extent = notification.extent;
                  });
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                minChildSize: 0.3,
                maxChildSize: 1.0,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(extent == 1.0 ? 0 : 16),
                        topRight: Radius.circular(extent == 1.0 ? 0 : 16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black45,
                          offset: Offset(-1, -1),
                        )
                      ],
                      color: Kgradintstartcolor,
                    ),
                    child: Column(
                      children: [
                        Visibility(
                          visible: extent != 1.0,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 150,
                                          width: size.width * 0.5,
                                          child: Text(
                                            'Breast self-exam (BSE), or regularly examining your breasts on your own, can be an important way to find breast cancer early when it’s more likely to be treated successfully. ',
                                            style:
                                                TextStyle(color: Colors.black54, fontSize: 16.0,),
                                          ),
                                      ),
                                    ),
                                    SizedBox(width: 25),
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/calendar');
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50.0,
                                        width: 130,
                                        decoration: new BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                            color: KMainColor),
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Set calender',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            //fontFamily: 'A',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
