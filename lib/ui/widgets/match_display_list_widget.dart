import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/controllers/match_controller.dart';
import 'package:list_video_thumbnails/models/match_model.dart';
import 'package:list_video_thumbnails/ui/widgets/header_list_widget.dart';
import 'package:list_video_thumbnails/ui/widgets/match_item_widget.dart';
import 'dart:typed_data';

class MatchDisplayList extends StatefulWidget {
  final List<MatchModel> matches;

  const MatchDisplayList({Key? key, required this.matches}) : super(key: key);

  @override
  State<MatchDisplayList> createState() => _MatchDisplayListState();
}

class _MatchDisplayListState extends State<MatchDisplayList> {
  bool hasScheduled = false;
  bool hasNofify = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.matches.length,
          itemBuilder: (context, index) {
            final match = widget.matches[index];
            return Column(
              children: [
                HeaderListItem(match: match),
                FutureBuilder<Uint8List?>(
                  future: MatchController().getCachedThumbnail(match.videoUrl),
                  builder: (context, snapshots) {
                    if (match.status == 'LIVE') {
                      hasScheduled = true;
                    } 
                    if (match.status == 'Đặt lịch') {
                      hasNofify = true;
                    }
                    return Column(
                      children: [
                        MatchItemWidget(matchs: match, snapshot: snapshots, isScheduled: hasScheduled),
                        MatchItemWidget(matchs: match, snapshot: snapshots,isNofify: hasNofify),
                        MatchItemWidget(matchs: match, snapshot: snapshots),
                      ],
                    );
                  },
                ),
              ],
            );
          }),
    );
  }
}
