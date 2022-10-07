var valores = [verdadero, false, 2, "hola","mundo", 3, char];
var mayor = 0;
for (i=0; i< valores.length; i++) { 
   if (valores[i].length > mayor.length ){
      mayor=valores[i].length;
   }
}
console.log(mayor)