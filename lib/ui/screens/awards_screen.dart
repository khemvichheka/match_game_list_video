import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/ui/widgets/base_card_widget.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

class AwardsScreen extends StatelessWidget {
  const AwardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth, // Ensure it fits screen width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 🟢 FIRST CARD
              Flexible(
                child: CardWidget.card(
                  color: Constants.cardColor,
                  blurRadius: 5,
                  borderColor: Constants.whiteColor,
                  radius: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  FittedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(
                              color: Constants.redColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Image(width: 25, fit: BoxFit.cover, image: AssetImage(Constants.liveText)),
                                ),
                                Image(width: 10, height: 10, fit: BoxFit.cover, image: AssetImage(Constants.signalImg)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Constants.redColor,
                          radius: 16,
                          child: Text('6', style: TextStyle(color: Constants.whiteColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🟢 SECOND CARD
              Flexible(
                child: CardWidget.card(
                  blurRadius: 5,
                  gradient: const LinearGradient(
                    colors: [Constants.yellow1, Constants.yellow2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderColor: Constants.yellow2,
                  radius: 20,
                  padding: const EdgeInsets.all(2),
                  FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                          child: Text('GIẢI ĐẤU',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Constants.blackColor)),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Constants.whiteColor,
                          child: const Image(fit: BoxFit.cover, image: AssetImage(Constants.trophy3D)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🟢 THIRD CARD
              Flexible(
                child: CardWidget.card(
                  blurRadius: 5,
                  color: Constants.cardColor,
                  borderColor: Constants.whiteColor,
                  radius: 20,
                  padding: const EdgeInsets.all(2),
                  FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
                          child: Text('THỜI GIAN',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Constants.blackColor)),
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Constants.whiteColor,
                          child: const Image(fit: BoxFit.cover, image: AssetImage(Constants.clockImg)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🟢 SEARCH ICON (LAST ITEM)
              Flexible(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Constants.greyColor.withOpacity(0.3),
                            Constants.blackColor.withOpacity(0.3),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: CardWidget.card(
                            color: Constants.cardColor,
                            radius: 20,
                            blurRadius: 15,
                            widthBorder: 1,
                            borderColor: Constants.greyColor,
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            const Image(
                                width: 30, height: 25, fit: BoxFit.cover, image: AssetImage(Constants.searchImg)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
