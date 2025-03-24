import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_video_thumbnails/ui/screens/match_schedule_screen.dart';

void main() {
  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Match Schedule',
    theme: ThemeData.dark(),
    home: MatchScheduleScreen(),
  ));
}
 