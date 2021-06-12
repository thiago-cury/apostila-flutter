import 'package:flutter/material.dart';
import 'package:getfix/getfix_movie_detail.dart';

class GetfixHome extends StatefulWidget {

  const GetfixHome({Key? key}) : super(key: key);

  @override
  State<GetfixHome> createState() => _GetfixHomeState();
}

class _GetfixHomeState extends State<GetfixHome> {

  double _containerMargin = 3.0;
  int _index = 0;

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => GetfixMovieDetail()
                          )
                      );
                    },
                    child: Text('Séries', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    print('Clicou em filmes');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GetfixMovieDetail()
                        )
                    );
                  },
                  child: Text('Filmes', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    print('Clicou em minha lista');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GetfixMovieDetail()
                        )
                    );
                  },
                  child: Text('Minha lista', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            this._index = index;
            print("indice atual: ${index}");
          }
          );
          // _navigateToScreens(index);
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: Colors.white,),
              icon: Icon(Icons.home, color: Colors.grey[500],),
              label: "Home"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.search, color: Colors.white,),
              icon: Icon(Icons.search, color: Colors.grey[500],),
              label: "Buscar"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.movie_filter, color: Colors.white,),
              icon: Icon(Icons.movie_filter, color: Colors.grey[500],),
              label: "Em breve"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.download_outlined, color: Colors.white,),
              icon: Icon(Icons.download_outlined, color: Colors.grey[500],),
              label: "Downloads"
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.list, color: Colors.white,),
              icon: Icon(Icons.list, color: Colors.grey[500],),
              label: "Mais"
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Populares na Getfix', style: TextStyle(fontWeight: FontWeight.bold)),
          _popularMovies(),
          Text('Em alta', style: TextStyle(fontWeight: FontWeight.bold)),
          _moviesOnTheRise(),
          Text('Assista de novo', style: TextStyle(fontWeight: FontWeight.bold)),
          _watchAgain()
        ],
      )
    );
  }
}