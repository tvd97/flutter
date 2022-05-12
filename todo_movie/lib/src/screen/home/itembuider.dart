import 'package:flutter/material.dart';

class ItemBuider extends StatefulWidget {
  const ItemBuider({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  State<ItemBuider> createState() => _ItemBuiderState();
}

class _ItemBuiderState extends State<ItemBuider> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Expanded(
            child: Icon(widget.icon),
          ),
          Expanded(child: Text(widget.text)),
        ],
      ),
    );
  }
}
