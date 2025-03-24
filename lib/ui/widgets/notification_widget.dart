import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/models/match_model.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

// ignore: must_be_immutable
class LiveNotificationWidget extends StatelessWidget {
  MatchModel? match;
  String? status;
  Color? statusColor;
  String? iconsUrl;

  LiveNotificationWidget({Key? key, this.match, this.status, this.statusColor, this.iconsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: statusColor,
          border: Border.all(color: status != 'LIVE' ? Constants.blackColor : Colors.transparent, width: 1),
          borderRadius: status == 'LIVE' ? BorderRadius.circular(5) : BorderRadius.circular(8),
        ),
        child: status == 'LIVE'
            ? const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 3, right: 10, top: 8, bottom: 8),
                    child: Image(
                      image: AssetImage(Constants.liveText),
                      width: 35,
                      height: 8,
                    )),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 20,
                      height: 20,
                      image: AssetImage(
                        iconsUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 40,
                      child: FittedBox(
                        child: Text(
                          status!,
                          style: const TextStyle(color: Constants.yellow1, fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
