import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/responsive/responsive_layout.dart';

class ImMarioTejadaBody extends StatefulWidget {
  const ImMarioTejadaBody({super.key});

  @override
  State<ImMarioTejadaBody> createState() => _ImMarioTejadaBodyState();
}

class _ImMarioTejadaBodyState extends State<ImMarioTejadaBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  double opacity = 0.0;
  late Animation<double> movePositionAxis;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationOpacity();
    });
    movePositionAxis =
        Tween<double>(begin: 0, end: 40).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.repeat(reverse: true);
  }

  animationOpacity() {
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      childMobile: Column(
        children: [
          const Gap(20),
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: RichText(
                text: TextSpan(
                    text: 'Hi! I am \n',
                    style: const TextStyle(fontSize: 50),
                    children: [
                      TextSpan(
                          text: 'Mario Tejada',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      TextSpan(
                          text: ' ',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      WidgetSpan(
                          style: const TextStyle(fontSize: 40),
                          child: Icon(
                            Icons.android,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ),
                          alignment: PlaceholderAlignment.bottom)
                    ]),
              ),
            ),
          ),
          const Gap(20),
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                Positioned.fill(
                    child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: opacity,
                  child: Image.asset(
                    'assets/images/mario_profile.png',
                    fit: BoxFit.contain,
                  ),
                )),
                AnimatedPositioned(
                    curve: Curves.bounceIn,
                    duration: const Duration(milliseconds: 500),
                    top: 30 * .10 + movePositionAxis.value,
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
                    bottom: 30 + movePositionAxis.value,
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
            ),
          )
        ],
      ),
      childDesktop: SizedBox(
        height: 500,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 1,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 1),
                    child: RichText(
                      text: TextSpan(
                          text: 'Hi! I am \n',
                          style: const TextStyle(fontSize: 50),
                          children: [
                            TextSpan(
                                text: 'Mario Tejada',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                            TextSpan(
                                text: ' ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                            WidgetSpan(
                                style: const TextStyle(fontSize: 40),
                                child: Icon(
                                  Icons.android,
                                  color: Theme.of(context).primaryColor,
                                  size: 40,
                                ),
                                alignment: PlaceholderAlignment.bottom)
                          ]),
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: opacity,
                      child: Image.asset(
                        'assets/images/mario_profile.png',
                        fit: BoxFit.contain,
                      ),
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
      ),
    );
  }
}
