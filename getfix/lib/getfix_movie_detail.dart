import 'package:flutter/material.dart';

class GetfixMovieDetail extends StatefulWidget {
  @override
  _GetfixMovieDetailState createState() => _GetfixMovieDetailState();
}

class _GetfixMovieDetailState extends State<GetfixMovieDetail> {

  double _containerMargin = 3.0;

  _popularMovies() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.red,
            child: Image.asset('images/thewitcher.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.blue,
            child: Image.asset('images/narcos.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.green,
            child: Image.asset('images/strangerthings.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.yellow,
            child: Image.asset('images/houseofcards.jpg'),
          ),
        ],
      ),
    );
  }

  _moviesOnTheRise() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.red,
            child: Image.asset('images/suits.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.blue,
            child: Image.asset('images/startrekdiscovery.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.green,
            child: Image.asset('images/thewitcher.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.yellow,
            child: Image.asset('images/bloodline.jpg'),
          ),
        ],
      ),
    );
  }

  _watchAgain() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.red,
            child: Image.asset('images/suits.jpg'),
          ),
          Container(
            margin: EdgeInsets.all(_containerMargin),
            width: 100,
            height: 250,
            // color: Colors.green,
            child: Image.asset('images/strangerthings.jpg'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Icon(Icons.movie),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicou em séries');
                    },
                    child: Text('Séries', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicou em filmes');
                    },
                    child: Text('Filmes', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicou em minha lista');
                    },
                    child: Text('Minha lista', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Buscar"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter),
                label: "Em breve"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_outlined),
                label: "Downloads"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Mais"
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/bannerstrangerthings.jpg', fit: BoxFit.fitWidth,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    print('clicou no botão minha lista');
                  },
                  label: Text('Minha lista', style: TextStyle(color: Colors.white),),
                  icon: Icon(Icons.add, color: Colors.white,),
                ),
                TextButton.icon(
                  onPressed: () {
                    print('clicou no botão assistir');
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                  label: Text('Assistir', style: TextStyle(color: Colors.black),),
                  icon: Icon(Icons.play_arrow, color: Colors.black,),
                ),
                TextButton.icon(
                  onPressed: () {
                    print('clicou no botão detalhes');
                  },
                  label: Text('Detalhes', style: TextStyle(color: Colors.white),),
                  icon: Icon(Icons.info_outline, color: Colors.white,),
                )
              ],
            ),
            Text('Em alta', style: TextStyle(fontWeight: FontWeight.bold)),
            _popularMovies(),
          ],
        )
    );
  }
}