import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pedalbrain/modules/knob/knob.dart';

class KnobSelection extends StatelessWidget {
  final Knob knob;
  final Function onPress;

  KnobSelection({
    Key? key,
    required this.knob,
    required this.onPress,
  }) : super(key: key);

  final Widget knobSVG = SvgPicture.asset(
    'assets/icons/knob.svg',
    semanticsLabel: 'Knob',
    color: const Color(0xFF2B2F79),
    width: 30,
    height: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(bottom: 15),
          ),
          onPressed: () {
            onPress();
            knob.toggleEditMode();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              color: Color(0xFF00042C),
            ),
            child: Row(
              children: [
                knobSVG,
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    knob.knobData.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
