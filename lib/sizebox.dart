import 'package:flutter/cupertino.dart';

class CustomeSizedBox extends StatelessWidget {
  double? height;
  double? width;

  CustomeSizedBox({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
