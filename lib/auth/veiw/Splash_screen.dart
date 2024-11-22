import 'package:call_save_data/auth/provider/splash_provider.dart';
import 'package:call_save_data/auth/veiw/login_screen.dart';
import 'package:call_save_data/desh_board/desh_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeValue();
  }
  Future changeValue()async{
    SplashProvider splashProvider=Provider.of(context,listen: false);
    bool isLogin=await splashProvider.checkInfo();
    if(isLogin){
      if(mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return const DeskBoardScreen();
        }));
      }
    }else{
      if(mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("data"),
        )
      ],
    ),
    );
  }
}
