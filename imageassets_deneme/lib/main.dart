import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Çalışma Örneği'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resim = "köfte.jpg";
  @override
  Widget build(BuildContext context) {
    // Ekran yükseklik ve genişliğini aldık
    final double ekranGenisligi = MediaQuery.of(context).size.width;
    final double ekranYuksekligi = MediaQuery.of(context).size.height;
    return Scaffold(

      //AppBar Kısmı

      appBar: AppBar(
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: ekranYuksekligi/10,
        toolbarOpacity: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.redAccent,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Gösterilecek olan ilk resim
            Image.asset("images/$resim", width: ekranGenisligi/2, height: ekranYuksekligi/2,),

            //Buton
            SizedBox(height: ekranYuksekligi/50,),
            SizedBox(
              width: ekranGenisligi/3,
              child: ElevatedButton(
                child: Text("Kebap"),
                //Tıklanıldığı Anda Buton Rengi
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.black;
                      return null;
                    },
                  ),
                  //Butonun kenarları
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed: (){
                  setState(() {
                    resim = "kebap_resmi.jpg";
                  });
                },
              ),
            ),


            SizedBox(
              width: ekranGenisligi/3,
              child: ElevatedButton(
                child: Text("Köfte"),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states){
                        if(states.contains(MaterialState.pressed))
                          return Colors.black;
                        return null;
                      }
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                ),
                onPressed: (){
                  setState(() {
                    resim = "köfte.jpg";
                  });
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
