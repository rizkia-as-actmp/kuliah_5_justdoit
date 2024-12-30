import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/authentication/data/auth_repository.dart';
import 'package:justdoit/src/features/authentication/presentation/password_reset/password_reset_controller.dart';
import 'package:justdoit/src/features/mark/application/mark_service.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(data: "Ubah Password"),
          extraBigVSizedBox,
          const _PasswordResetForm(),
        ],
      ),
    );
  }
}

// Menggunakan `ConsumerStatefulWidget` untuk form yang membutuhkan state.
class _PasswordResetForm extends ConsumerStatefulWidget {
  const _PasswordResetForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordResetFormState();
}

class _PasswordResetFormState extends ConsumerState<_PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusScopeNode _focusNode;

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String get oldPassword => _oldPasswordController.text;
  String get newPassword => _newPasswordController.text;
  String get confirmPassword => _confirmPasswordController.text;

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final passedArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

      if (passedArguments == null) {
        throw CustomException(id: "6a41a917", details: "Token is missing");
      }

      final controller = ref.read(changePasswordControllerProvider.notifier);
      final isSuccess = await controller.submit(
          oldPassword: oldPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword,
          token: passedArguments['token']!);

      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final passedArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (passedArguments == null || passedArguments['token'] == null) {
      return const Center(
        child: Text("Token is missing"),
      );
    }

    final state = ref.watch(changePasswordControllerProvider);
    // Menampilkan dialog error jika ada error
    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
        ref.invalidate(changePasswordControllerProvider);
      });
    }

    return FocusScope(
      node: _focusNode,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(
                controller: _oldPasswordController,
                labelText: "Password Lama",
                hintText: "Masukkan password lama",
                obscureText: true,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _newPasswordController,
                labelText: "Password Baru",
                hintText: "Masukkan password baru",
                obscureText: true,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _confirmPasswordController,
                labelText: "Konfirmasi Password Baru",
                hintText: "Masukkan ulang password baru",
                obscureText: true,
                disabled: state.isLoading,
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "Simpan",
                onPressed: _onSubmit,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              const Center(child: Text("Atau")),
              mediumVSizedBox,
              Center(
                child: CustomTextButton(
                  labelText: "Kembali",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  disabled: state.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
