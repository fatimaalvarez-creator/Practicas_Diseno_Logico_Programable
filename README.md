# 🧩 Diseño con Lógica Programable

Este repositorio contiene el conjunto de prácticas desarrolladas en la materia **Diseño con Lógica Programable**, enfocada en el uso de lenguajes de descripción de hardware (HDL) y plataformas FPGA para implementar módulos digitales funcionales. Se abordan desde decodificadores simples hasta periféricos complejos como UART, VGA, y acelerómetros.

## 📦 Contenido del repositorio

Cada carpeta representa una prácticas distinta desarrolladas en el curso:

- `01_decoder_bcd/` → Decodificador BCD a 7 segmentos
- `02_counter_bcd/` → Contador BCD con entrada de reloj, control Up/Down
- `03_pwm/` → Generador de señal PWM (Pulse Width Modulation)
- `04_password/` → Sistema de verificación de contraseña con teclado matricial
- `05_uart/` → Comunicación serial UART TX/RX
- `06_vga/` → Generación de señal VGA con patrón de prueba
- `07_acelerometro/` → Lectura e interpretación de datos de acelerómetro vía SPI/I2C
- `08_cam/` → Memoria CAM (Content Addressable Memory)

También un challenge:
- `09_challenge_frecuencimetro/` → Reto: Frecuencímetro digital con visualización

Y finalmente el examen, en el que se realizaron 2 prácticas:
- `10_rom/` → Examen final: Memoria ROM
- `11_cronometro/` → Examen final: Cronómetro controlado

## 🛠️ Herramientas utilizadas

- 🖥️ **Intel Quartus Prime**  
- 🔬 **ModelSim** para simulaciones  
- 📺 **DE10-Lite** FPGA Board  
- 💻 **Verilog HDL**  
- 🧪 **GTKWAVE / SignalTap** (para depuración)  
- 🧰 Periféricos: displays, teclado matricial, UART, acelerómetro, VGA, servos

## 📂 Estructura de cada práctica

/[nombre_practica]/
│
├── src/ → Código fuente en Verilog
├── sim/ → Testbenches y simulaciones
├── docs/ → Reporte o bitácora técnica
├── fpga/ → Archivos para programación en la FPGA
└── img/ → Diagramas, capturas de simulación o funcionamiento

