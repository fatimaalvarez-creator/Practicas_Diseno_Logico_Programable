# Práctica 2. Counter BCD con clock up-down
Fátima Álvarez Nuño <br/>
A01645815 <br/>
09/03/25 <br/>
<br/>

## *OBJETIVO:* <br/>
Diseñar e implementar un counter BCD con clock up-down en Verilog para la FPGA DE10-Lite, integrando un divisor de reloj que sirve para ajustar la velocidad de conteo y mejorar la visualización, señal 'enable' que habilita o deshabilita el conteo, señal 'load' que permite agregar un valor específico, un switch 'up/down' que nos ayuda a configurar si el conteo es ascendente o descendente y por último los displays de 7 segmentos para mostar el valor actual de contador.  
<br/>

## *MATERIALES NECESARIOS:* <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>
<br/>

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:* <br/>
### 1. Divisor de reloj:  <br/>
El reloj de la FPGA DE10-Lite opera a 50 MHz, es muy rápido para una visualización clara del conteo. Para solucionar esto, implementamos un divisor de reloj (clkdiv), el cual reduce la frecuencia de la señal de reloj y genera una señal de menor frecuencia. Esta nueva señal es utilizada por el contador para asegurar que los cambios en el valor sean perceptibles en los displays de 7 segmentos.  <br/>

### 2. Contador ascendente-descendente (Counter BCD)  <br/>
El contador es un BCD (Binary-Coded Decimal) y permite contar en ambas direcciones según el control de entrada:  <br/>
* Señal 'enable': Habilita o deshabilita el conteo. <br/>
<br/> - Si está en bajo (0), el contador se detiene, mantieniendo el último valor. <br/>
<br/> - Si está en alto (1), el contador sigue contando. <br/>
* Señal 'up_down': Define la dirección del conteo.  <br/>
<br/> - Si está en bajo (0), el contador opera en modo descendente. <br/>
<br/> - Si está en alto (1), el contador opera en modo ascendente. <br/>
* Señal 'load': Permite cargar un valor específico en el contador, es útil par iniciar el conteo desde un número determinado en lugar de comenzar desde cero. <br/>

### 3. Conversión y visualización en 7 segmentos  <br/>
El valor BCD del contador debe ser convertido para los displays de 7 segmentos. Implementamos un decodificador BCD a 7 segmentos, fue el que realizamos en la práctica 1; lo qie hace es traducir el número binario en los segmentos correspondientes para mostrar de manera correcta los números del 0 al 9 en los displays de la FPGA.  <br/>

### 4. Integración y funcionamiento del sistema <br/>
El sistema tiene el siguiente funcionamiento: <br/>
* El divisor de reloj genera una señal con la frecuencia adecuada (clkdiv). <br/>
* El contador recibe el pulso de reloj dividido y opera en base a enable, up_down y load (counter_up_down). <br/>
* El valor BCD del contador se envía al decodificador BCD a 7 segmentos (decoder_bcd). <br/>
* El valor convertido es mostrado en los displays de 7 segmentos de la FPGA (decoder_7seg). <br/>

## *DESARROLLO DE LA PRÁCTICA:* <br/>
RTL VIEWER: <br/>
RTL VIEWER:

## *CONCLUSIÓN:* <br/>
