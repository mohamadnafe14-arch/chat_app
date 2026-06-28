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

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late GlobalKey<FormState> formKey;
  bool isSecure = true, isConfirmSecure = true;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              CustomAppBar(title: "Create your account"),
              SizedBox(height: 5.h),
              Text(
                "please give us your details",
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
                hintText: "Enter your name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                prefixIcon: Icons.person,
                controller: nameController,
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'password must be at least 6 characters';
                  }
                  return null;
                },
                prefixIcon: Icons.lock,
                isSecure: isSecure,
                onTap: () => setState(() => isSecure = !isSecure),
              ),
              SizedBox(height: 40.h),
              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: "confirm your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (value != passwordController.text) {
                    return 'password not match';
                  }
                  return null;
                },
                prefixIcon: Icons.lock,
                isSecure: isConfirmSecure,
                onTap: () => setState(() => isConfirmSecure = !isConfirmSecure),
              ),
              SizedBox(height: 40.h),
              BlocConsumer<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  authListen(state, context, "Register successfully");
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
                  text: "Register",
                  loading: state is AuthCubitLoading,
                ),
              ),
              SizedBox(height: 20.h),
              Footer(
                firstText: "Already have an account",
                secondeText: "Login",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.login);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
