import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> textList;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double radius;
  final double sizeIcon;
  final bool showLabel;

  BottomNavBar({
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconList,
    required this.textList,
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.red,
    this.unselectedColor = Colors.grey,
    this.radius = 0.0,
    this.sizeIcon = 24,
    this.showLabel = true,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _textList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _textList = widget.textList;
  }

  @override
  Widget build(BuildContext context) {
    final navBarItemList = <Widget>[];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i, _textList[i]));
    }

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.radius), topRight: Radius.circular(widget.radius)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: navBarItemList,
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String text) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / _iconList.length,
              padding: const EdgeInsets.only(bottom: 8, top: 16),
              child: Icon(
                icon,
                size: widget.sizeIcon,
                color: _selectedIndex == index ? widget.selectedColor : widget.unselectedColor,
              ),
            ),
            Visibility(
              visible: widget.showLabel,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  text,
                  style: TextStyle(height: 0, fontSize: 10, color: _selectedIndex == index ? widget.selectedColor : widget.unselectedColor),
                ),
              ),
            ),
            if (_selectedIndex == index) selectedIndicator() else unselectedIndicator(),
          ],
        ),
      ),
    );
  }

  Widget selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 40,
      height: 3,
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: widget.selectedColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
      ),
    );
  }

  Widget unselectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 40,
      height: 0,
      margin: const EdgeInsets.only(top: 7),
      color: Colors.transparent,
    );
  }
}
