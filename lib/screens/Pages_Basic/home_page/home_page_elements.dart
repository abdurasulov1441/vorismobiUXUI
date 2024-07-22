import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePageElements extends StatelessWidget {
  const HomePageElements({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: const Column(
            children: [
              AppbarTitle(),
              Expanded(child: VideoPlayerScreen()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OuterContainer(
                      text:
                          'Fuqarolar yashash uylarida oldi olingan o’g’irliklar',
                      icon: 'assets/images/home_page_1.svg',
                      number: '535',
                      colorborder: AppColors.homeLightBlue,
                      backColor: AppColors.homeLightBlue2),
                  OuterContainer(
                      text: 'Qo’riqlovdagi fuqarolar yashash uylari',
                      icon: 'assets/images/home_page_2.svg',
                      number: '33 755',
                      colorborder: AppColors.homePink,
                      backColor: AppColors.homePink2),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OuterContainer(
                      text: 'Obyektlarda oldi olingan o’g’irliklar',
                      icon: 'assets/images/home_page_3.svg',
                      number: '435',
                      colorborder: AppColors.homeOrange,
                      backColor: AppColors.homeOrange2),
                  OuterContainer(
                      text: 'Qo’riqlovdagi obyektlar',
                      icon: 'assets/images/home_page_4.svg',
                      number: '51 584',
                      colorborder: AppColors.homeDarkBlue,
                      backColor: AppColors.homeDarkBlue2),
                ],
              ),
              SizedBox(
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'L4VB7rFwryQ', // Add the YouTube video ID here
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          forceHD: false,
          enableCaption: true,
          showLiveFullscreenButton: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          _controller.addListener(() {});
        },
      ),
    );
  }
}

class OuterContainer extends StatelessWidget {
  const OuterContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.number,
    required this.colorborder,
    required this.backColor,
  });
  final String text;
  final String icon;
  final String number;
  final Color colorborder;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: colorborder),
        color: backColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorborder),
            color: AppColors.lightHeaderColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  minFontSize: 5,
                  style: AppStyle.fontStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    number,
                    style: AppStyle.fontStyle.copyWith(fontSize: 23),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('ta')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
