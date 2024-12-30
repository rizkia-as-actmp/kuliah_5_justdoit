import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/features/authentication/presentation/login/login_controller.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(data: "Login"),
          extraBigVSizedBox,
          const _LoginUserForm(),
        ],
      ),
    );
  }
}

// Kita gunakan `ConsumerStatefulWidget`, widget ini seperti gabungan `Consumer` dan `StatefulWidget`.
class _LoginUserForm extends ConsumerStatefulWidget {
  const _LoginUserForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginUserFormState();
}

// saat kita menggunakan riverpod kita tidak menggunakan 'State' tetapi 'ConsumerState'
class _LoginUserFormState extends ConsumerState<_LoginUserForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    _emailController.text = "rizkia.as.pac@gmail.com";
    _passwordController.text = "21204444";
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  final _emailController = TextEditingController();
  String get email => _emailController.text;

  final _passwordController = TextEditingController();
  String get password => _passwordController.text;

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(loginControllerProvider.notifier);
      final isSuccess =
          await controller.submit(email: email, password: password);

      if (isSuccess) {
        Navigator.pushReplacementNamed(context, '/verify-otp');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // state disini digunakan hanya untuk membaca state pada loginControllerProvider
    final state = ref.watch(loginControllerProvider);

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
              // Container(
              //   color: Colors.cyan,
              //   child: switch (state) {
              //     //AsyncData(:final value) => Text('isi kepala: $value'),
              //     //AsyncError(:final error) => Text('Error: $error'),
              //     _ => Center(child: Text('tes ${state.isLoading}')),
              //   },
              // ),
              CustomTextField(
                controller: _emailController,
                labelText: "Email address",
                hintText: "your.account@mail.com",
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                hintText: "super_secret_password",
                disabled: state.isLoading,
                obscureText: true,
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "Login",
                onPressed: _onSubmit,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              const Center(child: Text("Or")),
              mediumVSizedBox,
              Center(
                  child: CustomTextButton(
                labelText: "Register",
                disabled: state.isLoading,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register-user');
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
