# Challenge 1. Frecuencímetro
Fátima Álvarez Nuño <br/>
A01645815 <br/>
07/03/25 <br/>
<br/>

## *OBJETIVO:* <br/>
Implementar en Verilog un frecuencímetro que mida la frecuencia de una señal de entrada en un rango de 10 Hz a 100 kHz, mostrando el resultado en los displays de 7 segmentos de la FPGA DE10-Lite, con un error de precisión del 1%.  <br/>

## *MATERIALES NECESARIOS:* <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:* <br/>
1. Se usa el reloj de la FPGA DE10-Lite de 50 MHz como referencia para la medición de frecuencia. <br/>
2. Se cuenta la cantidad de ciclos de la señal de entrada durante un intervalo de tiempo fijo. <br/>
3. Se calcula la frecuencia dividiendo el número de ciclos entre el intervalo de medición. <br/>
4. Se convierte el valor medido a BCD para su visualización en los displays de 7 segmentos. <br/>

## *DESARROLLO DE LA PRÁCTICA:* <br/>
### 1. Divisor de Reloj para la Base de Tiempo <br/>
Para garantizar precisión en la medición, se utiliza un divisor de reloj que genera una base de tiempo de 1 segundo. Durante este período, se cuenta el número de pulsos de la señal de entrada para calcular la frecuencia. <br/>
RTL VIEWER: <br/>

### 2. Contador de Ciclos de la Señal de Entrada <br/>
Se implementa un contador que registra la cantidad de pulsos de la señal a medir dentro del intervalo de 1 segundo generado por el divisor de reloj. Al final del intervalo, el valor del contador representa directamente la frecuencia de la señal de entrada en Hz. <br/>
Señales importantes: <br/>
* clk: Reloj de la FPGA. <br/>
* signal_in: Señal cuya frecuencia se va a medir. <br/>
* counter: Contador de ciclos de la señal. <br/>
RTL VIEWER: <br/>

### 3. Conversión a BCD y Visualización en Displays de 7 Segmentos <br/>
El valor del contador (frecuencia medida) se convierte de binario a BCD para ser mostrado en los displays de 7 segmentos de la FPGA. Se implementa un decodificador BCD a 7 segmentos que traduce el valor numérico a la representación visual correcta. <br/>
Señales importantes: <br/>
* frequency: Frecuencia medida en binario. <br/>
* BCD_in_sw: Frecuencia convertida a BCD. <br/>
* seg7_display: Salida para los displays de la FPGA. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/ec78266d-7ca5-4cfc-aa81-bd419491852b)
 <br/>

### 4. Integración y Funcionamiento del Sistema <br/>
El sistema opera de la siguiente manera: <br/>
* El divisor de reloj genera la base de tiempo de 1 segundo. <br/>
* El contador mide la cantidad de pulsos de la señal de entrada en ese intervalo. <br/>
* La frecuencia medida se almacena y se convierte a BCD. <br/>
* El decodificador BCD a 7 segmentos muestra el valor en los displays de la FPGA. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/80bdf1fa-f3c2-4f1e-9fdd-d6847814e14c)
<br/>

### 5. Mostramos la wave del TestBench: <br/>

## *CONCLUSIÓN:* <br/>
En esta práctica, se diseñó e implementó un frecuencímetro digital en Verilog para la FPGA DE10-Lite, capaz de medir señales en un rango de 10 Hz a 100 kHz con un error de precisión del 1%. Se integraron módulos de divisor de reloj, contador de ciclos, conversión a BCD y visualización en 7 segmentos. Las pruebas y simulaciones confirmaron su correcto funcionamiento.
