import 'package:agenda_de_contatos/contact_add.dart';
import 'package:agenda_de_contatos/contact_list.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

class ContactDetail extends StatefulWidget {

  final Contact contact;
  final int position;

  const ContactDetail({Key? key, required this.contact, required this.position}) : super(key: key);

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe ${widget.contact.name}"),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                print('clicou no favoritar');
                if(ContactList.contacts.elementAt(widget.position).favorite!) {
                  ContactList.contacts.elementAt(widget.position).favorite = false;
                } else {
                  ContactList.contacts.elementAt(widget.position).favorite = true;
                }
              });
            },
            child: Icon(ContactList.contacts.elementAt(widget.position).favorite! ? Icons. star : Icons.star_border),
          )
        ],
      ),
      body: Column(
        children: [
          widget.contact.picture!.isEmpty
          ?
          Image.network("https://cdn.pixabay.com/photo/2015/05/28/14/53/ux-788002__480.jpg", fit: BoxFit.fitWidth,)
          :
          Image.asset("${widget.contact.picture}", fit: BoxFit.fitWidth,),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('${widget.contact.name}', style: TextStyle(color: Colors.grey[700], fontSize: 30.0,),textAlign: TextAlign.left,),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Divider(height: 10.0,color: Colors.grey[500],),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(Icons.call, color: Colors.blue,),
                  Text('Ligar')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.sms, color: Colors.blue,),
                  Text('Mensagem SMS')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.video_call_sharp, color: Colors.blue,),
                  Text('Vídeo')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.email_outlined, color: Colors.blue,),
                  Text('Enviar email')
                ],
              )
            ],
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.call, color: Colors.blue,),
              Column(
                children: [
                  Text('${widget.contact.phone}'),
                  Text('Celular')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.video_call_sharp, color: Colors.blue,),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.sms, color: Colors.blue,),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email_outlined, color: Colors.blue,),
              Text('${widget.contact.email}'),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicou no editar');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ContactAdd(contact: widget.contact, index: widget.position,)
              )
          ).then((_) {
            setState(() {
              print("vai atualizar a tela no retorno da edição");
            });
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
