# Práctica 2. UART con Paridad en Verilog  
Fátima Álvarez Nuño  
A01645815  
14/03/25  

## *OBJETIVO:*  
Desarrollar un módulo de comunicación UART en Verilog con bit de paridad, utilizando la tarjeta FPGA DE10-Lite. El sistema debe ser capaz de recibir y transmitir datos serie a una velocidad de 115200 baudios, verificando la paridad del mensaje.  

## *MATERIALES NECESARIOS:*  
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G).  
* Cable USB Blaster para la programación.  
* Software Intel Quartus Prime Lite.  
* Código en Verilog y TestBench.  

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:*  
1. Se configura la FPGA para operar a una velocidad de 115200 baudios.  
2. Se implementan dos módulos: uno para la transmisión de datos (*uart_tx*) y otro para la recepción con verificación de paridad (*uart_rx*).  
3. Se utiliza un divisor de reloj para asegurar la sincronización adecuada de la comunicación.  
4. La información recibida se muestra en los LEDs o en los displays de 7 segmentos.  
5. Se incorpora la selección del tipo de paridad mediante switches:  
   * 0: Sin paridad.  
   * 1: Paridad impar.  
   * 2: Paridad par.  
6. Se indica el estado de la paridad con LEDs:  
   * LED de error en paridad. 
   * LED de paridad correcta.  

## *DESARROLLO DE LA PRÁCTICA:*  
### 1. Módulo de Transmisión (uart_tx):  
Este módulo envía los datos serializados e incluye la generación del bit de paridad según la configuración establecida por los switches. Se asegura que los bits de inicio y paro se añadan correctamente al flujo de datos.  

### 2. Módulo de Recepción (uart_rx):  
Este módulo recibe los datos serializados, verifica la paridad y almacena los datos si la paridad es correcta. Si hay error de paridad, se enciende un LED de advertencia.  

### 3. Integración con la FPGA:  
* Se conectan los switches para seleccionar el tipo de paridad.  
* Los botones de la FPGA se utilizan para enviar datos de prueba.  
* Los datos recibidos se muestran en los LEDs o en el display de 7 segmentos.  
* Se realizan pruebas con un banco de pruebas en Verilog (TestBench) para validar el funcionamiento de la transmisión y recepción.  

## *MOSTRANDO LA WAVE DEL TESTBENCH:*  


## *CONCLUSIÓN:*  
En esta práctica, se diseñó e implementó un sistema de comunicación UART con paridad en Verilog para la FPGA DE10-Lite. La verificación de paridad aseguró la integridad de los datos transmitidos y recibidos. Se integraron correctamente los módulos de transmisión y recepción, y se validó su funcionamiento mediante pruebas en simulación y pruebas físicas con la FPGA.
