import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Himanshu Sharma',
      debugShowCheckedModeBanner: false,
      home: ResponsiveWidget()
    )
  );
}
    
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return (ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
      ? DesktopWidget()
      : MobileWidget();   
  }
}

class DesktopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,width:width,
        color: const Color(0xff0C0F0A),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(90,-200),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    fontSize:350,
                    color: Colors.blue[200].withOpacity(0.02),
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                )
              )
            ),
            Transform.translate(
              offset: Offset(50,200),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'DEV',
                    style: TextStyle(
                      fontSize:350,
                      color: Colors.blue[200].withOpacity(0.02),
                      fontWeight: FontWeight.bold
                    ),
                    maxLines: 1,
                  ),
                )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
              ]
            ),
            Transform.translate(
              offset: Offset(width*0.4,height*0.4),
              child: Container(
                width: width*0.545,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height*0.18,
                      width: 145,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for(int i=0;i<5;i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for(int j=0;j<5;j++)
                                  Dot()
                              ],
                            )
                        ],
                      ),
                    ),
                    Container(
                      height: height*0.18,
                      width: 145,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for(int i=0;i<5;i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for(int j=0;j<5;j++)
                                  Dot()
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: VerticalNavBar()
            ),
            // Transform.translate(
            //   offset: Offset(1,height*0.179),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Align(
            //       alignment: Alignment.centerRight,
            //       child: RichText(
            //         textAlign: TextAlign.left,
            //         text: TextSpan(
            //           text:'HEY',
            //           style: TextStyle(
            //             color: Colors.transparent.withOpacity(0),
            //             fontSize:120,
            //             fontWeight: FontWeight.bold,
            //             shadows: [
            //               Shadow( // bottomLeft
            //                 offset: Offset(-1.5, -1.5),
            //                 blurRadius: 2,
            //                 color: Colors.purpleAccent
            //               ),
            //               Shadow( // bottomRight
            //                 offset: Offset(1.5, -1.5),
            //                 blurRadius: 2,
            //                 color: Colors.red
            //               ),
            //               Shadow( // topRight
            //                 offset: Offset(1.5, 1.5),
            //                 blurRadius: 2,
            //                 color: Colors.pink
            //               ),
            //               Shadow( // topLeft
            //                 offset: Offset(-1.5, 1.5),
            //                 blurRadius: 2,
            //                 color: Colors.deepPurple
            //               ),
            //             ],
            //           ),
            //           children:[
            //             TextSpan(
            //              text:'.\n',
            //               style: TextStyle(
            //                 // color: Color(0xff3CAEA3)
            //               )
            //             ),
            //             TextSpan(
            //               text:'I AM\n',
            //               style: TextStyle(
            //                 // color: Color(0xffFEC601)
            //               )
            //             ),
            //             TextSpan(
            //               text:'HIMANSHU',
            //               style: TextStyle(
            //                 // color: Color(0xff61FF7E)
            //               )
            //             )
            //           ]
            //         ),
            //       )
            //     ),
            //   )
            // ),
            Transform.translate(
              offset: Offset(0,height*0.18),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:'HEY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:120,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(
                         text:'.\n',
                          style: TextStyle(
                            // color: Color(0xff3CAEA3)
                          )
                        ),
                        TextSpan(
                          text:'I AM\n',
                          style: TextStyle(
                            // color: Color(0xffFEC601)
                          )
                        ),
                        TextSpan(
                          text:'HIMANSHU',
                          style: TextStyle(
                            // color: Color(0xff61FF7E)
                          )
                        )
                      ]
                    ),
                  )
                ),
              )
            ),
          ],
        ),
      )
    );
  }

}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,width: 4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.5)
      ),
    );
  }
}

class MobileWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height:height,width:width,
        color: const Color(0xff0C0F0A),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                VerticalLine(color:Color(0xff1c3144)),
                // VerticalLine(color:Color(0xff1c3144)),
              ]
            ),
            Transform.translate(
              offset: Offset(100,-160),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    fontSize:260,
                    color: Colors.blue[200].withOpacity(0.02),
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                )
              )
            ),
            Transform.translate(
              offset: Offset(50,180),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'DEV',
                  style: TextStyle(
                    fontSize:260,
                    color: Colors.blue[200].withOpacity(0.02),
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                )
              )
            ),
            Transform.translate(
              offset: Offset(width*0.6,height*0.5),
              child: Container(
                width: 145,
                child: Container(
                  height: height*0.18,
                  width: 145,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(int i=0;i<5;i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for(int j=0;j<5;j++)
                              Dot()
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: VerticalNavBar()
            ),
            Transform.translate(
              offset: Offset(0,height*0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  // offset: Offset(width*0.48,height*0.35),
                  child: FittedBox(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text:'HEY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:100,
                          fontWeight: FontWeight.bold
                        ),
                        children:[
                          TextSpan(
                           text:'.\n',
                            style: TextStyle(
                              // color: Color(0xff3CAEA3)
                            )
                          ),
                          TextSpan(
                            text:'I AM\n',
                            style: TextStyle(
                              // color: Color(0xffFEC601)
                            )
                          ),
                          TextSpan(
                            text:'HIMANSHU',
                            style: TextStyle(
                              // color: Color(0xff61FF7E)
                            )
                          )
                        ]
                      ),
                    ),
                  )
                ),
              )
            )
          ]
        )
      )
    );
  }
}

class VerticalNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,width:width*0.035,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ChangeTextColorOnHover(
              text: 'LINKEDIN', 
              color: Colors.blue,
              message: 'himanshusharma89',
            ),
            ChangeTextColorOnHover(
              text: 'GITHUB', 
              color: Colors.deepPurple,
              message: 'himanshusharma89',
            ),
            ChangeTextColorOnHover(
              text: 'TWITTER', 
              color: Colors.blueAccent,
              message: '_SharmaHimanshu',
            ),
            ChangeTextColorOnHover(
              text: 'STACKOVERFLOW', 
              color: Colors.deepOrange,
              message: 'himanshusharma89',
            ),
            ChangeTextColorOnHover(
              text: 'CODEPEN', 
              color: Colors.blue,
              message: 'himanshusharma89',
            )
          ]
        )
      )
    );
  }
}

class VerticalLine extends StatefulWidget {
  final Color color;
  VerticalLine({this.color});
  @override
  _VerticalLineState createState() => _VerticalLineState();
}

class _VerticalLineState extends State<VerticalLine> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height:height,
      width: 1,
      color: widget.color.withOpacity(0.5),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveLayout(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 780;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 780 &&
        MediaQuery.of(context).size.width < 960;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return largeScreen;
        } else if (constraints.maxWidth < 960 && constraints.maxWidth > 780) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

class ChangeTextColorOnHover extends StatefulWidget {
  final String text;
  final Color color;
  final String message;
  
  ChangeTextColorOnHover({Key key, this.text, this.color, this.message}) : super(key: key);

  @override
  _ChangeTextColorOnHoverState createState() => _ChangeTextColorOnHoverState();
}

class _ChangeTextColorOnHoverState extends State<ChangeTextColorOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(1.5, 0, 0);

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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Tooltip(
          message: widget.message,
          verticalOffset: 35,
          padding: const EdgeInsets.only(left:30,right: 30),
          decoration: BoxDecoration(
            color: Color(0xff272727),
            borderRadius: BorderRadius.circular(15)
          ),
          child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            widget.text,
            style: TextStyle(
              color: _hovering ? widget.color : Colors.white,
              fontSize: 11
            )
          ),
      ),
        ),
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}