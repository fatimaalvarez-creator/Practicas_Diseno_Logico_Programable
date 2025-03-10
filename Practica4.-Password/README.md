# Práctica 3. Password
Fátima Álvarez Nuño <br/>
A01645815 <br/>
10/03/25 <br/>
<br/>

## *OBJETIVO:* <br/>
El objetivo es crear en Verilog un sistema de contraseña en la FPGA DE10-Lite usando "Máquinas de Estados Finitos (FSM)". La contraseña se ingresará de uno en uno con los switches y el sistema verificará una secuencia de 4 entradas. Si la secuencia es correcta, mostrará "DONE" en los displays; si hay un error, mostrará "ERROR". <br/>

## *MATERIALES NECESARIOS:* <br/>
* Tarjeta FPGA DE10-Lite (10M50DAF484C7G). <br/>
* Cable USB Blaster para la programación. <br/>
* Software Intel Quartus Prime Lite. <br/>
* Código en Verilog y TestBench. <br/>

## *DESCRIPCIÓN DEL FUNCIONAMIENTO:* <br/>
1. Se debe ingresar una contraseña utilizando los switches de la FPGA. <br/>
2. El sistema validará la secuencia ingresada; si es correcta, desplegará "DONE", de lo contrario, "ERROR". <br/>
3. Se incluye un reset para permitir nuevos intentos. <br/>

## *DESARROLLO DE LA PRÁCTICA:* <br/>
El sistema de contraseña en la FPGA DE10-Lite operará mediante una Máquina de Estados Finitos (FSM), siguiendo los siguientes pasos: <br/>
### 1. Ingreso de la contraseña: <br/>
* La clave se ingresará un bit a la vez usando los switches (SW) de la FPGA. <br/>
* El sistema esperará la siguiente entrada hasta completar la secuencia de 4 valores. <br/>
#### Para esto instanciamos el módulo de clkdiv para que ambos 'clk' (password y one_shot) estuvieran en sincronía y también el módulo de one_shot para cada switch [9:0], un total de 10 switches. <br/>
RTL VIEWER's: <br/> 
![image](https://github.com/user-attachments/assets/f16f13cb-f20a-4b31-82ae-406f6801bff5)
<br/> 
![image](https://github.com/user-attachments/assets/1cba3c43-19ca-448f-92cd-4b655508010e)
<br/>

### 2. Validación de la contraseña:
* Una vez ingresados los 4 valores, el sistema comparará la secuencia ingresada con una clave predefinida almacenada en el código. <br/>
- Si la secuencia ingresada es idéntica a la clave almacenada, se mostrará el mensaje "DONE" en los displays de 7 segmentos. <br/>
- Si en cualquier punto hay un error en la secuencia ingresada, el sistema inmediatamente mostrará "ERROR" en los displays. <br/>


### 3. Reinicio del sistema:
* Si el usuario desea intentar nuevamente, podrá reiniciar el sistema utilizando un botón de reset. <br/>
* Esto limpiará la memoria de la contraseña ingresada y permitirá un nuevo intento. <br/>
* Este sistema se implementará en Verilog y se ejecutará en la FPGA DE10-Lite, asegurando una operación secuencial y basada en una Máquina de Estados Finitos (FSM) para gestionar los estados de ingreso, validación y visualización de resultados. <br/>
State  Machine: <br/>
![image](https://github.com/user-attachments/assets/38197c54-4d67-467f-a953-62a5271bc2f1)
<br/>

### 4. Mostramos la wave del testbench: <br/>
![image](https://github.com/user-attachments/assets/6b0c5f18-49d3-4678-b444-ccdddb63a4a9)

<br/>

## *CONCLUSIÓN:* <br/>
Este proyecto demuestra el uso de Máquinas de Estados Finitos (FSM) en Verilog para la implementación de un sistema de password en la FPGA DE10-Lite. Implemente un diseño funcional en el que el usuario ingresa una secuencia de 4 valores, los cuales son validados con una clave predefinida y se muestra el resultado en los displays de 7 segmentos. Además, se implementó una función de reset, para permitir varios intentos.
