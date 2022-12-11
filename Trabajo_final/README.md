# README

En este README se detallan los pasos para instalación y configuración de la aplicación, admás de ciertas desiciones de
diseño.

Pasos para instalar la aplicación

* Instalar Ruby 3.0.4 con el manejador de paquetes apropiado ej: pacman,apt, etc.
* Si ya está inatalado Ruby y se usa un manejador de versiones como RVM, rbenv, etc. se debe instalar la versión 3.0.4.
* Clonar el repositorio y con una terminal ubicarse en la carpeta del proyecto.
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
* De los turnos el administrador puede borrarlos o editarlos