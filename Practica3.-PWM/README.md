# Práctica 3. PWM
Fátima Álvarez Nuño <br/>
A01645815 <br/>
07/03/25 <br/>
<br/>

## OBJETIVO: <br/>
Crear un módulo en Verilog que genere una señal PWM para ajustar la posición de un servomotor en la FPGA DE10-Lite, permitiendo la modificación del ciclo de trabajo (duty cycle) a través de los botones de la tarjeta. La señal PWM tiene una frecuencia de 50 Hz (período de 20 ms), adecuada para controlar la posición del servomotor, y el duty cycle (ancho de pulso) determinará la posición del servomotor. Este ciclo de trabajo se ajustará incrementando o decrementando el ángulo de movimiento del servo mediante los botones de la FPGA.

## MATERIALES NECESARIOS: <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>

## DESCRIPCIÓN DEL FUNCIONAMIENTO: <br/>
1. Utilizamos el reloj de la FPGA DE10-Lite (50 MHz) como señal base. <br/>
2. Generamos una señal PWM con una frecuencia de 50 Hz (período de 20 ms). <br/>
3. El duty cycle (ancho de pulso) se ajusta mediante los botones de la FPGA. <br/>
4. Se habilita un control gradual para el ajuste del ciclo de trabajo, permitiendo el incremento o decremento del ángulo de rotación del servomotor. <br/>

## DESARROLLO DE LA PRÁCTICA: <br/>
### 1. Generación de la señal PWM: <br/>
La señal PWM se genera mediante un contador que ajusta la salida en función del ciclo de trabajo. El contador se reinicia al alcanzar el periodo completo de la señal. <br/>

### 2. Ajuste del duty cycle: <br/>
El duty cycle es ajustado por medio de los botones de la FPGA. Un botón incrementa el ciclo de trabajo, y el otro lo decrementa, ajustando la posición del servomotor en pequeños pasos. <br/>

### 3. Control mediante botones: <br/>
Los botones de la tarjeta controlan el incremento o decremento del duty cycle, el cual determina la posición exacta del servomotor. Los cambios son graduales y se manejan con un 'clkdiv' para asegurar una velocidad adecuada. <br/>

### 4. Divisor de reloj (clkdiv_PWM): <br/>
El divisor de reloj ayuda a la correcta operación de la señal PWM. Ya que el reloj principal de la FPGA DE10-Lite es de 50 MHz, se necesita reducir esta frecuencia para generar una señal PWM adecuada para controlar el servomotor a 50 Hz. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/ba6fb8ac-910a-4b90-90cd-c9f9527ccf19)
<br/>

### 5. Eliminación de rebotes (debouncer_PWM): <br/>
Cuando se utilizan botones físicos para controlar el ciclo de trabajo del PWM, los botones generan rebotes, lo que puede hacer que el sistema registre varios pulsos por un solo clic. Para evitar este problema, implementamos un 'debouncer', que limpia la señal de los botones, asegurando que cada pulsación sea procesada solo una vez. <br/> El 'debouncer_PWM' detecta flancos de subida o bajada en la entrada del botón, asegurándose de que solo un pulso limpio se registre por cada pulsación del botón. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/010d8949-7761-46f6-a614-433307906b71)
<br/>

### 6. Integración y funcionamiento del sistema: <br/>
El sistema completo incluye: <br/>
* El módulo de divisor de reloj que genera una señal de reloj dividida, utilizada para controlar la frecuencia de la señal PWM. <br/>
* El módulo de generación de PWM, que ajusta el ciclo de trabajo con base en la señal de reloj dividida y el ajuste de los botones. <br/>
*El módulo de debouncing, que asegura que las pulsaciones de los botones sean procesadas correctamente, eliminando cualquier rebote que pueda ocurrir. <br/>
* Todo el sistema funciona en conjunto, permitiendo el control preciso de la posición del servomotor a través del ajuste gradual del duty cycle. <br/>
RTL VIEWER: <br/>
![image](https://github.com/user-attachments/assets/264d50d7-06df-413f-9cec-284e45f5ab1e)
<br/>

### 7. Mostramos la wave del testbench: <br/>
<br/>


## CONCLUSIÓN: <br/>
En esta práctica, diseñamos e implementamos un módulo PWM en Verilog para la FPGA DE10-Lite, lo que permitió controlar la posición de un servomotor. El ajuste del ciclo de trabajo se logró de forma eficiente mediante botones de la FPGA, lo que permite un control preciso y gradual del ángulo de rotación del servomotor. Las simulaciones y las pruebas físicas demostraron que el sistema funciona correctamente, cumpliendo con el objetivo de ajustar la posición del servomotor de manera efectiva.
