import 'package:adota_pet/model/model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class HomePage extends StatefulWidget {

  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Dog?>? dogs;
  List<Cat?>? cats;
  List<Bird?>? birds;

  _firstTab() {
    return ListView.builder(
      itemCount : dogs?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.asset(dogs![index]!.image.toString())
                  ],
                )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    color: dogs![index]!.gender == 'macho' ? Colors.blue : Colors.pinkAccent,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 6.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  dogs![index]!.name.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)
                              ),
                              dogs![index]!.gender == 'macho' ? const Icon(Icons.male, color: Colors.white,) : const Icon(Icons.female, color: Colors.white,),
                              const Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Icon(Icons.favorite_border, color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                          child: Row(
                            children: [
                              Text(dogs![index]!.breed.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 4.0),
                          child: Row(
                            children: [
                              Text('${dogs![index]!.age.toString()} ${dogs![index]!.ageDescription.toString()}', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:Row(
                            children: [
                              Text('${dogs![index]!.weight.toString()} Kg', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          onTap: () {
            // print('clique');
          },
        );
      },
    );
  }

  _secondTab() {
    return ListView.builder(
      itemCount : cats?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(cats![index]!.image.toString())
                    ],
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    color: cats![index]!.gender == 'macho' ? Colors.blue : Colors.pinkAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  cats![index]!.name.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)
                              ),
                              cats![index]!.gender == 'macho' ? const Icon(Icons.male, color: Colors.white,) : const Icon(Icons.female, color: Colors.white,),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(Icons.favorite_border, color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                          child: Row(
                            children: [
                              Text(cats![index]!.breed.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 4.0),
                          child: Row(
                            children: [
                              Text('${cats![index]!.age.toString()} ${cats![index]!.ageDescription.toString()}', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:Row(
                            children: [
                              Text('${cats![index]!.weight.toString()} Kg', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          onTap: () {
            // print('clique');
          },
        );
      },
    );
  }

  _thirdTab() {
    return ListView.builder(
      itemCount : birds?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(birds![index]!.image.toString())
                    ],
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    color: birds![index]!.gender == 'macho' ? Colors.blue : Colors.pinkAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  birds![index]!.name.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)
                              ),
                              birds![index]!.gender == 'macho' ? const Icon(Icons.male, color: Colors.white,) : const Icon(Icons.female, color: Colors.white,),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(Icons.favorite_border, color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                          child: Row(
                            children: [
                              birds?[index]?.breed == null ? const Text('') : Text(birds![index]!.breed.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 4.0),
                          child: Row(
                            children: [
                              Text('${birds![index]!.age.toString()} ${birds![index]!.ageDescription.toString()}', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child:Row(
                            children: [
                              Text('${birds![index]!.weight.toString()} Kg', style: const TextStyle(fontSize: 16.0, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          onTap: () {
            // print('clique');
          },
        );
      },
    );
  }

  _body(BuildContext context) {
    return TabBarView(
      children: [
        _firstTab(),
        _secondTab(),
        _thirdTab(),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dogs = <Dog>[];
    dogs?.add(Dog(name: 'Geny', breed: 'Beagle', gender: 'fêmea', age: 6, ageDescription: 'meses', weight: 3, image: Constant.dogGeny));
    dogs?.add(Dog(name: 'Bob', breed: 'Dálmata', gender: 'macho', age: 1, ageDescription: 'anos', weight: 3, image: Constant.dogBob));
    dogs?.add(Dog(name: 'Mimoza', breed: 'Fox Paulista', gender: 'fêmea', age: 8, ageDescription: 'meses', weight: 1, image: Constant.dogMimoza));
    dogs?.add(Dog(name: 'Thor', breed: 'A.Staff. Terrier', gender: 'macho', age: 6, ageDescription: 'meses', weight: 2, image: Constant.dogThor));

    cats = <Cat>[];
    cats?.add(Cat(name: 'Thomy', breed: 'Persa', gender: 'macho', age: 2, ageDescription: 'meses', weight: 2, image: Constant.catThomy));
    cats?.add(Cat(name: 'Mimi', breed: 'Siamês', gender: 'fêmea', age: 8, ageDescription: 'meses', weight: 3, image: Constant.catMimi));
    cats?.add(Cat(name: 'Frido', breed: 'Grumpy', gender: 'fêmea', age: 3, ageDescription: 'meses', weight: 2, image: Constant.catFrida));
    cats?.add(Cat(name: 'Frodo', breed: 'Grumpy', gender: 'macho', age: 3, ageDescription: 'meses', weight: 2, image: Constant.catFrodo));

    birds = <Bird>[];
    birds?.add(Bird(name: 'Magda', gender: 'fêmea', age: 2, ageDescription: 'meses', weight: 0.6, image: Constant.birdMagda));
    birds?.add(Bird(name: 'Bilbo', breed: 'Canário da terra', gender: 'macho', age: 2, ageDescription: 'anos', weight: 0.5, image: Constant.birdBilbo));
    birds?.add(Bird(name: 'Mika', breed: 'Trinca-ferro', gender: 'fêmea', age: 4, ageDescription: 'meses', weight: 0.6, image: Constant.birdMika));
    birds?.add(Bird(name: 'Thymot', breed: 'Canário', gender: 'fêmea', age: 2, ageDescription: 'meses', weight: 0.4, image: Constant.birdThymot));

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Icon(Icons.pets, color: Colors.white,),
                const Text('AdotaPet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,))
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.pets, color: Colors.white,), child: Text('Cachorros', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white,),),),
                Tab(icon: Icon(Icons.pets, color: Colors.white,), child: Text('Gatos', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white,),),),
                Tab(icon: Icon(Icons.pets, color: Colors.white,), child: Text('Pássaros', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white,),),),
              ],
            ),
          ),
          body: _body(context),
        )
    );
  }
}
