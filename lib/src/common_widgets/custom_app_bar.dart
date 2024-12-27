import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.rightRowWidgets = const <Widget>[],
    this.middleRowWidgets = const <Widget>[],
    this.leftRowWidgets = const <Widget>[],
    this.automaticallyImplyLeading = false,
  });

  List<Widget> rightRowWidgets;
  List<Widget> middleRowWidgets;
  List<Widget> leftRowWidgets;
  bool automaticallyImplyLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          automaticallyImplyLeading, // NOTE: untuk menghilangkan back button pada leading
      // app bar actions mendorong widgets dari sebelah kanan ke kiri
      actions: [
        mediumHSizedBox,
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // entah mengapa jika container diberikan warna, size dari widget akan berubah dan lebih mudah untuk diatur dalam kasus ini
            //Container(
            //  color: Colors.cyan,
            //  child: Expanded(
            //    child: Row(
            //      mainAxisAlignment: MainAxisAlignment.start,
            //      children: leftRowWidgets,
            //    ),
            //  ),
            //),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: leftRowWidgets,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: middleRowWidgets,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: rightRowWidgets,
            )
          ],
        )),
        mediumHSizedBox,
      ],
    );
  }
}
