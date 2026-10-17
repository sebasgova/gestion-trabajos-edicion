import 'dart:io';
import 'trabajo.dart';

void registrar(List<Trabajo> trabajos) {
  stdout.write('Nombre del cliente: ');
  String cliente = stdin.readLineSync()?.trim() ?? '';
  stdout.write('Nombre del video: ');
  String video = stdin.readLineSync()?.trim() ?? '';
  stdout.write('Precio del trabajo: ');
  double? precio = double.tryParse(stdin.readLineSync() ?? '');

  if (cliente.isEmpty || video.isEmpty || precio == null || precio < 0) {
    print('Datos incorrectos. No se registro el trabajo.');
    return;
  }

  trabajos.add(Trabajo(cliente, video, precio, false));
  print('Trabajo registrado.');
}

void consultar(List<Trabajo> trabajos) {
  if (trabajos.isEmpty) {
    print('Todavia no hay trabajos registrados.');
    return;
  }
  for (int i = 0; i < trabajos.length; i++) {
    print('\${i + 1}.');
    trabajos[i].mostrar();
  }
}

int buscar(List<Trabajo> trabajos) {
  stdout.write('Escribe el nombre del cliente: ');
  String cliente = stdin.readLineSync()?.trim().toLowerCase() ?? '';

  for (int i = 0; i < trabajos.length; i++) {
    if (trabajos[i].cliente.toLowerCase() == cliente) {
      trabajos[i].mostrar();
      return i;
    }
  }
  print('No se encontro el trabajo.');
  return -1;
}

void modificar(List<Trabajo> trabajos) {
  int posicion = buscar(trabajos);
  if (posicion == -1) return;

  Trabajo trabajo = trabajos[posicion];
  stdout.write('Nuevo nombre del video (Enter para dejar igual): ');
  String video = stdin.readLineSync()?.trim() ?? '';
  if (video.isNotEmpty) trabajo.video = video;

  stdout.write('Nuevo precio (Enter para dejar igual): ');
  String textoPrecio = stdin.readLineSync()?.trim() ?? '';
  if (textoPrecio.isNotEmpty) {
    double? precio = double.tryParse(textoPrecio);
    if (precio != null && precio >= 0) {
      trabajo.precio = precio;
    } else {
      print('Precio incorrecto, se conserva el anterior.');
    }
  }

  stdout.write('¿El trabajo esta terminado? (s/n): ');
  String estado = stdin.readLineSync()?.trim().toLowerCase() ?? 'n';
  if (estado == 's') trabajo.terminado = true;
  if (estado == 'n') trabajo.terminado = false;
  print('Trabajo actualizado.');
}

void eliminar(List<Trabajo> trabajos) {
  int posicion = buscar(trabajos);
  if (posicion == -1) return;
  trabajos.removeAt(posicion);
  print('Trabajo eliminado.');
}

void resumen(List<Trabajo> trabajos) {
  Set<String> clientes = {};
  Map<String, int> cantidades = {'Pendientes': 0, 'Terminados': 0};
  double total = 0;

  for (Trabajo trabajo in trabajos) {
    clientes.add(trabajo.cliente);
    total += trabajo.precio;
    if (trabajo.terminado) {
      cantidades['Terminados'] = cantidades['Terminados']! + 1;
    } else {
      cantidades['Pendientes'] = cantidades['Pendientes']! + 1;
    }
  }

  print('--- RESUMEN ---');
  print('Trabajos registrados: \${trabajos.length}');
  print('Clientes diferentes: \${clientes.length}');
  print('Pendientes: \${cantidades['Pendientes']}');
  print('Terminados: \${cantidades['Terminados']}');
  print('Suma de precios registrados: \$\$total');
  print('Clientes: \${clientes.join(', ')}');
}
