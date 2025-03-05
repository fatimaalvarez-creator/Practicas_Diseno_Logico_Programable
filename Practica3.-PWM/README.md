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
1. Reloj lento (slow_clk): Utilizando un divisor de reloj, se genera una señal de 20 Hz (1 / 0.05 segundos), lo que permite un control gradual del servomotor. <br/>
2. Botones (pb_inc y pb_dec): Los botones incrementan o decrementan el duty cycle mediante un filtro de rebote (debouncer), que asegura que cada pulsación se registre correctamente. <br/>
3. ontador PWM: El contador aumenta con cada ciclo de reloj rápido (50 MHz) y se reinicia cuando alcanza el período de 50,000 ciclos. Si el contador es menor que el duty cycle (DC), la señal PWM es alta (1), de lo contrario es baja (0). <br/>
4. Ajuste gradual: Cuando se presiona el botón de incremento, el DC aumenta en 2,500 ciclos (0.05 ms), y cuando se presiona el botón de decremento, el DC disminuye en 2,500 ciclos (0.05 ms), manteniendo al servomotor en la posición deseada. <br/>

## DESARROLLO DE LA PRÁCTICA: <br/>
*** clkdiv_pwm
RTL VIEWER:
![image](https://github.com/user-attachments/assets/ba6fb8ac-910a-4b90-90cd-c9f9527ccf19)
<br/>

*** debouncer_pwm
RTL VIEWER:
![image](https://github.com/user-attachments/assets/010d8949-7761-46f6-a614-433307906b71)

<br/>

*** pwm
RTL VIEWER: 
![image](https://github.com/user-attachments/assets/264d50d7-06df-413f-9cec-284e45f5ab1e)
<br/>

## CONCLUSIÓN: <br/>

