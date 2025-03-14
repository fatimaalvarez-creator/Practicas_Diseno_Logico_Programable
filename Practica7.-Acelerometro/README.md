# Práctica 7. Acelerómetro

Fátima Álvarez Nuño <br/>
A01645815 <br/>
25/02/25 <br/>
<br/>
  
## *OBJETIVO:*  
Diseñar un sistema en Verilog para la FPGA Intel 10M50DAF484G7C que permita leer los datos de un acelerómetro integrado, procesarlos y mostrar los valores de los ejes X, Y y Z en los displays de 7 segmentos de la tarjeta utilizada.  
  
## *MATERIALES NECESARIOS:*  
* Tarjeta FPGA DE10-Lite (10M50DAF484G7C).  
* Cable USB Blaster para la programación.  
* Software Intel Quartus Prime Lite.  
* Acelerómetro integrado en la FPGA.  
* Código en Verilog y TestBench.  
  
## *DESCRIPCIÓN DEL FUNCIONAMIENTO:*  
1. El sistema lee los valores de los ejes X, Y y Z del acelerómetro.  
2. La comunicación con el acelerómetro se realiza mediante SPI.  
3. Se almacena y procesa la información obtenida de cada eje.  
4. Los valores procesados se muestran en los displays de 7 segmentos.  
  
## *DESARROLLO DE LA PRÁCTICA:*  
1. Definir las entradas y salidas:  
   * ENTRADAS:  
     - Señales de reloj y reset.  
     - Interfaz SPI para comunicación con el acelerómetro.  
   * SALIDAS:  
     - Datos de los ejes X, Y y Z extraídos del acelerómetro.  
     - Señales para el control de los displays de 7 segmentos.  
  
2. Configuración del reloj y SPI:  
   * Se genera un reloj derivado para la comunicación SPI con el acelerómetro.  
   * Se establece la frecuencia de muestreo para la adquisición de datos.  
  
3. Lectura de datos del acelerómetro:  
   * Se capturan los datos de los ejes X, Y y Z en registros de 16 bits.  
   * Se extraen los 10 bits más significativos para su visualización.  
  
4. Implementación de la visualización en displays de 7 segmentos:  
   * Se instancia un módulo para la conversión y despliegue de los datos en los displays.  
  
### RTL VIEWER:  
![image](https://github.com/user-attachments/assets/xyz123)  
  
5. Mostramos la wave del testbench:  
![Captura de pantalla](https://github.com/user-attachments/assets/xyz456)  
  
## *CONCLUSIÓN:*  
Este diseño permite capturar, procesar y visualizar datos del acelerómetro en la FPGA DE10-Lite. Se implementa una comunicación SPI eficiente con un reloj derivado para la sincronización de datos. La información obtenida se muestra en los displays de 7 segmentos, facilitando la interpretación de la orientación del sensor en tiempo real. El sistema es flexible y puede adaptarse para futuras aplicaciones en robótica y control de movimiento.

