import 'package:agenda_de_contatos/contact.dart';
import 'package:agenda_de_contatos/contact_add.dart';
import 'package:agenda_de_contatos/contact_detail.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {

  final String title;

  static List<Contact> contacts = [
    Contact('Nicole', 'nicole@gmail.com', '(51)11111-1111', 'images/nicole.jpg', false),
    Contact('Camila', 'camila@gmail.com', '(51)11111-2222', 'images/camila.jpg', false),
    Contact('Paulo', 'paulo@gmail.com', '(51)11111-3333', 'images/paulo.jpg', false),
    Contact('Lucas', 'lucas@gmail.com', '(51)11111-4444', 'images/lucas.jpg', false),
    Contact('Juliana', 'juliana@gmail.com', '(51)11111-5555', 'images/juliana.jpg', false),
  ];

  const ContactList({Key? key, required this.title}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  _title(int index) {
    return Row(
      children: [
        ContactList.contacts.elementAt(index).picture!.isEmpty
        ?
        CircleAvatar(
            backgroundColor: Colors.blue
        )
        :
        CircleAvatar(
          backgroundImage: AssetImage('images/${ContactList.contacts.elementAt(index).name!.toLowerCase()}.jpg'),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(ContactList.contacts.elementAt(index).name.toString()),
            )
          ],
        )
      ],
    );
  }

  _subtitle(int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Text(ContactList.contacts.elementAt(index).phone.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: ContactList.contacts.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    title: _title(index),
                    subtitle: _subtitle(index),
                    leading: Icon(ContactList.contacts.elementAt(index).favorite! ? Icons.star : Icons.star_border, color: Colors.blue,),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () async {
                      print("Você escolheu ${ContactList.contacts.elementAt(index).name}");
                      final reloadPage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ContactDetail(contact: ContactList.contacts.elementAt(index), position: index)
                          )
                      ).then((_) {
                        setState(() {
                          print("vai atualizar a tela no retorno do detalhe");
                        });
                      });
                    },
                )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('clicou para adicionar contato');
          final reloadPage = await Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => ContactAdd())
          );
          _reload(reloadPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _reload(bool reloadPage) {
    if(reloadPage)
      setState(() {
        print("vai atualizar a tela no retorno do cadastro");
      });
  }
}
