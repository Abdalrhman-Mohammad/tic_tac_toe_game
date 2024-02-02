import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/utils/app_colors.dart';

class Symbols {
  static Icon cross = Icon(
    Icons.close_rounded,
    size: 120,
    color: AppColor.red,
  );
  static Icon circle = Icon(
    Icons.circle_outlined,
    size: 120,
    color: AppColor.Green,
  );
  static Icon lightcross = Icon(
    Icons.close_rounded,
    size: 120,
    color: AppColor.lightRed,
  );
  static Icon lightcircle = Icon(
    Icons.circle_outlined,
    size: 120,
    color: AppColor.lightGreen,
  );
}
