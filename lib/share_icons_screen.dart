

import 'package:flutter/material.dart';

class MoreOptionsButton extends StatefulWidget {
  @override
  _MoreOptionsButtonState createState() => _MoreOptionsButtonState();
}

class _MoreOptionsButtonState extends State<MoreOptionsButton> {
  bool isOpen = false;

  _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          width: isOpen ? 240 : 48,
          height: 48,
          decoration: ShapeDecoration(
            color: Colors.grey[400],
            shape: StadiumBorder(),
          ),
        ),
        Container(
          width: 40,
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 450),
            firstChild: IconButton(
              icon: Icon(Icons.share),
              onPressed: () => _toggleShare(),
            ),
            secondChild: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => _toggleShare(),
            ),
            crossFadeState: !isOpen
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 450),
          opacity: isOpen ? 1 : 0,
          child: Container(
            width: 240,
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
                IconButton(
                  icon:Icon(Icons.email_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.bluetooth),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}