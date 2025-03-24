import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/models/match_model.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

class HeaderListItem extends StatelessWidget {
  const HeaderListItem({
    Key? key,
    required this.match,
  }) : super(key: key);

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Constants.whiteColor,
                  border: Border.all(color: Constants.whiteColor, width: 1),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 0.2),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(child: Image.asset(Constants.iconLogo, width: 54, height: 30, fit: BoxFit.cover)),
                  ),
                ],
              )),
          Positioned(
            right: 0,
            top: -1.5,
            bottom: -2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(5)),
              child: Stack(children: [
                Image.asset(
                  Constants.shapeYellow,
                  fit: BoxFit.cover,
                ),
              ]),
            ),
          ),
          Positioned(
            left: -8,
            right: 0,
            top: -1.5,
            bottom: -2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(5)),
              child: Stack(children: [
                Image.asset(
                  Constants.shapeYellow,
                  fit: BoxFit.cover,
                ),
              ]),
            ),
          ),
          Positioned(
              top: 1,
              left: 65,
              bottom: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(match.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              )),
          Positioned(
              bottom: 0,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(10)),
                  color: Constants.yellow2,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(10)),
                      color: Constants.whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(match.headerTitle,
                          style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
