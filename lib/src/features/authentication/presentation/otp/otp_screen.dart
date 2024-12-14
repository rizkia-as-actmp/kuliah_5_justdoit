import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text_button.dart';
import 'package:justdoit/src/common_widgets/custom_text_field.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/authentication/presentation/otp/otp_controller.dart';
import 'package:justdoit/src/utils/custom_exception.dart';

class InputOtpScreen extends StatelessWidget {
  const InputOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingTwo(data: "Welcome Back"),
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
      print("ht");
      final isSuccess = await controller.submit(otpCode: otpCode);

      print("ht2");
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, '/activities');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        //SnackBar(content: Text('$email - $password')),
        SnackBar(content: Text('status login : $isSuccess')),
      );
    }
  }

  _showAlertDialog(BuildContext context, error) {
    if (error is Exception) {
      print("huraaa");
    }
    ;
    print(error);
    final errorData = jsonDecode(error.toString()) as Map<String, dynamic>;
    print(errorData);
    CustomExceptionObject customError =
        CustomExceptionObject.fromJson(errorData);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: DefinedTheme.errorSurface,
          title: Center(
              child: HeadingThree(
            data: customError.message.toUpperCase(),
            color: DefinedTheme.error,
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  customError.id,
                  textAlign: TextAlign.center,
                ),
                smallVSizedBox,
                Text(
                  customError.details.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          contentTextStyle: TextStyle(color: DefinedTheme.black),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          actions: <Widget>[
            CustomWideButton(
              labelText: "Understood",
              backgroundColor: DefinedTheme.error,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
              Container(
                color: Colors.cyan,
                child: switch (state) {
                  //AsyncData(:final value) => Text('isi kepala: $value'),
                  //AsyncError(:final error) => _showAlertDialog, // error
                  _ =>
                    Center(child: Text('LOADING-STATE : ${state.isLoading}')),
                },
              ),
              //Container(
              //  color: Colors.cyan,
              //  child: switch (state2) {
              //    AsyncError(:final error) => Text('Error: $error'),
              //    _ => Center(child: Text('tes ${state.isLoading}')),
              //  },
              //),
              CustomTextField(
                controller: _otpCodeController,
                labelText: "Kode OTP",
                hintText: "2851",
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
              const Center(child: CustomTextButton(labelText: "Register"))
            ],
          ),
        ),
      ),
    );
  }
}
