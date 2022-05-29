
import 'package:primerio_projeto_dart/Vendedor.dart';

String geradorCupom(Vendedor vendedor, int valor, int untimoCupomId, DateTime validade){

  String? guardaData;
  String dataParaString = validade.toString();
  String ultimoCupom = untimoCupomId.toString();
  String valorCupom = valor.toString();
  String? hash;

  guardaData = formataData(dataParaString);
  
  String juncaoParaGerarHash = vendedor.razaoSocial! + ultimoCupom + guardaData! + valorCupom;

  int cont_razao =0;
  int cont_data =0;

  for(int i=0; i<=juncaoParaGerarHash.length; i++){
    int numeroRazao = vendedor.razaoSocial!.length;
    int numeroCupom = ultimoCupom.length;
    int numerodata = guardaData.length;
    int numeroValor = valorCupom.length;

    if(cont_razao < numeroRazao && cont_data < numerodata){
      if(i%2 != 0){
        if(hash != null){
        hash = (hash! + vendedor.razaoSocial![(numeroRazao -1) - cont_razao])!;
        cont_razao+=1;
        }else{
          hash = vendedor.razaoSocial![(numeroRazao -1) - cont_razao];
          cont_razao+=1;
        }
    } else if(i%2 == 0){
      if(hash !=null){
      hash = (hash! + guardaData![(numerodata -1) - cont_data])!;
      cont_data +=1;
      }else{
        hash = guardaData![(numerodata -1) - cont_data];
        cont_data +=1;
      }
    }
    }
  }

  return hash!;

}


String formataData(String dataParaString){
  var guardaData;
  for(int i=0;i<=9; i++){
    if(i==0){
      guardaData = dataParaString[i];
    }else{
      guardaData = (guardaData! + dataParaString[i])!;
    }
  }
  return guardaData;
}