import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Animated Dialog Box",style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                showBackDilog(context);
              }, 
              child: Text("Exit App")
            )
          ],
        ),
      ),
    );
  }
  showBackDilog(context) async {
  return showAnimatedDialog(
    animationType: DialogTransitionType.scaleRotate,
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body:  Center(
            child: Container(
              height: 280,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.green,
                    ),
                    height: 100,
                    width: 250,
                    child: Image.asset('assets/images/flutterpng.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    height: 180,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Exit App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1,color: Colors.black),),
                        const SizedBox(height: 10,),
                        const Text("Do you want to really exit the app?",style: TextStyle(height: 1,color: Colors.black,fontSize: 12),),
                        const SizedBox(height: 40,),
                        Row(
                          children: [ 
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop(false);
                              },
                              child: Container(
                                  height: 30,
                                  width: 90,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: (){
                                SystemNavigator.pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
      );
    },
  );  
}
}