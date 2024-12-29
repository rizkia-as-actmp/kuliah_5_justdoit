import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

class MarkCard extends StatelessWidget {
  final String headerLabelText;
  final String bodyText;
  final String markId;
  Color headerBackgroundColor;
  Color headerForegroundColor;

  MarkCard({
    required this.headerLabelText,
    required this.bodyText,
    required this.markId,
    //this.headerBackgroundColor = const Color(0xFFFFE4E1),
    this.headerBackgroundColor = DefinedTheme.primary50,
    this.headerForegroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    print(markId);
    return GestureDetector(
      // https://stackoverflow.com/questions/49959617/flutter-how-do-you-make-a-card-clickable
      onTap: () {
        Navigator.pushNamed(context, '/markdown-viewer',
            arguments: {'markId': markId});
      },
      child: Card.filled(
        // holy shit styling in flutter is unnecessary complicated
        clipBehavior: Clip
            .antiAlias, // shape wont working if this clipBehavior is not set
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              DefinedSize.extraSmall), // Set the border radius
        ),
        elevation: 2,
        color: DefinedTheme.surface,
        child: SizedBox(
          width: 500,
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MarkCardHeader(
                labelText: headerLabelText,
                backgroundColor: headerBackgroundColor,
                foregroundColor: headerForegroundColor,
              ),
              _MarkCardBody(data: bodyText)
            ],
          ),
        ),
      ),
    );
  }
}

class _MarkCardBody extends StatelessWidget {
  const _MarkCardBody({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DefinedSize.medium,
        right: DefinedSize.medium,
        top: DefinedSize.medium,
        bottom: DefinedSize.big,
      ),
      child: SizedBox(
        height: 120,
        child: Text(
          data,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class _MarkCardHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String labelText;

  const _MarkCardHeader({
    required this.labelText,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DefinedSize.medium),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadingFive(
            data: labelText,
            color: foregroundColor,
          ),
        ],
      ),
    );
  }
}
