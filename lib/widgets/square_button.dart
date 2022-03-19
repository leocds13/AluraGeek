import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  final String label;
  final Color color;
  final void Function() onPressed;
  final bool secondary;

  const SquareButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.secondary = false,
  }) : super(key: key);

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Color usageColor =
        !isHover ? widget.color : Color(widget.color.value + 0xFF2A1A05);

    return Container(
      decoration: BoxDecoration(
        color: !widget.secondary ? usageColor : Colors.white,
        border: Border.all(color: usageColor, width: 2),
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        style: TextButton.styleFrom(
          minimumSize: const Size(133, 40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.secondary ? widget.color : Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
