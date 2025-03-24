import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_video_thumbnails/models/match_model.dart';
import 'package:list_video_thumbnails/ui/widgets/base_card_widget.dart';
import 'package:list_video_thumbnails/ui/widgets/list_video_widget.dart';
import 'package:list_video_thumbnails/ui/widgets/notification_widget.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

// ignore: must_be_immutable
class MatchItemWidget extends StatefulWidget {
  MatchModel matchs;
   AsyncSnapshot<Uint8List?> snapshot;
  final bool isScheduled;
  final bool isNofify;

  MatchItemWidget(
      {super.key, required this.matchs, required this.snapshot, this.isScheduled = false, this.isNofify = false});

  @override
  State<MatchItemWidget> createState() => _MatchItemWidgetState();
}

class _MatchItemWidgetState extends State<MatchItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String statusText = widget.isScheduled ? "LIVE" : (widget.isNofify ? "Đặt lịch" : "Hủy lịch");
    Color statusColor = widget.isScheduled ? Constants.redColor : Constants.blackColor;
    String iconNotify = widget.isNofify ? Constants.bell1 : Constants.bell2;

    return SizedBox(
      child: CardWidget.card(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: CardWidget.card(
                  padding: const EdgeInsets.all(5),
                  color: Constants.greyColor,
                  FittedBox(
                    child: SizedBox(
                      width: 35,
                      child: Text(
                        widget.matchs.time,
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
              LiveNotificationWidget(
                  match: widget.matchs,
                  status: statusText, 
                  statusColor: statusColor, 
                  iconsUrl: iconNotify
              ),
              ListVideoWidget(
                matchData: widget.matchs,
                snapshot: widget.snapshot,
              ),
            ],
          ),
          isShadow: true,
          radius: Constants.baseRadiusCard,
          blurRadius: 0.5,
          margin: const EdgeInsets.all(5)),
    );
  }
}
