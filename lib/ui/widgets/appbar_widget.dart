import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/ui/screens/awards_screen.dart';
import 'package:list_video_thumbnails/ui/screens/date_picker_screen.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          children: [
            Container(
              height: kToolbarHeight + 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Constants.appbarImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Constants.yellow1, Constants.yellow2], // Gradient colors
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    border: Border.all(width: 1, color: Constants.yellow2),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  ),
                  child: const Text(
                    'LỊCH THI ĐẤU',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Constants.blackColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Constants.yellow1, Constants.yellow2], // Gradient colors
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    border: Border.all(color: Constants.yellow2, width: 0.1, style: BorderStyle.solid),
                    boxShadow: [
                      BoxShadow(
                        color: Constants.blackColor.withOpacity(0.05),
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
              ),
            )
          ],
        ),
        const DatePickerScreen(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: AwardsScreen(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 85);
}
