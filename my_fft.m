function [S, freq] = my_fft(s, fs)
    normal = length(s);
    aux = 0:normal-1;
    T = normal/fs;
    freq = aux/T;
    S = fftn(s)/normal;
    fc = ceil(normal/2);
    S = S(1:fc);
    
    figure();
    plot(freq(1:fc), abs(S));
    title('analise de espectro');
    xlabel('Frequencia (Hz)');
    ylabel('Amplitude');
end