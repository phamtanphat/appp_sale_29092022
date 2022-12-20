import 'package:appp_sale_29092022/presentation/features/home/home_page.dart';
import 'package:appp_sale_29092022/presentation/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // lấy nội dung ô nhập liệu
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status == SignInStatus.success) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const HomePage())));
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: const Text('Sing In'),
                    centerTitle: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        // fix bàn phím đẩy (bốp) layout: SingleChildScrollView (columnn hoặc row )
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 40, 0, 60),
                                child: Image.asset(
                                    'assets/images/ic_hello_food.png'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    // có 2 loại phổ biến
                                    // loại 1 : OutlineInputBorder (có khung xung quanh)
                                    // loại 2 : UnderlineInputBorder ( khung viên chỉ có ở dưới)
                                    border: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(
                                      //   Radius.circular(4),
                                      // ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    // phủ màu ô nhập liệu , bật
                                    fillColor: Colors.grey.withOpacity(0.3),
                                    filled: true,
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.email_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 60, 20, 60),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'PassWord',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    fillColor: Colors.grey.withOpacity(0.3),
                                    filled: true,
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Wiget để nhận hành động click
                              GestureDetector(
                                onTap: () {
                                  context.read<SignInBloc>().add(
                                      OnTapButtonLogin(
                                          email: emailController.text,
                                          password: passwordController.text));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 50, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Don\'t have an account!',
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // UI vẽ lại widget bên dưới khi emit ra status = SignInStatus.loading
                state.status == SignInStatus.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
