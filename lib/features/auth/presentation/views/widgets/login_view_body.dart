import 'package:chat_app/core/functions/auth_listen.dart';
import 'package:chat_app/core/styles/styles.dart';
import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late GlobalKey<FormState> formKey;
  bool isSecure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomAppBar(title: "Login"),
              SizedBox(height: 5.h),
              Text(
                "please Login to your account",
                style: small.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "Enter your email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains("@")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                prefixIcon: Icons.email,
                controller: emailController,
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                prefixIcon: Icons.lock,
                isSecure: isSecure,
                onTap: () => setState(() => isSecure = !isSecure),
                controller: passwordController,
              ),
              SizedBox(height: 40.h),
              BlocConsumer<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  authListen(state, context, "Login successfully");
                },
                builder: (context, state) => CustomButton(
                  onPressed: state is AuthCubitLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<AuthCubit>(context).register(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                  text: "Login",
                  loading: state is AuthCubitLoading,
                ),
              ),
              SizedBox(height: 20.h),
              Footer(
                firstText: "No account?",
                secondeText: "Register",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
