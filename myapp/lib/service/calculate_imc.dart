import 'dart:math';
import 'imc.dart';

class CalculateIMCService {
  List<IMC> ImcList = [];

  double calculateImc(double peso, double altura) {
    double calculateImc = peso / pow(altura, 2);
    return calculateImc;
  }

  IMC setImc(String nome, double peso, double altura) {
    var calculateImc = calculateImc(peso, altura);

    var imc = IMC(nome: nome, peso: peso, altura: altura, imc: calculateImc);

    return imc;
  }

  void setImcList(IMC imc) {
    ImcList.add(imc);
  }

  List<IMC> getImcList() {
    return ImcList;
  }
}
