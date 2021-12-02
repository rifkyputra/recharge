import 'dart:io';

import 'package:flutter/material.dart';
import 'package:utilities/ffi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LookupPage())),
          child: Text('loookup'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FfiPage())),
          child: Text('ffi'),
        ),
      ],
    );
  }
}

class LookupPage extends StatelessWidget {
  const LookupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _useCase(
              context: context,
              title: '404',
              buttonText: 'Start Lookup',
              description:
                  'when url is not found lookup returned a single list address. ',
              buttonOnTap: () async {
                final result = await InternetAddress.lookup(
                    'https://somerandomurl.randomurl'
                        .replaceAll(RegExp(r'https?:\/\/'), ''));

                print(result);
              },
            ),
            _useCase(
              context: context,
              title: 'success',
              buttonText: 'Start Lookup',
              description: 'when url is valid, and success has list ',
              buttonOnTap: () async {
                final result = await InternetAddress.lookup('https://google.com'
                    .replaceAll(RegExp(r'https?:\/\/'), ''));

                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _useCase({
    required BuildContext context,
    required String title,
    required String buttonText,
    required String description,
    required buttonOnTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 6),
          ElevatedButton(
            onPressed: buttonOnTap,
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}

AppBar backAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}
