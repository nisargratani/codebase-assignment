import 'package:flutter/material.dart';

///extension of the [int]
extension IntExtension on int {
  ///sized box with width
  SizedBox get hs => SizedBox(
        width: toDouble(),
      );

  ///sized box with height
  SizedBox get vs => SizedBox(
        height: toDouble(),
      );
}

///extension of the [double]
extension DoubleExtension on double {
  ///sized box with width
  SizedBox get hs => SizedBox(
        width: toDouble(),
      );

  ///sized box with height
  SizedBox get vs => SizedBox(
        height: toDouble(),
      );
}
