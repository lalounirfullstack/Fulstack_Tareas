## Restaurant DB
## Restaurant Schema
+ Locales
  + nombre
  + direccion
  + telefono
  + nombre responsable
  + open
+ Mesas
  + numero de mesas
  + numero de comensales
  + ocupada
  + fecha en la que quedo ocupada
  + local al que pertenece
+ Cliente
  + nombre
  + telefono
  + email
  + referencia si tiene mesa ocupada.
+ Clientes_Mesas
  + Relacion entre Clientes y Mesas
+ Favoritos
  + Relacion entre Cliente y Locales 
  + Favoritos de un cliente en concreto

## SQL Queries
+ Mesas ocupadas de un lugar en concreto y Clientes que las ocupan
+ Locales marcado como favorito. 

## Entrega
+ Fichero SQL dode quede marcado la creacion de diferente tablas
+ Sentencias solicitadas

## Rubrica
+ Definición correcta de todos los campos de la tabla locales.
+ Definición correcta de todos los campos de la tabla mesas.
+ Definición correcta de todos los campos de la tabla clientes.
+ Definición correcta de todos los campos de la tabla favoritos.
+ Creación y funcionamiento correcto de las sentencias SQL que nos permiten recuperar información a partir
de las diferentes relaciones.

## Notas
+ Locales (Tabla)
  + Adicione el campo sucursal para permitir el uso de un Restaurant que es como una Franquicia con varias sucursales.
  + Esto permite saber hacer reservaciones y conocer las fechas de ocupacion de mesas por cada sucursal.
  + Ademas permite conocer mas a detalle no solo el restaurant favorito del cliente sino que sucursal.
+ Clientes & Mesas
  + Creee esta tabla para permitir que un Cliente pueda ocupar varias mesas es diferentes restaurantes.
  + No hay reglas de validacion como que no pueda reservar una misma mesa al mismo tiempo en dos locales 
    pero la idea se podria implementar.
+ Inclui un stored Procedure para agilizar el Testing
+ Inclui una View para agilizar otras busquedas.
+ Include BD BackUp ademas de los archivos SQL. 

## SOLUTION 
Estrutura:
+ server.js - Para lanzar el Servidor.
+ app.js - Main application que referencia las rutas.
+ routes > inmuebles.js - CRUD rutas.
+ model > inmueble.js - Modelo del Inmueble.
+ controlers . inmuebles.controller.js funciones para ejecutar el CRUD.
+ fincaRequest.http - ejecucion de las Request.
+ env - definicion de Puerto de desarrollo