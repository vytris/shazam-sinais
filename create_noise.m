close all
clear

% creating and saving noise
param = local_settings();
fs = param.fs;

recObj = audiorecorder(fs, 8, 1);
recordblocking(recObj, 5);

noise = getaudiodata(recObj);

audiowrite('noise.wav', noise, fs);
