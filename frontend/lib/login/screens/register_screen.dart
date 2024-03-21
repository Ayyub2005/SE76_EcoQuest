import 'package:flutter/material.dart';
import '../components/app_text_form_field.dart';
import '../utils/common_widgets/gradient_background.dart';
import '../utils/helpers/navigation_helper.dart';
import '../utils/helpers/snackbar_helper.dart';
import '../values/app_constants.dart';
import '../values/app_regex.dart';
import '../values/app_routes.dart';
import '../values/app_strings.dart';
import '../values/app_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  void initializeControllers() {
    nameController = TextEditingController()
      ..addListener(controllerListener);
    emailController = TextEditingController()
      ..addListener(controllerListener);
    passwordController = TextEditingController()
      ..addListener(controllerListener);
    confirmPasswordController = TextEditingController()
      ..addListener(controllerListener);
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void controllerListener() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty) return;

    if (AppRegex.emailRegex.hasMatch(email) &&
        AppRegex.passwordRegex.hasMatch(password) &&
        AppRegex.passwordRegex.hasMatch(confirmPassword)) {
      fieldValidNotifier.value = true;
    } else {
      fieldValidNotifier.value = false;
    }
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/page1-bg.jpg', // Your image asset path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Background Image
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            // Add your image here
                            Image.asset(
                              'assets/Logo-final.png', // Your image asset path
                              width: 500, // Adjust size as needed
                              height: 150,
                            ),

                            const Text(
                              AppStrings.signUp,
                              style: AppTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(AppStrings.createYourAccount,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 162, 142, 1),
                        ),
                      ),

                      AppTextFormField(
                        autofocus: true,
                        labelText: AppStrings.name,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseEnterName
                              : value.length < 4
                              ? AppStrings.invalidName
                              : null;
                        },
                        controller: nameController,
                      ),
                      AppTextFormField(
                        labelText: AppStrings.email,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) => _formKey.currentState?.validate(),
                        validator: (value) {
                          return value!.isEmpty
                              ? AppStrings.pleaseEnterEmailAddress
                              : AppConstants.emailRegex.hasMatch(value)
                              ? null
                              : AppStrings.invalidEmailAddress;
                        },
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: passwordNotifier,
                        builder: (_, passwordObscure, __) {
                          return AppTextFormField(
                            obscureText: passwordObscure,
                            controller: passwordController,
                            labelText: AppStrings.password,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (_) => _formKey.currentState?.validate(),
                            validator: (value) {
                              return value!.isEmpty
                                  ? AppStrings.pleaseEnterPassword
                                  : AppConstants.passwordRegex.hasMatch(value)
                                  ? null
                                  : AppStrings.invalidPassword;
                            },
                            suffixIcon: Focus(
                              /// If false,
                              ///
                              /// disable focus for all of this node's descendants
                              descendantsAreFocusable: false,

                              /// If false,
                              ///
                              /// make this widget's descendants un-traversable.
                              // descendantsAreTraversable: false,
                              child: IconButton(
                                onPressed: () =>
                                passwordNotifier.value = !passwordObscure,
                                style: IconButton.styleFrom(
                                  minimumSize: const Size.square(48),
                                ),
                                icon: Icon(
                                  passwordObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: confirmPasswordNotifier,
                        builder: (_, confirmPasswordObscure, __) {
                          return AppTextFormField(
                            labelText: AppStrings.confirmPassword,
                            controller: confirmPasswordController,
                            obscureText: confirmPasswordObscure,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (_) => _formKey.currentState?.validate(),
                            validator: (value) {
                              return value!.isEmpty
                                  ? AppStrings.pleaseReEnterPassword
                                  : AppConstants.passwordRegex.hasMatch(value)
                                  ? passwordController.text ==
                                  confirmPasswordController.text
                                  ? null
                                  : AppStrings.passwordNotMatched
                                  : AppStrings.invalidPassword;
                            },
                            suffixIcon: Focus(
                              /// If false,
                              ///
                              /// disable focus for all of this node's descendants.
                              descendantsAreFocusable: false,

                              /// If false,
                              ///
                              /// make this widget's descendants un-traversable.
                              // descendantsAreTraversable: false,
                              child: IconButton(
                                onPressed: () => confirmPasswordNotifier.value =
                                !confirmPasswordObscure,
                                style: IconButton.styleFrom(
                                  minimumSize: const Size.square(48),
                                ),
                                icon: Icon(
                                  confirmPasswordObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: fieldValidNotifier,
                        builder: (_, isValid, __) {
                          return FilledButton(
                            onPressed: isValid
                                ? () {
                              SnackbarHelper.showSnackBar(
                                AppStrings.registrationComplete,
                              );
                              nameController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                            }
                                : null,
                            child: const Text(AppStrings.signUp),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.iHaveAnAccount,
                    style: AppTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () => NavigationHelper.pushReplacementNamed(

                      AppRoutes.login,
                    ),
                    child: const Text(AppStrings.login),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


}
