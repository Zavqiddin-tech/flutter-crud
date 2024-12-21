import 'package:flutter/material.dart';

class ListMavzulari extends StatelessWidget {
  List<int> listningRaqamlari = List.generate(300, (index) => index);

  List<String> listBoshliq =
      List.generate(300, (index) => "List elementi $index");

  ListMavzulari({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listningRaqamlari
            .map((elem) => Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        color: Colors.blue,
                        margin: const EdgeInsets.all(20),
                        elevation: 10,
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 12,
                            child: Icon(Icons.face),
                          ),
                          title: Text('Salom men Cardning $elem - elementiman'),
                          subtitle: Text(listBoshliq[elem]),
                          trailing: const Icon(Icons.add_circle_outline_sharp),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 1,
                    ),
                  ],
                ))
            .toList());
  }
}
