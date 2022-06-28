import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

///////////////////////

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  //

  final _textKey = GlobalKey();
  final _textKey2 = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //

    Size size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        print('screen : ${size.height}');

        final height1 = _textKey.currentContext!.size!.height;
        print('height1 : $height1');

        final height2 = _textKey2.currentContext!.size!.height;
        print('height2 : $height2');
      },
    );

    //

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              key: _textKey,
              child: const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            const Divider(
              thickness: 2,
              color: Colors.indigo,
            ),
            Container(
              height: 130,
              key: _textKey2,
              child: const Text("Lorem"),
            ),
          ],
        ),
      ),
    );
  }
}
