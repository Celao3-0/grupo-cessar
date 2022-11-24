.global _ep0

_ep0:

    // posicoes na memoria genericas
    
    // inicializa numTentativas zerado
    sub t0, t0, t0
    
    // carrega o numero de tentativas
    lw t1, 16(t0);

    // carrega semente
    lw t2, 32(t0)
