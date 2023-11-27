import 'package:flutter/material.dart';
import 'package:text_to_image/api/rest.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage(),);
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
TextEditingController textController = TextEditingController();
 bool isLoading = false;
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
        appBar: AppBar(title: const Text("image to text")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter your prompt',
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
     ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF9DB2BF),
                    ),
                    onPressed: () {
                      convertTextToImage(textController.text, context);
                      isLoading = true;

                      setState(() {});
                    },
                    child: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child:
                                CircularProgressIndicator(color: Colors.black))
                        : const Text('Generate Image',
                            style: TextStyle(color: Colors.black)),
                  ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),

    );
  }
}
