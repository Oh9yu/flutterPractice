import 'package:flutter/material.dart';
import 'package:flutter_practice/Widget/Button.dart';
import 'package:flutter_practice/Widget/cardui.dart';
import 'package:flutter_practice/screens/home_screen.dart';

void main() {
  runApp(Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blue,
            onPrimary: Colors.black54,
            secondary: Colors.green,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            background: Color(0xFFF4EDDB),
            onBackground: Color(0xFF232B55),
            surface: Color.fromRGBO(210, 193, 172, 1),
            onSurface: Colors.black,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(color: Colors.red),
          ),
        ),
        home: HomeScreen());
  }
}

//stateful Widget Practice

class Stateapp extends StatefulWidget {
  const Stateapp({super.key});

  @override
  State<Stateapp> createState() => _StateappState();
}

class _StateappState extends State<Stateapp> {
  bool isShowTitle = true;

  void titleHandler() {
    setState(() {
      isShowTitle = !isShowTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowTitle ? LargeTitle() : Text('empty!!'),
              IconButton(
                  onPressed: titleHandler,
                  icon: Icon(Icons.access_alarm_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}

class LargeTitle extends StatefulWidget {
  const LargeTitle({
    super.key,
  });

  @override
  State<LargeTitle> createState() => _LargeTitleState();
}

class _LargeTitleState extends State<LargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello!');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text('Title',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.titleLarge?.color));
  }
}

//stateless Widget Practice

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'HI OhGyu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Welcome!!',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '971,028 KRW',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                              text: 'Transfer',
                              bgColor: Colors.amber,
                              txColor: Colors.black),
                          Button(
                              text: 'Require',
                              bgColor: const Color.fromARGB(96, 90, 90, 90),
                              txColor: Colors.white)
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Wallets',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardUI(
                        title: 'Euro',
                        bgColor: Color(0xFF1F2123),
                        cost: '6 428',
                        loc: 'EUR',
                        titleColor: Colors.white,
                        locColor: Colors.grey,
                        icon: Icons.euro_rounded,
                        offset: 0,
                      ),
                      CardUI(
                        title: 'Dollar',
                        bgColor: Colors.white,
                        cost: '55 262',
                        loc: 'USD',
                        titleColor: Colors.black,
                        locColor: Colors.black,
                        icon: Icons.attach_money_rounded,
                        offset: 20,
                      ),
                      CardUI(
                        title: 'Bit Coin',
                        bgColor: Color(0xFF1F2123),
                        cost: '320',
                        loc: 'BTC',
                        titleColor: Colors.white,
                        locColor: Colors.grey,
                        icon: Icons.currency_bitcoin_rounded,
                        offset: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
