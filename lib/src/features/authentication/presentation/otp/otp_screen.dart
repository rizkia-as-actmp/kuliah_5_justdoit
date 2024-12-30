import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/features/authentication/presentation/otp/otp_controller.dart';

class InputOtpScreen extends StatelessWidget {
  const InputOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(data: "Verifikasi OTP"),
          extraBigVSizedBox,
          const _InputOtpForm(),
        ],
      ),
    );
  }
}

// Kita gunakan `ConsumerStatefulWidget`, widget ini seperti gabungan `Consumer` dan `StatefulWidget`.
class _InputOtpForm extends ConsumerStatefulWidget {
  const _InputOtpForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputOtpFormState();
}

// saat kita menggunakan riverpod kita tidak menggunakan 'State' tetapi 'ConsumerState'
class _InputOtpFormState extends ConsumerState<_InputOtpForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _otpCodeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  final _otpCodeController = TextEditingController();
  String get otpCode => _otpCodeController.text;

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(otpControllerProvider.notifier);
      final isSuccess = await controller.submit(otpCode: otpCode);

      if (isSuccess) {
        Navigator.pushReplacementNamed(context, '/splash');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // state disini digunakan hanya untuk membaca state pada loginControllerProvider
    final state = ref.watch(otpControllerProvider);

    // Check for AsyncError state and show dialog using a side effect
    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
      });
    }

    return FocusScope(
      node: _focusNode,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                controller: _otpCodeController,
                labelText: "Kode OTP",
                hintText: "- - - -",
                disabled: state.isLoading,
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "Submit",
                onPressed: _onSubmit,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              const Center(child: Text("Or")),
              mediumVSizedBox,
              Center(
                  child: CustomTextButton(
                labelText: "Register",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register-user');
                },
                disabled: state.isLoading,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
