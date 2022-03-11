import 'package:flutter/material.dart';
import 'package:flutter_app_msu2/views/show_list_ui.dart';

class SplasScreenUI extends StatefulWidget {
  const SplasScreenUI({Key? key}) : super(key: key);

  @override
  State<SplasScreenUI> createState() => _SplasScreenUIState();
}

class _SplasScreenUIState extends State<SplasScreenUI> {
  void initState() {
    // TODO: implement initState
    // หน่วยเวลาหน้าจอ
    Future.delayed(
      Duration(
        seconds: 5,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ShowListUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey,
      // ),
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/fastfood.png",
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "สายด่วนชวนกิน",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Created by MSU 2022",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
