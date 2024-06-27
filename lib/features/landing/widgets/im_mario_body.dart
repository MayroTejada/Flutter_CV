import 'package:flutter/material.dart';

class ImMarioTejadaBody extends StatefulWidget {
  const ImMarioTejadaBody({super.key});

  @override
  State<ImMarioTejadaBody> createState() => _ImMarioTejadaBodyState();
}

class _ImMarioTejadaBodyState extends State<ImMarioTejadaBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> movePositionAxis;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    movePositionAxis =
        Tween<double>(begin: 0, end: 40).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          const Flexible(flex: 1, child: Placeholder()),
          Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    'assets/images/mario_profile.png',
                    fit: BoxFit.contain,
                  )),
                  AnimatedPositioned(
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 500),
                      top: 30 + movePositionAxis.value,
                      left: 30,
                      height: 80,
                      child: Image.asset('assets/images/swift_ui.png')),
                  AnimatedPositioned(
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 500),
                      bottom: 5 + movePositionAxis.value,
                      left: 30,
                      height: 80,
                      child: Image.asset('assets/images/react_icon.png')),
                  AnimatedPositioned(
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 500),
                      bottom: 60 + movePositionAxis.value,
                      right: 30,
                      height: 80,
                      child: Image.asset('assets/images/android_icon.png')),
                  AnimatedPositioned(
                      curve: Curves.bounceIn,
                      duration: const Duration(milliseconds: 500),
                      top: 10 + movePositionAxis.value,
                      right: 30,
                      height: 80,
                      child: Image.asset('assets/images/flutter_icon.png')),
                ],
              ))
        ],
      ),
    );
  }
}
