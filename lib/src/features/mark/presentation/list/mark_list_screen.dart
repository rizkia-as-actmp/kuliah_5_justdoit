import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/loading_screen.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/constants/sizes.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/features/authentication/application/auth_service.dart';
import 'package:justdoit/src/features/mark/application/mark_providers.dart';
import 'package:justdoit/src/features/mark/domain/marklist.dart';
import 'package:justdoit/src/features/mark/presentation/list/mark_card.dart';
import 'package:justdoit/src/features/mark/presentation/list/mark_list_app_bar.dart';

class MarkListScreen extends ConsumerWidget {
  const MarkListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markListState = ref.watch(marksProvider);

    return markListState.when(
      loading: () => const LoadingScreen(),
      error: (error, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showExceptionDialog(context, error);
        });
        return Scaffold(
          appBar: CustomAppBar(
            leftRowWidgets: [HeadingThree(data: "Markdown Editor")],
          ),
          body: const Center(child: Text("Failed to load data")),
        );
      },
      data: (markList) => _MarkListBody(markList: markList),
    );
  }
}

class _MarkListBody extends StatelessWidget {
  final MarkList? markList;

  const _MarkListBody({required this.markList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: MarkListAppBar(),
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(DefinedSize.medium),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              runSpacing: DefinedSize.medium,
              spacing: DefinedSize.medium,
              children: (markList == null)
                  ? [Text("kosong melompong")]
                  : markList!.items!
                      .map((mark) => MarkCard(
                            headerLabelText: mark.title!,
                            bodyText: mark.previewContent ?? "No Description",
                            markId: mark.id!,
                          ))
                      .toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DefinedTheme.secondary,
        foregroundColor: DefinedTheme.onSecondary,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/mark-editor',
          );
        },
        child:
            Icon(Icons.add_outlined, size: DefinedSize.big + DefinedSize.small),
      ),
    );
  }
}

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    super.key,
  });

  final Icon ikon = const Icon(Icons.import_contacts);
  final dskdkdk = const Text("sdlfjsl");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            DefinedSize.extraSmall), // Set the border radius
      ),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.only(
            left: DefinedSize.medium, right: DefinedSize.medium),
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: DefinedSize.big, bottom: DefinedSize.medium),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 48,
                ),
                //child: HeadingThree(data: "Rizkia Adhy Syahputra"),
              ),
            ],
          ),
          HeadingThree(data: "Rizkia Adhy Syahputra"),
          Text("rizkia.as.actmp@gmail.com"),
          bigVSizedBox,
          Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account Settings',
            ),
          ),
          _CustomListTile(
            onTap: () async {
              final token = await ref
                  .read(authServiceProvider.notifier)
                  .requestPasswordReset(email: "rizkia.as.pac@gmail.com");

              print(token);
              Navigator.pushNamed(context, '/user-password-reset',
                  arguments: {'token': token});
            },
            leading: Icon(Icons.key_outlined),
            title: "Change password",
          ),
          _CustomListTile(
            onTap: () async {
              final isSuccessLogOut =
                  await ref.read(authServiceProvider.notifier).logOut();
              if (isSuccessLogOut) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            },
            leading: Icon(Icons.logout_outlined),
            title: "Logout",
          ),
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? leading;
  final String title;

  const _CustomListTile({
    Key? key,
    this.onTap,
    this.leading,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: DefinedTheme.primary100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DefinedSize.extraSmall),
      ),
      onTap: onTap,
      leading: leading,
      title: Text(title),
    );
  }
}
