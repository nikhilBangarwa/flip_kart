
import 'package:call_save_data/auth/model/auth_model.dart';
import 'package:call_save_data/auth/provider/auth_provider.dart';
import 'package:call_save_data/auth/veiw/sigh_up_screen.dart';
import 'package:call_save_data/desh_board/desh_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isTrue = false;
  bool searching=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customBody()
    );
  }

  Widget customBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Account ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.blue),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.blue),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Username or email',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      height: 20,
                      child: const Icon(
                        Icons.account_circle,
                        color: Colors.blue, // Icon color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildTextFormField(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                      value: isTrue,
                      onChanged: (value) {
                        setState(() {
                          isTrue = value!;
                        });
                      }),
                  const Text('Remember me'),
                  const SizedBox(
                    width: 220,
                  ),
                  Consumer<AuthProvider>(
                    builder: (context,provider,child){
                     if(provider.isLogin){
                       return const CircularProgressIndicator();
                     }else{
                      return GestureDetector(
                         onTap: login,
                         child: Container(
                           alignment: Alignment.center,
                           height: 55,
                           width: 100,
                           decoration: BoxDecoration(
                             color: Colors.blue,
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: const Text(
                             'Login',
                             style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.white),
                           ),
                         ),
                       );
                     }
                    },
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SighUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Create a new account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      )),

                ],
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Or', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20,),



            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      obscureText:  searching?false:true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.blue),
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  hintText: 'password',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),

                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      height: 20,
                      width: 20,
                      child: const Icon(
                        Icons.key,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                    suffixIcon: IconButton(
                      onPressed: () {
                       setState(() {
                         searching=!searching;
                       });
                      },
                      icon: searching ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off_outlined),
                    )


                ),
              );
  }


  void login() async{
    String email = emailController.text;
    String password = passwordController.text;
    if (key.currentState?.validate() ?? false) {
      User user = User(email: email, password: password);
      AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: false);
      await authProvider.login(user);
      if(authProvider.isAuthenticated){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const DeskBoardScreen();
        }));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your password is  Not macha")));
      }
    }
  }
}


