import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/modal/modal_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List story = [
      {
        'name': 'Misgy',
        'url':
            'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?fit=crop&w=200&q=80',
      },
      {
        'name': 'kitty',
        'url':
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fit=crop&w=200&q=80',
      },
      {
        'name': 'Erland',
        'url':
            'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?fit=crop&w=200&q=80',
      },
      {
        'name': 'kitty',
        'url':
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fit=crop&w=200&q=80',
      },
      {
        'name': 'Erland',
        'url':
            'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?fit=crop&w=200&q=80',
      },
      {
        'name': 'Misgy',
        'url':
            'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?fit=crop&w=200&q=80',
      },
      {
        'name': 'Misgy',
        'url':
            'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?fit=crop&w=200&q=80',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Study'),
        elevation: 0,
        leading: IconButton(
          onPressed: () => '',
          icon: Icon(Icons.camera_alt_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () => '',
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: story.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        CustomPaint(
                          painter: RingPainter(),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                story[index]['url'],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Text(
                            story[index]['name'],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Builder(
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _modalButtonCupertino(context),
                    _modalButtonMaterial(context),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _modalButtonCupertino(BuildContext context) {
    return CupertinoButton(
      child: Text('Modal Alert Cupertino'),
      onPressed: () {
        ModalInfo.cupertinoPopup(
          context: context,
          onTap: () {
            Navigator.of(context).pop();
          },
          title: 'Map Information',
          content:
              'Report a problem with the Map data legal notices (c) OpenStreetMap',
        );
      },
    );
  }

  Widget _modalButtonMaterial(BuildContext context) {
    return ElevatedButton(
      child: Text('Modal Alert Material'),
      onPressed: () {
        ModalInfo.materialPopup(
          context: context,
          onTap: () {
            Navigator.of(context).pop();
          },
          title: 'Map Information',
          content:
              'Report a problem with the Map data legal notices (c) OpenStreetMap',
        );
      },
    );
  }
}

class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.shader = const RadialGradient(
      colors: [
        Colors.yellow,
        Colors.pink,
      ],
    ).createShader(
      Rect.fromCircle(
        center: const Offset(0, 60),
        radius: size.width * .7,
      ),
    );

    paint.style = PaintingStyle.stroke;

    paint.strokeWidth = 3;

    canvas.drawCircle(
      Offset(size.width * .5, size.height * .5),
      size.width * .5,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
