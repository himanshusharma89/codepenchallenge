import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      title: 'Himanshu Sharma',
      debugShowCheckedModeBanner: false,
      home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double width = 38;
  double height = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
          child: Center(
            child: FittedBox(
              child: Container(
                height: 400,
                width: 400,
                child: TransformOnHover(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        height = 40;
                      });
                    },
                    child: CustomPaint(
                      painter: LogoPainter(),
                      child: Transform.translate(
                        offset: Offset(50, -120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AnimatedContainer(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.deepPurple,
                                //     offset: Offset(0, 3),
                                //     blurRadius: 10
                                //   )
                                // ]
                              ),
                              duration: Duration(milliseconds: 170),
                              curve: Curves.fastOutSlowIn,
                              onEnd: () {
                                setState(() {
                                  height = 120;
                                });
                              },
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            AnimatedContainer(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.deepPurple,
                                //     offset: Offset(0, 3),
                                //     blurRadius: 10
                                //   )
                                // ]
                              ),
                              duration: Duration(milliseconds: 170),
                              curve: Curves.fastOutSlowIn,
                              onEnd: () {
                                setState(() {
                                  height = 120;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 42
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width - size.width * 0.5, size.height);
    path.lineTo(size.width - size.width * 0.7, size.height * 1.2);
    path.lineTo(size.width - size.width * 0.7, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TransformOnHover extends StatefulWidget {
  final Widget child;

  TransformOnHover({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _TransformOnHoverState createState() => _TransformOnHoverState();
}

class _TransformOnHoverState extends State<TransformOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(10, -10, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        _mouseEnter(true);
      },
      onExit: (e) {
        _mouseEnter(false);
      },
      child: AnimatedContainer(
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
        duration: Duration(seconds: 2),
        curve: Curves.elasticOut,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
