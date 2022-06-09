import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'controller/project_register_controller.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({Key? key, required this.controller})
      : super(key: key);

  final ProjectRegisterController controller;

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Erro ao cadastrar projeto').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEC,
                    validator: Validatorless.required('Campo Obrigatório'),
                    decoration:
                        const InputDecoration(label: Text("Nome do projeto")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _estimateEC,
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                      Validatorless.number('Apenas números')
                    ]),
                    decoration: const InputDecoration(
                        label: Text("Estimativa de horas")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final name = _nameEC.text;
                          final estimate = int.parse(_estimateEC.text);

                          await widget.controller.register(name, estimate);
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
