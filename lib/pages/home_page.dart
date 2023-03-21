import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text('NAMA : ${state['name']}');
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text('UMUR : ${state['age']} Tahun');
          //   },
          // ),
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state['name'],
              builder: (context, state) {
                return Text('NAMA : $state');
              }),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state['age'],
              builder: (context, state) {
                return Text('UMUR : $state Tahun');
              }),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => userBloc.changeName(value),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    // if (userBloc.state['age'] == 0) {
                    // } else {
                    userBloc.changeAge(userBloc.state['age'] - 1);
                    // }
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    userBloc.changeAge(userBloc.state['age'] + 1);
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
