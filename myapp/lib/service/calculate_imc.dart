import 'imc.dart';

class CalculateIMCService {
  List<IMC> ImcList = [];

  double calculateImc(double peso, double altura) {
    double calculateImc = peso / altura * altura;
    return calculateImc;
  }

  IMC setImc(double peso, double altura) {
    var imcCalculator = calculateImc(peso, altura);

    var imc = IMC(peso: peso, altura: altura, imc: imcCalculator);

    return imc;
  }

  void setImcList(IMC imc) {
    ImcList.add(imc);
  }

  List<IMC> getImcList() {
    return ImcList;
  }
}
