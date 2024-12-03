import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(data: "Welcome Back"),
          extraBigVSizedBox,
          const _LoginUserForm(),
        ],
      ),
    );
  }
}

class _LoginUserForm extends StatefulWidget {
  const _LoginUserForm({super.key});
  @override
  State<_LoginUserForm> createState() => _LoginUserFormState();
}

class _LoginUserFormState extends State<_LoginUserForm> {
  final _formKey = GlobalKey<FormState>();
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
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

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _emailController,
                labelText: "Email address",
                hintText: "Masukkan sesuatu",
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                hintText: "Masukkan sesuatu",
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "Login",
                onSubmit: _onSubmit,
              ),
              mediumVSizedBox,
              const Center(child: Text("Or")),
              mediumVSizedBox,
              const Center(child: CustomTextButton(labelText: "Register"))
            ],
          ),
        ),
      ),
    );
  }
}
