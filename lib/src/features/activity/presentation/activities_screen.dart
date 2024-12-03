import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: _Activities()),
    );
  }
}

class _Activities extends StatelessWidget {
  const _Activities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DefinedSize.medium),
      child: ListView(children: [
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: DefinedSize.medium,
          spacing: DefinedSize.medium,
          children: [
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
            CustomCard(headerLabelText: "tes"),
          ],
        ),
      ]),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String headerLabelText;
  Color headerBackgroundColor;
  Color headerForegroundColor;

  CustomCard({
    required this.headerLabelText,
    this.headerBackgroundColor = const Color(0xFFFFE4E1),
    this.headerForegroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: DefinedTheme.surface,
      clipBehavior: Clip.antiAlias,
      child: Flexible(
        child: Container(
          width: 500,
          child: Column(
            children: [
              _ScopeHeader(
                labelText: headerLabelText,
                backgroundColor: headerBackgroundColor,
                foregroundColor: headerForegroundColor,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: DefinedSize.medium,
                    right: DefinedSize.medium,
                    top: DefinedSize.medium,
                    bottom: DefinedSize.big),
                child: Column(
                  children: [
                    _ActivityItem(),
                    _ActivityItem(),
                    _ActivityItem(),
                    _ActivityItem(),
                    _ActivityItem()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: DefinedTheme.greyish))),
      padding: const EdgeInsets.only(
          bottom: DefinedSize.extraSmall,
          top: DefinedSize.extraSmall,
          right: DefinedSize.medium),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check_box_outlined,
                color: DefinedTheme.secondary,
              )),
          smallHSizedBox,
          HeadingSix(
            data: "Sarapan",
            color: DefinedTheme.onSurface,
          ),
          const Spacer(),
          HeadingSix(
            data: "1",
            color: DefinedTheme.onSurface,
          ),
        ],
      ),
    );
  }
}

class _ScopeHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String labelText;

  const _ScopeHeader({
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
          CustomTextButton(
            labelText: "All >",
            labelColor: foregroundColor,
          ),
        ],
      ),
    );
  }
}
