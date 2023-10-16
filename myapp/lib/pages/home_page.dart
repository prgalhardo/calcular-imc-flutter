import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcule o seu IMC!"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Insira o seu peso (0.0)'
                ),
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Insira a sua altura (0.0)'
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black12)
                      ),
                      onPressed: () {
                        imcCalculator();
                      }, 
                      child: const Text(
                        'Calcular',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                  Text(resultado),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void imcCalculator() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    if (peso > 0 && altura > 0) {
      double imc = peso / (altura * altura);
      setState(() {
        resultado = 'Seu IMC é ${imc.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        resultado = 'Insira valores válidos';
      });
    }
  }
}
