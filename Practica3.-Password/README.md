# Práctica 3. Password
Fátima Álvarez Nuño <br/>
A01645815 <br/>
10/03/25 <br/>
<br/>

## *OBJETIVO:* <br/>
El objetivo es crear en Verilog un sistema de contraseña en la FPGA DE10-Lite usando "Máquinas de Estados Finitos (FSM)". La contraseña se ingresará de uno en uno con los switches y el sistema verificará una secuencia de 4 entradas. Si la secuencia es correcta, mostrará "Good" en los displays; si hay un error, mostrará "Bad". <br/>

## *MATERIALES NECESARIOS:* <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:* <br/>

## *DESARROLLO DE LA PRÁCTICA:* <br/>
El sistema de contraseña en la FPGA DE10-Lite operará mediante una Máquina de Estados Finitos (FSM), siguiendo los siguientes pasos:
1. Ingreso de la contraseña:
La clave se ingresará un bit a la vez usando los switches (SW) de la FPGA.
Para capturar cada entrada, el usuario deberá presionar un botón (KEY), lo que indicará al sistema que almacene el valor actual del switch.
El sistema esperará la siguiente entrada hasta completar la secuencia de 4 valores.

2. Validación de la contraseña:
Una vez ingresados los 4 valores, el sistema comparará la secuencia ingresada con una clave predefinida almacenada en el código.
Si la secuencia ingresada es idéntica a la clave almacenada, se mostrará el mensaje "Good" en los displays de 7 segmentos.
Si en cualquier punto hay un error en la secuencia ingresada, el sistema inmediatamente mostrará "Bad" en los displays.

3. Reinicio del sistema:
Si el usuario desea intentar nuevamente, podrá reiniciar el sistema utilizando un botón de reset.
Esto limpiará la memoria de la contraseña ingresada y permitirá un nuevo intento.
Este sistema se implementará en Verilog y se ejecutará en la FPGA DE10-Lite, asegurando una operación secuencial y basada en eventos mediante una FSM para gestionar los estados de ingreso, validación y visualización de resultados.
RTL VIEWER:
RTL VIEWER:

## *CONCLUSIÓN:* <br/>
