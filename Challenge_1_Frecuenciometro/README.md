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
RTL VIEWER (debouncer): <br/>
![image](https://github.com/user-attachments/assets/666bd947-4ff3-4084-8759-7b6546d415d9)
<br/>
RTL VIEWER (synchronizer): <br/>
![image](https://github.com/user-attachments/assets/002d6df8-c1d4-4670-881f-d3034066dcb9)
<br/>

###  2. Edge detector y period capture <br/>
Se detecta el flanco ascendente de la señal de entrada y se mide el período entre eventos consecutivos. <br/>
RTL VIEWER (edge_detector): <br/>
![image](https://github.com/user-attachments/assets/c37dc75d-c6bb-4813-8fe5-2c81d2fbd703)
<br/>
RTL VIEWER (period_capture): <br/>
![image](https://github.com/user-attachments/assets/51be252a-daec-4360-8fe0-e1477d4fe89c)
<br/>

### 3. Cálculo de Frecuencia <br/>
La frecuencia se calcula como: <br/>
T = 1/f -> f = 1/T,  <br/>
Donde T es el período medido en ciclos del reloj de 50 MHz.
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/416960be-cff6-41a0-9816-f449fc1b6c11)
<br/>

### 4. Conversión a BCD y Visualización en Displays <br/>
La frecuencia medida se convierte de binario a BCD y se muestra en los displays de 7 segmentos de la FPGA. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/5900579a-f203-4990-824f-011ce56291f4)
<br/>

### 5. Integración del sistema <br/>
El sistema opera de la siguiente manera: <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/26f225d5-20de-43b2-a360-9dc9645a3064)
<br/>

### 5. Mostramos la wave del TestBench: <br/>
![image](https://github.com/user-attachments/assets/aa9ae9a6-b681-4987-9a3f-1f92a4467fce)
<br/>

## CONCLUSIÓN: <br/>
En esta práctica, implementamos un frecuencímetro digital en Verilog para la FPGA DE10-Lite, capaz de medir señales en un rango de 10 Hz a 100 kHz con un error de precisión del 1%. Se integraron módulos de contador de ciclos de señal entrada, cálculos para la frecuenica, conversión a BCD y visualización en 7 segmentos.
