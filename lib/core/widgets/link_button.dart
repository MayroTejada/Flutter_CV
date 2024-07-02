import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Function()? onCallback;
  final bool isSelected;
  const LinkButton(
      {super.key,
      this.isSelected = false,
      required this.text,
      this.style = const TextStyle(),
      this.onCallback});

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool isHover = false;
  bool isSelected = false;
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
                decoration: isHover || widget.isSelected
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}
