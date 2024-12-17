import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // terima data dari arguments yang dikirimkan oleh Navigator.pushReplacementNamed
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    //int currentHour = int.parse(data['time']!.split(':')[0]);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingTwo(
              data: "Registration complete",
            ),
            mediumVSizedBox,
            _CustomText(data: "Hello ${data["name"]},"),
            const _CustomText(
                data:
                    "We’ve sent you an email regarding your payment for account activation. Please check your inbox for further instructions on how to complete the payment and activate your account."),
            const _CustomText(data: "Next steps:"),
            const _CustomText(
                data: "1. Open the email we sent you with payment details."),
            const _CustomText(
                data: "2. Follow the instructions to complete your payment."),
            const _CustomText(
                data:
                    "3. Once the payment is confirmed, your account will be activated and you can start using our services."),
            const _CustomText(
                data:
                    "If you don't see the email in your inbox, please check your spam or junk folder."),
            extraBigVSizedBox,
            CustomWideButton(
                labelText: "Back to login",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                })
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String data;
  const _CustomText({required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontSize: 14, color: DefinedTheme.onBackground),
    );
  }
}
