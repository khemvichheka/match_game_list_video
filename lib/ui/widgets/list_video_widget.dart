import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:list_video_thumbnails/models/match_model.dart';
import 'package:list_video_thumbnails/ui/screens/video_player_screen.dart';
import 'package:list_video_thumbnails/ui/widgets/base_card_widget.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

// ignore: must_be_immutable
class ListVideoWidget extends StatefulWidget {
  MatchModel? matchData;
  AsyncSnapshot<Uint8List?> snapshot;

  ListVideoWidget({
    super.key,
    this.matchData,
    required this.snapshot,
  });

  @override
  State<ListVideoWidget> createState() => _ListVideoWidgetState();
}

class _ListVideoWidgetState extends State<ListVideoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => VideoPlayerScreen(videoUrl: widget.matchData!.videoUrl));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: CardWidget.card(
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Constants.baseRadiusCard),
                    child: widget.snapshot.hasData
                        ? SizedBox.expand(
                            child: Image.memory(widget.snapshot.data!,
                                fit: BoxFit.cover, filterQuality: FilterQuality.high))
                        : Container(
                            color: Constants.greyColor,
                            child: const Center(
                                child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              child: CircularProgressIndicator(
                                value: 1,
                                strokeWidth: 2,
                              ),
                            )),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: CardWidget.card(
                radius: 5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text('Núi lửa Hawaii',
                          style: TextStyle(color: Constants.blackColor, fontSize: 8, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CardWidget.card(
                        radius: 5,
                        padding: const EdgeInsets.all(3),
                        color: Constants.redColor,
                        FittedBox(
                          child: Text(widget.matchData!.remainingTime,
                              style: TextStyle(color: Constants.whiteColor, fontSize: 8, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
