import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_controller.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: perlu scaffold bila di main tidak ada jadi gak bisa langsung taro _RegisterUserForm
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(
            data: "Registration",
          ),
          extraBigVSizedBox,
          const _RegisterUserForm(),
        ],
      ),
    );
  }
}

class _RegisterUserForm extends ConsumerStatefulWidget {
  const _RegisterUserForm({super.key});

  @override
  //State<_RegisterUserForm> createState() => _RegisterUserFormState();
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterUserFormState();
}

class _RegisterUserFormState extends ConsumerState<_RegisterUserForm> {
  final _formKey = GlobalKey<FormState>();
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  // Create a text controller and use it to retrieve the current value

  // of the TextField.
  final _nameController = TextEditingController();
  String get name => _nameController.text; // NOTE: get untuk menandai gettter

  final _emailController = TextEditingController();
  String get email => _emailController.text;

  final _passwordController = TextEditingController();
  String get password => _passwordController.text;

  final _passwordConfirmController = TextEditingController();
  String get passwordConfirm => _passwordConfirmController.text;

  void _onSubmit() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(registerControllerProvider.notifier);
      final user = await controller.submit(
          name: name,
          email: email,
          password: password,
          passwordConfirm: passwordConfirm);

      if (user != null && mounted) {
        // The warning occurs because BuildContext is used after an async operation, which can lead to errors if the widget is no longer mounted; fix this by checking if the widget is still mounted before using BuildContext.
        // force destroy the provider.
        ref.invalidate(registerControllerProvider);
        Navigator.pushReplacementNamed(context, '/registration-complete',
            arguments: {
              'name': user.name!,
              'email': user.email!,
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerControllerProvider);

    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
      });
    }

    // Build a Form widget using the _formKey created above.
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
                controller: _nameController,
                labelText: "Nama",
                hintText: "nama anda",
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _emailController,
                labelText: "Email address",
                hintText: "email.anda@mail.com",
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                hintText: "password_rahasia",
                obscureText: true,
                disabled: state.isLoading,
              ),
              mediumVSizedBox,
              CustomTextField(
                controller: _passwordConfirmController,
                labelText: "Password confirm",
                hintText: "password_rahasia",
                obscureText: true,
                disabled: state.isLoading,
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "register",
                disabled: state.isLoading,
                onPressed: _onSubmit,
              ),
              mediumVSizedBox,
              const Center(child: Text("Og")),
              mediumVSizedBox,
              Center(
                child: CustomTextButton(
                  labelText: "Login",
                  disabled: state.isLoading,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
