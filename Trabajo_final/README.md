# README

En este README se detallan los pasos para instalación y configuración de la aplicación, admás de ciertas desiciones de
diseño.

Pasos para instalar la aplicación

* Instalar Ruby 3.0.4 con el manejador de paquetes apropiado ej: pacman,apt, etc.
* Si ya está inatalado Ruby y se usa un manejador de versiones como RVM, rbenv, etc. se debe instalar la versión 3.0.4.
* Clonar el repositorio o descargar el comprimido y con una terminal ubicarse en la carpeta del proyecto.
* Instalar la gema bundler con el comando `gem install bundler`.
* Correr el comando bundle install para instalar las dependencias del proyecto.

-Pasos para correr la aplicación

* Para hacer el setup básico de la base de datos, correr el comando `rails db:reset`
* En la consola usar el comando `rails s` para correr el servidor
* Con cualquier navegador web, ir a la dirección `localhost:3000` para ver la aplicación funcionando

-Desiciones de diseño

* Se uso devise para la autenticación y cancancan para la autorización, ya que son gemas con sistemas muy robustos para
  estas tareas.
  Además de ser fáciles de usar y aceleran la velociada de desarrollo.
* Se uso bootstrap para el diseño de la aplicación, ya que es una librería muy completa y fácil de usar.
* Se usaron rutas anidadas para la creación de los recursos,
  ya que es una forma de organizar las rutas y los controladores de una manera más natural, siguiendo las reglas del
  dominio.
* El empleado solo ver el listado de sus turnos en su sucursal del día actual, y no puede ver los turnos de otras sucursales,
esto es para reducir la carga de información.
* El administrador puede manipular todos los elementos sin restricciones, pero no puede ni cambiar el rol de una persona,
ni pedir un turno a través de la interfaz
* De los turnos el administrador puede borrarlos o editarlos mientras están pendientes.
* Las contraseñas pueden ser modificadas tanto por el usuario como por el admin, pero no se puede ver la contraseña de un
  usuario, para crear una cuenta de personal o admin, la contraseña es asignada por el admin.
* El admin al cancelar un turno, lo borra y si es un cliente, lo cambia de estado a cancelado, 
esto es porque el usuario no debería pode borrar elementos de la db

-Consideraciones
*El usuario de admin es admin@admin.com y la contraseña es 123456,
a partir de esto se pueden ver los otros usuarios del seeds y todas las contraseñas son 123456.