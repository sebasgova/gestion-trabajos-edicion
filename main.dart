import 'dart:io';
import 'trabajo.dart';
import 'funciones.dart';

void main() {
  List<Trabajo> trabajos = [];
  bool continuar = true;

  while (continuar) {
    print('\nSISTEMA DE GESTION DE TRABAJOS DE VIDEO');
    print('1. Registrar trabajo');
    print('2. Consultar todos');
    print('3. Buscar trabajo');
    print('4. Modificar trabajo');
    print('5. Eliminar trabajo');
    print('6. Mostrar resumen');
    print('0. Salir');
    stdout.write('Seleccione una opcion: ');
    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        registrar(trabajos);
        break;
      case '2':
        consultar(trabajos);
        break;
      case '3':
        buscar(trabajos);
        break;
      case '4':
        modificar(trabajos);
        break;
      case '5':
        eliminar(trabajos);
        break;
      case '6':
        resumen(trabajos);
        break;
      case '0':
        continuar = false;
        print('Programa finalizado.');
        break;
      default:
        print('Opcion no valida. Intenta otra vez.');
    }
  }
}
