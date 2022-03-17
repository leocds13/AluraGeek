import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquarButton extends StatefulWidget {
  final String label;
  final Color color;
  final void Function() onPressed;
  final bool secundary;

  const SquarButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.secundary = false,
  }) : super(key: key);

  @override
  State<SquarButton> createState() => _SquarButtonState();
}

class _SquarButtonState extends State<SquarButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Color usageColor = !isHover ? widget.color : Color(widget.color.value + 0xFF2A1A05);

    return Container(
      decoration: BoxDecoration(
        color: !widget.secundary ? usageColor : Colors.white,
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
          minimumSize: const Size(100, 50),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.secundary ? widget.color : Colors.white,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
