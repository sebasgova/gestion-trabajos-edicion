# Gestión de trabajos de edición de video

Este es un programa sencillo hecho en Dart para organizar trabajos de edición de video.

## ¿Qué puede hacer?

- Registrar trabajos con el nombre del cliente, el video y el precio.
- Ver todos los trabajos guardados.
- Buscar un trabajo por el nombre del cliente.
- Modificar o eliminar trabajos.
- Ver un resumen de los trabajos pendientes y terminados.

## ¿Cómo ejecutar el programa?

Necesitas tener instalado Dart. Descarga o clona este repositorio y abre una terminal en la carpeta del proyecto. Después ejecuta:

```bash
dart run main.dart
```

El programa mostrará un menú con las opciones disponibles. Escribe el número de la opción que quieras usar.

## Clases y objetos

En el archivo `trabajo.dart` hay una clase llamada `Trabajo`. La clase define los datos que tiene cada trabajo: cliente, video, precio y si ya está terminado.

Cuando registramos un trabajo, creamos un objeto usando esa clase. Así podemos guardar los datos de cada trabajo por separado.

El programa usa listas para mantener los trabajos mientras está abierto y funciones para registrar, buscar, modificar, eliminar y mostrar información.

## Archivos del proyecto

- `main.dart`: muestra el menú principal.
- `funciones.dart`: contiene las acciones del programa.
- `trabajo.dart`: contiene la clase `Trabajo`.
- `.github/workflows/comprobar-dart.yml`: revisa el código automáticamente.
