import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

List<Widget> accounts = [
  ChangeAccountOnHover(
    imgUrl: 'https://occ-0-4079-3647.1.nflxso.net/dnm/api/v6/Z-WHgqd_TeJxSuha8aZ5WpyLcX8/AAAABSLII-o6GmYPFo09Nlv7D5jVLJGKsBJnZFzFAj82yk-WfGl7mV_vbCPIK5h65iTgGTs1dobHjU5Nlwc0EwKaty5KYhoV.png?r=a41',
    uName: 'Name',
  ),
  ChangeAccountOnHover(
    imgUrl: 'https://occ-0-4079-3647.1.nflxso.net/dnm/api/v6/Z-WHgqd_TeJxSuha8aZ5WpyLcX8/AAAABeeUXj7Qv1mlz_6ihaRvwKNIj8ZUb16ZLq2CFm5d4P_6ekllUPz6u9wefDv9HMrk-xdyIigwh1XZjzFfAe7fGXxmWrMP.png?r=fdd',
    uName: 'Name',
  ),
  ChangeAccountOnHover(
    imgUrl: 'https://occ-0-4079-3647.1.nflxso.net/dnm/api/v6/Z-WHgqd_TeJxSuha8aZ5WpyLcX8/AAAABYCq-HPaBmwWzyEo8UjC3jQ7a2mKJhU4uPbQwFrauKbu9_-6GpfPccnQh3UWZvsGLQ1MwLo_4YZ-kuTiAsqpq0oEdPXS.png?r=f71',
    uName: 'Name',
  ),
  ChangeAccountOnHover(
    imgUrl: 'https://occ-0-4079-3647.1.nflxso.net/dnm/api/v6/Z-WHgqd_TeJxSuha8aZ5WpyLcX8/AAAABfKQX3GD92_it5CxSGbQbLUaes21NHll7a9jASfp89GAzF3wSUKb5WVgTNeTztGYJBsNZXsRaIJJkIaoAhqGW8oNpWzi.png?r=c71',
    uName: 'Name',
  ),
  ChangeAccountOnHover(
    imgUrl: 'https://occ-0-4079-3647.1.nflxso.net/dnm/api/v6/Z-WHgqd_TeJxSuha8aZ5WpyLcX8/AAAABQXdLDELkrKSRyV4VvPw4sbIdGxHypUCSD8wqdtbnJFPWQyUT6cQFCUlqC5xYbCCBq7xG_3Wy5We8bltPcP69_KC4ykF.png?r=5cf',
    uName: 'Kids',
  )
];

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
    if(ResponsiveLayout.isLargeScreen(context)){
      return DesktopWidget();
    } else if(ResponsiveLayout.isMediumScreen(context)){
      return MediumWidget();
    } else {
      return MobileWidget(); 
    } 
  }
}

class DesktopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: Center(
        child: Container(
          height: height, width: width*0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height*0.1,),
              Container(
                width: width*0.28,
                child: FittedBox(
                  // fit: BoxFit.fitWidth,
                  child: Text(
                    'Who\'s watching?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: height*0.02,
                  crossAxisSpacing: width*0.02,
                  childAspectRatio: 130/180,
                ), 
                itemCount: accounts.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => FittedBox(child: accounts[index]),
              ),
              SizedBox(height: height*0.07,),
              Container(
                width: width*0.18,
                child: FittedBox(child: ManageProfile())
              )
            ],
          ),
        ),
      )
    );
  }
}

class MediumWidget extends StatefulWidget {
  @override
  _MediumWidgetState createState() => _MediumWidgetState();
}

class _MediumWidgetState extends State<MediumWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,width:width,
        color: const Color(0xff141414),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*0.1,),
            Container(
              width: width*0.5,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Who\'s watching?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                ),
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width*0.6,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: height*0.01,
                  crossAxisSpacing: width*0.01,
                  childAspectRatio: 0.8/1,
                ), 
                itemCount: accounts.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => FittedBox(child: accounts[index]),
              ),
            ),
            SizedBox(height: height*0.06,),
            Container(
              width: width*0.34,
              child: FittedBox(child: ManageProfile())
            )
          ],
        ),
      )
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height*0.1,),
              Container(
                width: width*0.72,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Who\'s watching?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                      ),
                  ),
                ),
              ),
              SizedBox(height: height*0.008,),
              Container(
                width: width*0.6,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: height*0.02,
                    crossAxisSpacing: width*0.005,
                    childAspectRatio: 50/60,
                  ), 
                  itemCount: accounts.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FittedBox(child: accounts[index]),
                ),
              ),
              SizedBox(height: height*0.05,),
              Container(
                width: width*0.5,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: ManageProfile()),
              ),
              SizedBox(height: height*0.05,),
            ],
          ),
        ),
      )
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
    return MediaQuery.of(context).size.width < 400;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 400 &&
        MediaQuery.of(context).size.width < 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return largeScreen;
        } else if (constraints.maxWidth <= 600 && constraints.maxWidth > 400) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

class ChangeAccountOnHover extends StatefulWidget {
  final String imgUrl;
  final String uName;
  
  ChangeAccountOnHover({Key key, this.imgUrl, this.uName,}) : super(key: key);

  @override
  _ChangeAccountOnHoverState createState() => _ChangeAccountOnHoverState();
}

class _ChangeAccountOnHoverState extends State<ChangeAccountOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -0.5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        _mouseEnter(true);
      },
      onExit: (e) {
        _mouseEnter(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: ResponsiveLayout.isSmallScreen(context) || ResponsiveLayout.isMediumScreen(context) ? 50 : 130,
              height:  ResponsiveLayout.isSmallScreen(context) || ResponsiveLayout.isMediumScreen(context) ? 50 : 130,
              decoration: BoxDecoration(
                color: Colors.pink,
                border: Border.all(
                  color: _hovering ? Colors.white : Colors.transparent,
                  width: _hovering ? (ResponsiveLayout.isSmallScreen(context) || ResponsiveLayout.isMediumScreen(context) ? 1 : 3) : 0
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.imgUrl)
                )
              ),
            ),
            SizedBox(height: ResponsiveLayout.isSmallScreen(context) || ResponsiveLayout.isMediumScreen(context) ? height*0.005 :height*0.01,),
            Text(
              widget.uName,
              style: TextStyle(
                color: _hovering ? Colors.white : Color(0xff474747),
                fontSize: ResponsiveLayout.isSmallScreen(context) || ResponsiveLayout.isMediumScreen(context) ? 10 :  20,
              ),
            )
          ],
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

class ManageProfile extends StatefulWidget {
  // final String text;
  // final Color color;
  // final String message;
  
  // ManageProfile({Key key, this.text, this.color, this.message}) : super(key: key);

  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _hovering ? Colors.white : Color(0xff474747),
              width: 1.5
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
            child: Text(
              'MANAGE PROFILES',
              style: TextStyle(
                color: _hovering ? Colors.white : Color(0xff474747),
                fontSize: 20,
                letterSpacing: 2
              ),
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