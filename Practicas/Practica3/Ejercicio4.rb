#¿Para qué sirve retry? ¿Cómo podés evitar caer en un loop infinito al usarla?

# retry: se usa para volver a ejecutar un bloque de código que generó una excepción
# loop infinito: se produce cuando se ejecuta un bloque de código que genera una excepción y se vuelve a ejecutar el mismo bloque de código, generando una excepción nuevamente y así sucesivamente
# evitar loop infinito: se puede evitar un loop infinito usando begin .. rescue .. ensure y resolviendo la causa de la excepción en el rescue o el ensure