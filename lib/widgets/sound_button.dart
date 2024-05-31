import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundButton extends StatefulWidget {
  const SoundButton({super.key});

  @override
  State<SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
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
          ? SvgPicture.asset('assets/images/buttons/sound-on.svg')
          : SvgPicture.asset('assets/images/buttons/sound-off.svg'),
    );
  }
}
