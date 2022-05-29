
import 'package:primerio_projeto_dart/Cupom.dart';
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





bool validaCupom(String hash){
  bool? cupomValido;
  int contaTamanhoData =0;
  String? data;
  try{
    for(int i =0;i<=hash.length; i++){
      if(contaTamanhoData < 10){
        if(i%2 ==0){
          if(data == null){
            data = hash[i];
            contaTamanhoData = 1;
          }else if(data != null){
            data += hash[i];
            contaTamanhoData+=1;
          }
        }
      }
    }
    int ano = int.parse(data![0] + data[1] + data[2] + data[3]);
    int mes = int.parse(data![5] + data[6]);
    int dia = int.parse(data![8] + data[9]);

   DateTime dataPataAnoValidoCompleta = DateTime.now();
   String anoIntermediario = dataPataAnoValidoCompleta.toString();

   int anoValido = int.parse(anoIntermediario[0] + anoIntermediario[1] + anoIntermediario[2] + anoIntermediario[3]);

   if(ano < anoValido){
     cupomValido = false;
   }else if(mes < 0 || mes > 12){
     cupomValido = false;
   }else if(dia < 0 || dia > 31){
     cupomValido = false;
   }else{
     cupomValido = true;
   }

  }catch(e){
    return false;
  }
  return cupomValido!;
}
