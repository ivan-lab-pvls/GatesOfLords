import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicButton extends StatefulWidget {
  const MusicButton({super.key});

  @override
  State<MusicButton> createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton> {
  bool isTap = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isTap) {
            isTap = false;
          } else {
            isTap = true;
          }
        });
      },
      child: isTap
          ? SvgPicture.asset('assets/images/buttons/music-on.svg')
          : SvgPicture.asset('assets/images/buttons/music-off.svg'),
    );
  }
}
