import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayer1 extends StatefulWidget {
  final String data1;

  const YoutubePlayer1({super.key, required this.data1});

  @override
  State<YoutubePlayer1> createState() => _YoutubePlayer1State();
}

class _YoutubePlayer1State extends State<YoutubePlayer1> {
  late YoutubePlayerController controller;

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  // final url = widget.data1;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(
      widget.data1.toString(),
    )!;
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        widget.data1.toString(),
      )!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
    // final videoUrl = widget.data1;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
      ),
      builder: (p0, player) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Youtube player",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            player,
          ],
        ),
      ),
    );

    // Scaffold(
    //     appBar: AppBar(
    //       title: const Text(
    //         "Youtube player",
    //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //     body: SizedBox(
    //       width: MediaQuery.sizeOf(context).width,
    //       height: 400,
    //       child: YoutubePlayer(
    //         showVideoProgressIndicator: true,
    //         progressIndicatorColor: Colors.yellow,
    //         controller: controller,
    //       ),
    //     ));

    // YoutubePlayerBuilder(
    //   player: YoutubePlayer(controller: controller),
    //   builder: (p0, p1) =>
    // );
  }
}
