# API SomosMás

API que nos permite 
- Registro/Eliminación/Login de usuarios
- Información de perfil
- Carga de información 



### Registrar usuario : 
POST localhost:3000/auth/register
Ejemplo :
{
  "email": "mail@mail.com",
  "password": "*xxxxxxxx",
  "firstName" : "john",
  "lastNamme": "doe"
}


### Login :
POST localhost:3000/auth/login
Ejemplo
{
 "email": "mail@mail.com",
  "password": "*xxxxxxxx",
}


