import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

class CardWidget {
  static Widget card(Widget child,
      {double? radius,
      bool isShadow = true,
      EdgeInsets? padding,
      EdgeInsets? margin,
      Color? color,
      Color? borderColor,
      Gradient? gradient,
      double? widthBorder,
      double? blurRadius}) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(width:widthBorder?? 0.5, color: borderColor ?? Constants.whiteColor),
        color: color ?? Constants.whiteColor,
        borderRadius: BorderRadius.circular(radius ?? 10),
        gradient: gradient ,
        boxShadow: !isShadow
            ? null
            : [
                BoxShadow(color: Colors.black12, blurRadius: blurRadius ?? 2, spreadRadius: 0.2),
              ],
      ),
      child: child,
    );
  }
}
