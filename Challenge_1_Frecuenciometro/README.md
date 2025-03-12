# Challenge 1. Frecuencímetro
Fátima Álvarez Nuño <br/>
A01645815 <br/>
07/03/25 <br/>
<br/>

## OBJETIVO: <br/>
Implementar en Verilog un frecuencímetro que mida la frecuencia de una señal de entrada en un rango de 10 Hz a 100 kHz, mostrando el resultado en los displays de 7 segmentos de la FPGA DE10-Lite, con un error de precisión del 1%. <br/>

## MATERIALES NECESARIOS: <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>

## DESCRIPCIÓN DEL FUNCIONAMIENTO: <br/>
1. Se usa el reloj de la FPGA DE10-Lite de 50 MHz como referencia para la medición de frecuencia. <br/>
2. Se cuenta la cantidad de ciclos de la señal de entrada durante un intervalo de tiempo fijo. <br/>
3. Se calcula la frecuencia dividiendo el número de ciclos entre el intervalo de medición. <br/>
4. Se convierte el valor medido a BCD para su visualización en los displays de 7 segmentos. <br/>

## DESARROLLO DE LA PRÁCTICA: <br/>
### 1. Debouncer y synchronizer
Estos módulos se encargan de limpiar las señales de entrada y evitar errores debido a rebotes o problemas de sincronización.
RTL VIEWER: <br/>

<br/>

###  2. Edge detector y period capture <br/>
Se detecta el flanco ascendente de la señal de entrada y se mide el período entre eventos consecutivos. <br/>
RTL VIEWER: <br/>

<br/>

### 3. Cálculo de Frecuencia <br/>
La frecuencia se calcula como: <br/>
T = 1/f -> f = 1/T,  <br/>
Donde T es el período medido en ciclos del reloj de 50 MHz.
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/70d7c77b-a429-4b62-9e2f-72c4d0affe22)
 <br/>

### 4. Integración del sistema <br/>
El sistema opera de la siguiente manera: <br/>
* El contador mide la cantidad de ciclos en el intervalo de tiempo definido. <br/>
* Se calcula la frecuencia dividiendo la cantidad de ciclos entre el tiempo de medición. <br/>
* La frecuencia calculada se convierte a BCD. <br/>
* La información se envía a los displays para su visualización. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/4c916b62-03d4-482b-a4a7-aec1caa08be9)
<br/>

### 5. Mostramos la wave del TestBench: <br/>
![image](https://github.com/user-attachments/assets/9a8ac560-17da-4147-a36b-b1593b275bea)
![image](https://github.com/user-attachments/assets/ec94584e-1cfb-453a-94a4-5260c01fe2d0)
 <br/>

## CONCLUSIÓN: <br/>
En esta práctica, implementamos un frecuencímetro digital en Verilog para la FPGA DE10-Lite, capaz de medir señales en un rango de 10 Hz a 100 kHz con un error de precisión del 1%. Se integraron módulos de contador de ciclos de señal entrada, cálculos para la frecuenica, conversión a BCD y visualización en 7 segmentos.
