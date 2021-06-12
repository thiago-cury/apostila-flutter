import 'package:agenda_de_contatos/contact.dart';
import 'package:agenda_de_contatos/contact_list.dart';
import 'package:flutter/material.dart';

class ContactAdd extends StatefulWidget {

  Contact? contact;
  int? index;

  ContactAdd({this.contact, this.index});

  @override
  _ContactAddState createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  _rowIcon() {
    return Icon(Icons.people, size: 150, color: Colors.blue,);
  }

  _rowName() {
    return new TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(hintText: "Digite o seu nome"),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um nome válido!';
        }
        return null;
      },
    );
  }

  _rowEmail() {
    return new TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(hintText: "Digite o seu email"),
      maxLength: 30,
      validator: (value) {
        if(value!.length < 5) {
          return 'Digite um email válido!';
        }
        return null;
      },
    );
  }

  _rowPhone() {
    return new TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite o seu telefone",
      ),
      maxLength: 14,
      validator: (value) {
        if(value!.length < 8) {
          return 'Digite um telefone válido!';
        }
        return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
      },
      label: Text(widget.contact != null ? 'Alterar' : 'Cadastrar'),
      icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowEmail(),
        _rowPhone(),
        _rowButton(context),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.contact != null) {
      _nameController.text = widget.contact!.name.toString();
      _emailController.text = widget.contact!.email.toString();
      _phoneController.text = widget.contact!.phone.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de contato'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: _formUI(context),
          )
        ],
      ),
    );
  }

  _register(BuildContext context) {
    print('Validou o formulário: ${_formKey.currentState!.validate()}');

    if(_formKey.currentState!.validate()) {
      final contact = Contact(
        _nameController.text,
        _emailController.text,
        _phoneController.text,
        '',
        false
      );

      late String message;
      if(widget.contact != null) {
        ContactList.contacts.elementAt(widget.index!).name = _nameController.text;
        ContactList.contacts.elementAt(widget.index!).email = _emailController.text;
        ContactList.contacts.elementAt(widget.index!).phone = _phoneController.text;
        message = "Usuário alterado com sucesso :-)";
      } else {
        ContactList.contacts.add(contact);
        message = "Usuário adicionado com sucesso :-)";
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message),)
      );

      //para atualizar na tela...
      setState(() {
        Navigator.pop(context, true);
      });

    } else {
      print('Digite os campos corretamente :-/');

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Digite os campos corretamente :-/', ),)
      );
    }
  }

  //Método com arrow function
  _resetFields() => _formKey.currentState!.reset();
}
