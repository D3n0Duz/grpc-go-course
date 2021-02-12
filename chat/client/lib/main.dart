import 'package:flutter/material.dart';
// import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';
import 'package:client/src/generated/chat/proto/chat.pbgrpc.dart';  // Import the protofbuff files

void main() {
  var client = Client();
  client.main([]);
  runApp(MyApp());
}

class Client {
  ChatServiceClient stub;

  Future<void> main(List<String> args) async {
    // final channel = ClientChannel(
    //   "0.0.0.0",
    //   port: 50051,
    //   options: const ChannelOptions(credentials: ChannelCredentials.insecure())
    // );

    final channel = GrpcWebClientChannel.xhr(Uri.parse('http://127.0.0.1:50051'));

    stub = ChatServiceClient(
      channel,
      options: CallOptions(
        timeout: Duration(seconds: 15)
      )
    );


    try {
      await runChat();
      // final response = await stub.chat(request).timeout(Duration(milliseconds: 10)), 

    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  Future<void> runChat() async {

    ChatRequest createChat(String message) {
      return ChatRequest()
        ..chat = (Chat()..message = message);
    }
    

    final messages = <ChatRequest>[
        
        createChat("Bonjour"),
        createChat("Selam"),
        createChat("Hola"),
        createChat("Allo")
      ];
    

    Stream<ChatRequest> outgoingMessages() async* {
      for (final message in messages) {
        await Future.delayed(Duration(milliseconds: 10));
        print("Sending message ${message.chat.message}");
        yield message;
      } 
    }
  

    final responses = stub.chat(outgoingMessages());
    await for (final message in responses) {
      print("Received message ${message.chat.message}");
    }

  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chat with gRPC bidirectionnal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

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
      body: Container(
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Container(
            //   alignment: Alignment.topRight,
            //   child: Container(
            //     constraints: BoxConstraints(
            //       maxWidth: MediaQuery.of(context).size.width * 0.80,
            //     ),
            //     padding: EdgeInsets.all(10),
            //     margin: EdgeInsets.symmetric(vertical:10),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).primaryColor,
            //       borderRadius: BorderRadius.circular(15),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.5),
            //           spreadRadius: 2,
            //           blurRadius: 5,
            //         ),
            //       ],
            //     ),
            //     child: Text(
            //       "alloooo",
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(children: 
              <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.80,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                      
                    ),
                  ),
                ),
                // Text(
                //         "Bob",
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 10,
                //         ),
                //       ),
              ],
              ),
            ),
              
              
            // Container(
            //   alignment: Alignment.bottomCenter,
            //   width: MediaQuery.of(context).size.width * 0.30,
              
            //   child: TextFormField(
            //     decoration: const InputDecoration(
            //       hintText: "Enter your name",
            //     ),
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return "Please enter some text";
            //       }
            //       return null;
            //     },
            //   ),
            
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.30,
              
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your message"
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.30,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
              
              child: OutlinedButton(
                onPressed: () {
                  print('Received click');
                },
                child: Text('Send'),
              ),
            ),
          ],
        ),
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
