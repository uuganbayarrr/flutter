import 'package:flutter/material.dart';
import 'dice_roller.dart';
var startAlignmet = Alignment.topLeft;
var endAlignmet = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 62, 5, 159),
            Color.fromARGB(255, 61, 23, 126)
          ],
          begin: startAlignmet,
          end: endAlignmet,
        ),
      ),
      child: const Center(
          child: DiceRoller(),
      ),
    );
  }
}
