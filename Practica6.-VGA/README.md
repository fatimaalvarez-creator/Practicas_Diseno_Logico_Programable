# Práctica 6. VGA
Fátima Álvarez Nuño <br/>
A01645815 <br/>
25/02/25 <br/>
<br/>

## *OBJETIVO:*  
Diseñar un sistema en Verilog para la FPGA Intel 10M50DAF484G7C que permita generar la señal de sincronización y el contenido gráfico para visualizar las coordenadas X, Y y Z en un monitor VGA.
  
## *MATERIALES NECESARIOS:*  
* Tarjeta FPGA DE10-Lite (10M50DAF484G7C).  
* Cable USB Blaster para la programación.  
* Software Intel Quartus Prime Lite.  
* Monitor VGA.  
* Código en Verilog y TestBench.  
  
## *DESCRIPCIÓN DEL FUNCIONAMIENTO:*  
1. Se genera la señal de sincronización horizontal y vertical para la interfaz VGA.  
2. Se reciben las coordenadas X, Y y Z y se procesan para su representación gráfica.  
3. Se realiza la conversión de valores a formato visual utilizando una ROM de dígitos.  
4. Se envían las señales de color RGB para la representación en el monitor VGA.  
  
## *DESARROLLO DE LA PRÁCTICA:*  
1. **Definir las entradas y salidas:**  
   * **ENTRADAS:**  
     - Señal de reloj de 50 MHz.  
     - Coordenadas X, Y y Z (-512 a 511).  
   * **SALIDAS:**  
     - Señales de sincronización VGA (hsync y vsync).  
     - Señales de color RGB.  
  
2. **Generación de señales VGA:**  
   * Se divide el reloj para obtener 25 MHz.  
   * Se genera la sincronización horizontal y vertical mediante un generador de sincronización.  
  
3. **Procesamiento de coordenadas:**  
   * Se normalizan los valores de X, Y y Z.  
   * Se extraen los dígitos para la representación en pantalla.  
  
4. **Conversión a formato visual:**  
   * Se utiliza una memoria ROM para almacenar la representación de números y letras.  
   * Se accede a los datos almacenados para dibujar en el monitor.  
  
5. **Mostramos la wave del testbench:**  
  
## *CONCLUSIÓN:*  
Este diseño permite representar visualmente coordenadas X, Y y Z en un monitor VGA mediante la FPGA DE10-Lite. Se implementa una sincronización precisa de la señal VGA y un procesamiento de datos eficiente. La información mostrada en la pantalla facilita la interpretación de los datos en tiempo real, permitiendo su aplicación en visualización de sensores y sistemas de control.

