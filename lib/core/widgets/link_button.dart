import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Function()? onCallback;
  const LinkButton(
      {super.key,
      required this.text,
      this.style = const TextStyle(),
      this.onCallback});

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onPressed: widget.onCallback,
        child: Text(widget.text,
            style: widget.style.copyWith(
                decoration:
                    isHover ? TextDecoration.underline : TextDecoration.none)));
  }
}
