import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const TabItem({this.text, this.icon, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : Color(0xFF272C48),
            ),
            Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF272C48),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 13),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
