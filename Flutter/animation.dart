import 'dart:js' as js;

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

class _MyWidgetState extends State<MyWidget>
    with TickerProviderStateMixin  {
  AnimationController _controller;
  AnimationController _colorController;
  Animation _hi;
  Animation _name;
  Animation _designation;
  Animation _social;
  String hi = "Hi! I am";
  String name = "Himanshu Sharma";
  String designation = "Connect with me.";

   Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.pink,
        end: Colors.red,
      ),
    ),
  ]);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5400));
    _colorController = AnimationController(vsync: this,duration: const Duration(seconds: 10),);
    _hi = StepTween(begin: 0, end: hi.length).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.0, 0.3, curve: Curves.easeIn)));
    _name = StepTween(begin: 0, end: name.length).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.24, 0.5, curve: Curves.easeIn)));
    _designation = StepTween(begin: 0, end: designation.length).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 0.8, curve: Curves.easeIn)));
    _social = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.8, 1.0, curve: Curves.fastLinearToSlowEaseIn)));
    _colorController.forward();
    _colorController.repeat(reverse: true);
    _controller.forward();
    _controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffdbe4ee),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 60),
        child: Center(
          child: FittedBox(
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _colorController,
                  builder: (context, child) {
                    return Container(
                      height: 600,
                      width: 600,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: background.evaluate(AlwaysStoppedAnimation(_colorController.value)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 6),
                            blurRadius: 20,
                            color: background.evaluate(AlwaysStoppedAnimation(_colorController.value)),
                          )
                        ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBuilder(
                            animation: _hi,
                            builder: (BuildContext context, Widget child) {
                              String text = hi.substring(0, _hi.value);
                              return ChangeTextOnHover(
                                text:text,
                                size: 35,
                              );
                            },
                          ),
                          SizedBox(height: height*0.015,),
                          AnimatedBuilder(
                            animation: _name,
                            builder: (BuildContext context, Widget child) {
                              String text = name.substring(0, _name.value);
                              return ChangeTextOnHover(
                                text: text,
                                size: 40,
                              );
                            },
                          ),
                          SizedBox(height: height*0.015,),
                          AnimatedBuilder(
                            animation: _designation,
                            builder: (BuildContext context, Widget child) {
                              String text = designation.substring(0, _designation.value);
                              return ChangeTextOnHover(
                                text:text,
                                size: 35,
                              );
                            },
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 500,
                  left: 175,
                  child: Transform.scale(
                    scale: _social.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for(int i = 0; i < socialPlatforms.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                js.context.callMethod(
                                  "open", [socialPlatforms[i]['URL']]
                                );
                              },
                              child: ChangeIconColorOnHover(
                                imgURL: socialPlatforms[i]['iconURL'],
                              )
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class ChangeTextOnHover extends StatefulWidget {
  final String text;
  final double size;

  ChangeTextOnHover({
    Key key,
    this.text,
    this.size
  }) : super(key: key);

  @override
  _ChangeTextOnHoverState createState() => _ChangeTextOnHoverState();
}

class _ChangeTextOnHoverState extends State<ChangeTextOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -0.5, 0);

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
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeIn,
        child: Text(
          widget.text.toUpperCase(),
        ),
        style: TextStyle(
          // letterSpacing: 0.2,
          fontSize: _hovering ? widget.size+5 : widget.size,
          fontWeight: FontWeight.bold,
          color: _hovering ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

class ChangeIconColorOnHover extends StatefulWidget {
  final String imgURL;

  ChangeIconColorOnHover({
    Key key,
    this.imgURL
  }) : super(key: key);

  @override
  _ChangeIconColorOnHoverState createState() => _ChangeIconColorOnHoverState();
}

class _ChangeIconColorOnHoverState extends State<ChangeIconColorOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -2, 0);

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
        duration: Duration(milliseconds: 200),
        child: Image.network(
          widget.imgURL,
          width: 40.0,
          height: 40.0,
        ),
      transform: _hovering ? hoverTransform : nonHoverTransform,
      )
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}


List socialPlatforms = [
  {
    'URL':'https://github.com/himanshusharma89',
    'iconURL':'https://img.icons8.com/fluent/50/000000/github.png'
  },
  {
    'URL':'https://twitter.com/_SharmaHimanshu',
    'iconURL':'https://img.icons8.com/color/48/000000/twitter.png'
  },
  {
    'URL':'https://www.linkedin.com/in/himanshusharma89/',
    'iconURL':'https://img.icons8.com/color/48/000000/linkedin.png'
  },
  {
    'URL':'https://stackoverflow.com/users/11545939/himanshu-sharma',
    'iconURL':'https://img.icons8.com/color/48/000000/stackoverflow.png'
  },
  {
    'URL':'https://codepen.io/himanshusharma89',
    'iconURL':'https://img.icons8.com/ios-filled/50/000000/codepen.png'
  },
];