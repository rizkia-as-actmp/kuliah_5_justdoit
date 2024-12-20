import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_wide_button.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/common_widgets/show_success_dialog.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_controller.dart';

class RegisterCompleteScreen extends ConsumerStatefulWidget {
  const RegisterCompleteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterCompleteScreenState();
}

class _RegisterCompleteScreenState
    extends ConsumerState<RegisterCompleteScreen> {
  late Map<String, String> data;

  Future<void> _requestVerification() async {
    final isSuccess = await ref
        .read(registerControllerProvider.notifier)
        .requestVerification(email: data['email']!);

    if (isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSuccessDialog(
            context: context,
            title: "Pembayar Berhasil Dikirim",
            content:
                "Hai ${data['name']}, email pembayaranmu telah kami kirimkan. Batas pembayaranmu adalah 1 jam sejak email dikirimkan");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    });
  }

  @override
  Widget build(BuildContext context) {
    // terima data dari arguments yang dikirimkan oleh Navigator.pushReplacementNamed

    final state = ref.watch(registerControllerProvider);

    if (state is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showExceptionDialog(context, state.error);
      });
    }

    //int currentHour = int.parse(data['time']!.split(':')[0]);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingTwo(
              data: "Registrasi Berhasil",
            ),
            mediumVSizedBox,
            _CustomText(
              data: "Halo ${data['name']},",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data:
                  "Untuk melanjutkan aktivasi akun Anda, silakan tekan tombol 'Ajukan Verifikasi' di bawah ini. Setelah itu, kami akan mengirimkan email berisi detail pembayaran untuk aktivasi akun Anda.",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data: "Langkah selanjutnya:",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data:
                  "1. Tekan tombol 'Ajukan Verifikasi' untuk menerima detail pembayaran melalui email.",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data:
                  "2. Buka email yang kami kirim dan ikuti instruksi untuk menyelesaikan pembayaran.",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data:
                  "3. Setelah pembayaran Anda dikonfirmasi, akun Anda akan diaktifkan, dan Anda dapat mulai menggunakan layanan kami.",
              textAlign: TextAlign.justify,
            ),
            const _CustomText(
              data:
                  "Jika Anda tidak menemukan email di kotak masuk, periksa folder spam atau junk.",
              textAlign: TextAlign.justify,
            ),
            extraBigVSizedBox,
            CustomWideButton(
              labelText: "Ajukan Verifikasi",
              backgroundColor: DefinedTheme.success,
              disabled: state.isLoading,
              onPressed: _requestVerification,
            ),
            mediumVSizedBox,
            CustomWideButton(
              labelText: "Kembali ke Login",
              disabled: state.isLoading,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String data;
  const _CustomText({
    required this.data,
    this.textAlign = TextAlign.left,
  });

  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 14, color: DefinedTheme.onBackground),
    );
  }
}
