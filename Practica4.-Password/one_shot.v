// módulo de one shot que detecta flanco de subida en la señal de entrada
module one_shot(
    input clk,
    input button_a,
    output reg button_one_shot
);
    // registro auxiliar para almacenar el valor anterior
    reg delay_b;
    
    // proceso secuencial en cada flanco de subida del reloj
    always @(posedge clk)
    begin
        delay_b <= button_a;  // almacena el valor actual para el siguiente ciclo
        
        if((delay_b == 0) && (button_a == 1))  // detecta flanco de subida
            button_one_shot <= 1;
        else
            button_one_shot <= 0;
            
        // alternativa usando operadores lógicos:
        // button_one_shot <= ((delay_b ^ button_a) & button_a);
    end
    
endmodule