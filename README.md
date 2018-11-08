Esta prueba tiene como objetivo medir tus conocimientos tecnicos sobre Ruby on Rails.
Se requiere una aplicacion para la administracion de mensajes en un muro, cada usuario puede postear un mensaje en el muro para que pueda ser leido por todos.

Ademas puede citar/etiquetar a otro usuario registado usando @USERNAME dentro del texto del mensaje, cada cita/etiqueta en un mensaje debe gatillar una noticacion en el frontend de la aplicacion indicandole al usuario citado (solo a ese usuario) que ha sido etiquetado en un mensaje, el mensaje debe ser "USUARIO1 te ha etiquetado en un mensaje"

Ademas se deben cumplir con los siguientes requerimientos tecnicos:

* Registro de usuarios (Creacion de cuentas) Login de usuarios
* Perles de usuario: Moderador (puede ver todos los mensajes, borrarlos y editarlos) y Usuario Normal (puede ver todos los mensajes pero solo puede editar y borrar los de su autora)
* La noticacion de etiquetado debe ser creada usando background jobs
* Una vez terminada la aplicacion debe ser subida a Heroku(servidor free) con al menos 1 usuario del tipo Moderador, ademas nos debes entregar la URL para probar la aplicacion.
