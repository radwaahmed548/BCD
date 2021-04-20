import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import '../components/background.dart';
import '../components/maindrawer.dart';
import 'package:video_player/video_player.dart';

class ExaminationScreen extends StatefulWidget {
  @override
  _ExaminationScreenState createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('videos/bc_exam.mp4');
    _initializeVideoPlayer = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),
      body: Container(
        child: Background(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    onPressed: () => _drawerKey.currentState.openDrawer(),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayer,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FlatButton(
                      color: KSecondColor,
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 220,
                  top: 580,
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).pushNamed('/calendar'),
                    child: FittedBox(
                        child: Text(
                          'Set Calender',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    color: KSecondColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
