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
  String? email, password;
  bool isSecure = true;
  bool isLoading = false;
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
                isSecure: isSecure,
                controller: emailController,
              ),
              SizedBox(height: 20.h),
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
              SizedBox(height: 50.h),
              BlocListener<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  if (state is AuthCubitLoading) {
                    setState(() => isLoading = true);
                  } else if (state is AuthCubitSuccess) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have successfully logged in"),
                      ),
                    );
                  } else if (state is AuthCubitError) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).login(email: email!, password: password!);
                    }
                  },
                  loading: isLoading,
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
