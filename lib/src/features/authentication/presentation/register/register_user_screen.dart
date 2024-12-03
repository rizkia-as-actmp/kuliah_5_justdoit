import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: perlu scaffold bila di main tidak ada jadi gak bisa langsung taro RegisterPendudukContents
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(
            data: "Welcome",
          ),
          extraBigVSizedBox,
          const _RegisterUserForm(),
        ],
      ),
    );
  }
}

class _RegisterUserForm extends StatefulWidget {
  const _RegisterUserForm({super.key});

  @override
  State<_RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<_RegisterUserForm> {
  final _formKey = GlobalKey<FormState>();
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _nameController.addListener(_printLatestValue);
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

  void _printLatestValue() {
    print('Second text field: $name (${name.characters.length})');
  }

  void _onSubmit() {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       // Retrieve the text that the user has entered by using the
    //       // TextEditingController.
    //       content: Text(name),
    //     );
    //   },
    // );

    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                hintText: "Nama",
              ),
              mediumVSizedBox,
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
              mediumVSizedBox,
              CustomTextField(
                controller: _passwordConfirmController,
                labelText: "Password confirm",
                hintText: "Masukkan sesuatu",
              ),
              extraBigVSizedBox,
              CustomWideButton(
                labelText: "register",
                onSubmit: _onSubmit,
              ),
              mediumVSizedBox,
              const Center(child: Text("Or")),
              mediumVSizedBox,
              const Center(
                child: CustomTextButton(labelText: "Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
