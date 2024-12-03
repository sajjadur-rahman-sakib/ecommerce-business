import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce/presentation/ui/utils/snack_message.dart';
import 'package:ecommerce/presentation/ui/widgets/app_logo_widget.dart';
import 'package:ecommerce/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "Please enter your email address",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black54,
                      ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<EmailVerificationController>(
                    builder: (emailVerificationController) {
                  return Visibility(
                    visible: !emailVerificationController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text("Next"),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool result = await _emailVerificationController.verifyEmail(
      _emailTEController.text.trim(),
    );

    if (result) {
      Get.to(
        () => OtpVerificationScreen(
          email: _emailTEController.text.trim(),
        ),
      );
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          _emailVerificationController.errorMessage!,
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
