# Práctica 1. Decodificador BCD
Fátima Álvarez Nuño <br/>
A01645815 <br/>
21/02/25 <br/>
<br/>

## *OBJETIVO:* <br/>
Hacer un sistema en Verilog para la FPGA Intel 10M50DAF484G7C que ayude a leer los switches que interpreten su valor de número binario y lo convierte en número decimal y después se muestra en los displays de 7 segmentos de la tarjeta utilizada. <br/>
<br/>

## *MATERIALES NECESARIOS:* <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>
<br/>

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:* <br/>
1. Los 10 switches utilizados en la FPGA representan un número binario. <br/>
2. El valor que ponemos en los switches se convierte de binario a decimal. <br/>
3. En el display de 7 segmentos se muestra el número que se convirtió de binario a decimal. <br/>
<br/>

## *DESARROLLO DE LA PRÁCTICA:* <br/>
1. Definir las entradas y salidas: <br/>
  * ENTRADAS:  Estado de los switches físicos de la FPGA (10 bits). <br/>
  * SALIDAS: Señales para controlar los segmentos de los displays (unidades, decenas, centenas y unidades de millar). <br/>
2. Convertir el número binario a decimal: <br/>
  * Se divide el número binario en unidades, decenas, centenas y unidades de millar utilizando operaciones de módulo y división. <br/>
  * Se generan señales auxiliares para almacenar cada uno de estos valores (unidades, decenas, centenas y unidades de millar). <br/>
3. Implementar un módulo para decodificar los valores y controlarlos en los displays: <br/>
![image](https://github.com/user-attachments/assets/0ea82eca-f09c-4941-905b-2a8627dcb3a8)
![image](https://github.com/user-attachments/assets/2d6fd931-23fa-4d08-93d3-49ec6884a2db)

4. Instanciar módulo de 7 segmentos para observar los datos: <br/>
  * Se instancia un módulo decoder_7seg encargado de convertir los valores en señales adecuadas para los displays de 7 segmentos. <br/>
  * Cada display representa un dígito del número decimal. <br/>
![image](https://github.com/user-attachments/assets/4ce80e2d-0363-49c5-9b8e-67d572b57c63)
![image](https://github.com/user-attachments/assets/597f26d9-41f1-4a75-8484-451c00cd0c53)
<br/>

## *CONCLUSIÓN:* <br/>
Este diseño permite convertir un número binario de hasta 10 bits (rango de 0 a 1023) en su equivalente decimal y mostrarlo en los displays de 7 segmentos de la FPGA. Utiliza operaciones de módulo (%) y división (/) para separar las unidades, decenas, centenas y unidades de millar, enviando cada valor a un decodificador específico para su visualización. Además, el diseño es flexible y escalable, permitiendo aumentar el número de bits y displays sin necesidad de reescribir todo el código. <br/>
