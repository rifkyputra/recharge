import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running Isolate',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Running Isolate',
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const ContentWidget(),
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
  late ValueNotifier<bool> isIsolate;
  late ValueNotifier<int> totalFactorial;
  late ValueNotifier<BigInt> totalResult;

  @override
  void initState() {
    isIsolate = ValueNotifier<bool>(false);
    totalFactorial = ValueNotifier<int>(0);
    totalResult = ValueNotifier<BigInt>(BigInt.zero);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            const Text('Use Isolate ?'),
            const SizedBox(height: 5),
            useIsolate(context),
            const SizedBox(height: 10),
            const Text('How Many Factorial'),
            const SizedBox(height: 5),
            TextField(
              onChanged: _assignIntToValue(totalFactorial),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
                animation:
                    Listenable.merge([totalResult, totalFactorial, isIsolate]),
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed: _calculateFactorial(totalFactorial.value),
                    child: const Text('Calculate Now'),
                  );
                }),
            const SizedBox(height: 35),
            const Text('Your Result is : '),
            const SizedBox(height: 10),
            ValueListenableBuilder(
                valueListenable: totalResult,
                builder: (context, BigInt val, __) {
                  return Text(
                    (val >
                                BigInt.
                            ? BigInt.from(
                                    9999999999999999999999999999999999999999999)
                                .toString()
                            : val.toString())
                        .toString(),
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
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

  Widget useIsolate(BuildContext context) => ValueListenableBuilder(
        valueListenable: isIsolate,
        builder: (context, val, _) {
          return ToggleButtons(
            borderRadius: BorderRadius.circular(8),
            children: const [
              Padding(
                padding: EdgeInsets.all(7),
                child: Text('Off'),
              ),
              Padding(
                padding: EdgeInsets.all(7),
                child: Text('On'),
              )
            ],
            onPressed: (i) {
              isIsolate.value = !isIsolate.value;
            },
            isSelected:
                isIsolate.value ? const [false, true] : const [true, false],
          );
        },
      );

  void Function(String?) _assignIntToValue(
    ValueNotifier<int> notifier,
  ) {
    return (val) {
      notifier.value = int.tryParse(val ?? '--') ?? 0;
    };
  }

  void Function() _calculateFactorial(
    int total,
  ) {
    return () async {
      try {
        if (isIsolate.value) {
          compute(calculate, total)
              .then((val) => totalResult.value = val)
              .catchError((e) => print(e));
        } else {
          BigInt result;

          result = calculate(total);
          totalResult.value = result;
        }
      } catch (e) {
        //
      }
    };
  }

  static BigInt calculate(int total) {
    BigInt result = BigInt.from(total);

    for (int i = total; i > 1; i--) {
      result = result * (BigInt.from(i) - BigInt.one);
    }

    return result;
  }
}
