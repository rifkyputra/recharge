import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        body: ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    final totalIsolates = ValueNotifier<int>(0);
    final totalFactorial = ValueNotifier<int>(0);
    final totalResult = ValueNotifier<BigInt>(BigInt.zero);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Running Isolate',
              style: Theme.of(context).textTheme.headline3,
            ),
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('How Many Isolates ?'),
            SizedBox(height: 5),
            TextField(
              onChanged: _assignIntToValue(totalIsolates),
            ),
            SizedBox(height: 10),
            Text('How Many Factorial'),
            SizedBox(height: 5),
            TextField(
              onChanged: _assignIntToValue(totalFactorial),
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
                animation: Listenable.merge(
                    [totalResult, totalFactorial, totalIsolates]),
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed:
                        _calculateFactorial(totalResult, totalFactorial.value),
                    child: Text('Calculate Now'),
                  );
                }),
            SizedBox(height: 35),
            Text('Your Result is : '),
            SizedBox(height: 10),
            ValueListenableBuilder(
                valueListenable: totalResult,
                builder: (context, _, __) {
                  return Text(
                    totalResult.value.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.brown,
                        ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void Function(String?) _assignIntToValue(
    ValueNotifier<int> notifier,
  ) {
    return (val) {
      notifier.value = int.tryParse(val ?? '--') ?? 0;
    };
  }

  void Function() _calculateFactorial(
    ValueNotifier<BigInt> notifier,
    int total,
  ) {
    return () async {
      BigInt result = await compute(calculate, total);

      notifier.value = result;
    };
  }

  static BigInt calculate(int total) {
    BigInt result = BigInt.from(total);

    for (int i = total; i > 1; i--) {
      result = result * (BigInt.from(i) - BigInt.one);
      print('$i ---> result = $result ');
    }

    return result;
  }
}
