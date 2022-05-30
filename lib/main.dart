import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:the_eternal_tournament/views/authentication/login_page.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(1728, 1117),
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          // useShortestSide: true,
          defaultScaleFactor: 1,

          maxWidth: 2560,
          minWidth: 320,
          // // defaultScale: true,
          defaultScale: true,

          // defaultScaleFactor: 1.3,
          // mediaQueryData:const MediaQueryData(),
          // useShortestSide: true,

          breakpoints: const [
            ResponsiveBreakpoint.resize(300, name: MOBILE, scaleFactor: 0.95),
            ResponsiveBreakpoint.resize(320, name: MOBILE, scaleFactor: 0.95),
            ResponsiveBreakpoint.resize(350, name: MOBILE, scaleFactor: 0.95),
            ResponsiveBreakpoint.resize(375, name: MOBILE, scaleFactor: 0.95),
            ResponsiveBreakpoint.resize(400, name: MOBILE, scaleFactor: 0.95),
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(500, name: MOBILE, scaleFactor: 1),
            ResponsiveBreakpoint.resize(510, name: TABLET),
            ResponsiveBreakpoint.resize(520, name: TABLET),
            ResponsiveBreakpoint.resize(530, name: TABLET),
            ResponsiveBreakpoint.resize(540, name: TABLET),
            ResponsiveBreakpoint.resize(550, name: TABLET),
            ResponsiveBreakpoint.resize(554, name: TABLET),
            ResponsiveBreakpoint.resize(560, name: TABLET),
            ResponsiveBreakpoint.resize(566, name: TABLET),
            ResponsiveBreakpoint.resize(570, name: TABLET),
            ResponsiveBreakpoint.resize(585, name: TABLET),
            ResponsiveBreakpoint.resize(595, name: TABLET),
            ResponsiveBreakpoint.resize(600),
            ResponsiveBreakpoint.resize(610),
            ResponsiveBreakpoint.resize(612),
            ResponsiveBreakpoint.resize(615),
            ResponsiveBreakpoint.resize(620),
            ResponsiveBreakpoint.resize(650),
            ResponsiveBreakpoint.resize(690),
            ResponsiveBreakpoint.resize(700),
            ResponsiveBreakpoint.resize(710),
            ResponsiveBreakpoint.resize(720),
            ResponsiveBreakpoint.resize(750),
            ResponsiveBreakpoint.resize(790),
            ResponsiveBreakpoint.resize(795),
            ResponsiveBreakpoint.resize(799),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(820, name: TABLET),
            ResponsiveBreakpoint.autoScale(829, name: TABLET),
            ResponsiveBreakpoint.autoScale(850, name: TABLET),
            ResponsiveBreakpoint.autoScale(890, name: TABLET),
            ResponsiveBreakpoint.autoScale(900, name: TABLET),
            ResponsiveBreakpoint.autoScale(920, name: TABLET),
            ResponsiveBreakpoint.resize(950, name: TABLET),
            ResponsiveBreakpoint.resize(990, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1290, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1291, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1292, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1293, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1294, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1295, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1300, name: DESKTOP, scaleFactor: 1),
            ResponsiveBreakpoint.resize(1400, name: DESKTOP, scaleFactor: 1.01),
            ResponsiveBreakpoint.resize(1500, name: DESKTOP, scaleFactor: 1.01),
            ResponsiveBreakpoint.resize(1600, name: DESKTOP, scaleFactor: 1.01),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL', scaleFactor: 1.01),
            ResponsiveBreakpoint.autoScale(2460, name: '4K', scaleFactor: 1.1),
            ResponsiveBreakpoint.autoScale(2560, name: '4K', scaleFactor: 1.2),
          ],
        ),
        home: child,
      ),
      child: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
