import 'package:flutter/material.dart';
import '../classes/calculate_imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double? peso;
  double? altura;
  var imcCalculator = CalculateImc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcule o seu IMC!"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Insira o seu peso'
                ),
                onChanged: (value) {
                  peso = double.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || double.parse(value) <= 0) {
                    return 'Valor inválido!';
                  }
                }),
                TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Insira a sua altura'
                ),
                onChanged: (value) {
                  altura = double.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || double.parse(value) <= 0) {
                    return 'Valor inválido!';
                  }
                }),
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
                        imcCalculator;
                        setState(() {
                          'Seu IMC é ${imcCalculator.calculateImc(peso!, altura!)}';
                        });
                      }, 
                      child: const Text(
                        'Calcular',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
