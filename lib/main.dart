
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:demo/album.dart';
import 'package:demo/api.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';



void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiManager().fetchAlbum();
  }
 

  @override
  Widget build(BuildContext context)  {
        // futureAlbum =  fetchAlbum();
    return Scaffold(
      bottomNavigationBar: buildBottomNavyBar(),
      body: buildBody(),
    );
  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.chat),
          title: const Text('Chat'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.mail),
          title: const Text(
            'Message',
          ),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: CircleAvatar(
            radius: 12,
            child: Image.network(
                'https://www.woolha.com/media/2020/03/eevee.png'),
          ),
          title: const Text('Profile'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  buildBody() {
    return SafeArea(
      child: Container(

        color: Colors.pink[100],
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3JTIwemVhbGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                        height: 170,
                        width: 170,
                      ),
                    ),
                    const Text('Uddesh Rajoria',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text(
                      'Gwalior, India',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Relegion: '),
                          TextSpan(
                              text: 'Hindu',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                        ],
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 5),
                        child: Text(
                          'My Visitors',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      color: Colors.pink,
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    print(snapshot.data.toString());
                    if (snapshot.hasData) {
                      var data  = snapshot.data?.data;
                     return SizedBox(
                        height: 350,
                        width: 170,
                        child: LoopPageView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (_, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3JTIwemVhbGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      height: 170,
                                      width: 170,
                                    ),
                                  ),
                                   Text("${data?[index].name}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  const Text(
                                    'Gwalior, India',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  RichText(
                                    text:  TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Relegion: '),
                                        TextSpan(
                                            text: '${data?[index].status}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pink)),
                                      ],
                                    ),
                                  ),
                                  const Card(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 5),
                                      child: Text(
                                        'My Visitors',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    color: Colors.pink,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  )
                                ],
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.headphones_battery_outlined,
                  size: 180,
                ),
                SizedBox(
                  height: 120,
                ),
              ],

            )),
          ],
        ),
      ),
    );
  }
}
