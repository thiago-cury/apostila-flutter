import 'package:barbearia/repository/schedule_repository.dart';
import 'package:barbearia/views/view_schedule_time.dart';
import 'package:flutter/material.dart';
import '../model/schedule.dart';

class Home extends StatefulWidget {

  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late ScheduleRepository _repository;

  _title(Schedule schedule) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Código ${schedule.id} - ${schedule.name}\nTelefone ${schedule.phone}"),
            )
          ],
        )
      ],
    );
  }

  _subtitle(Schedule schedule) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Icon(Icons.calendar_today),
          Text('${schedule.date}'),
          Icon(Icons.schedule),
          Text('${schedule.hour}'),
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    this._repository = ScheduleRepository();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: FutureBuilder(
        future: this._repository.fetchAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {

          if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if(snapshot.data!.isEmpty) {
                  return Center(child: Text("Não há dados no banco"),);
                }
                List<Schedule>? schedules = snapshot.data;
                print("lista das agendas cadastradas: ${schedules.toString()}");

                return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: schedules!.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.delete_forever),
                        ),
                        key: ValueKey<int>(snapshot.data![index].id!),
                        onDismissed: (DismissDirection direction) async {
                          print("Id que vai ser excluido: ${snapshot.data![index].id!}");
                          await this._repository.delete(snapshot.data![index].id!);
                          setState(() {
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        child: Card(
                          child: ListTile(
                            title: _title(schedules.elementAt(index)),
                            subtitle: _subtitle(schedules.elementAt(index)),
                            leading: CircleAvatar(
                                child: Icon(Icons.person),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                //Podemos excluir por aqui também... ao clicar no ícone da lixeira....
                                //ou arrastando para a esquerda, através do componente Dismissible
                                print("Clicou para excluir");
                              },
                              child: Icon(Icons.delete),
                            ),
                            onTap: () async {
                              print("Você escolheu ${schedules.elementAt(index).name}");
                              
                              _showAlert('Você deseja ver detalhes e/ou alterar?',
                                  option1: 'Ver detalhes',
                                  option2: 'Alterar',
                                  option1Function: () {
                                    print('clicou em ver detalhes');
                                    Navigator.of(context).pop();
                                  },
                                  option2Function: () async {
                                    print('clicou em Alterar');
                                    Navigator.of(context).pop();
                                    final reloadPage = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (BuildContext context) => ViewScheduleTime(schedule: schedules.elementAt(index),))
                                    );
                                    _reload(reloadPage);
                                  }
                              );
                            },
                          )
                        ),
                      );
                    }
                );
              } else {
                return Center(child: Text("Sem dados no banco!"));
              }
          } else if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('clicou para adicionar agendamento');
          final reloadPage = await Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => ViewScheduleTime())
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

  _showAlert(String message, {String? title, String? option1, String? option2, String? cancel, Function? option1Function, Function? option2Function}) { //opcional nomeado...
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'Atenção'),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {
          option1Function!();
        }, child: Text(option1 ?? 'sim')),
        TextButton(onPressed: () {
          option2Function!();
        }, child: Text(option2 ?? 'nao')),
        cancel != null ?
        TextButton(onPressed: () {
          print('clicou no cancel');
          Navigator.of(context).pop();
        }, child: Text('Cancelar')) :
        Container(),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }

}
