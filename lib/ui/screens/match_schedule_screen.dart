import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:list_video_thumbnails/ui/widgets/appbar_widget.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../controllers/match_controller.dart';
import '../widgets/match_display_list_widget.dart';

class MatchScheduleScreen extends StatelessWidget {
  final MatchController matchController = Get.put(MatchController());

  MatchScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
      statusBarIconBrightness: Brightness.light, 
    ));
    return Scaffold(
      backgroundColor: Constants.greyColor,
      appBar: const AppBarWidget(),
      body: Obx(() => SmartRefresher(
            controller: matchController.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: matchController.onRefresh,
            onLoading: matchController.loadMoreData,
            child: ListView.builder(
              itemCount: matchController.matches.length,
              itemBuilder: (context, index) {
                return MatchDisplayList(matches: matchController.matches);
              },
            ),
          )),
    );
  }
}
