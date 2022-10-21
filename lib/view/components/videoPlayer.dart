import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerPage> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.asset('assets/intro.mp4')
      ..initialize().then((context) {
        videoPlayerController.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.expand(
          child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: videoPlayerController.value.size.width,
          height: videoPlayerController.value.size.height ,
          child: VideoPlayer(videoPlayerController),
        ),
      )),
    );
  }
}
