function param = local_settings()

% fill in these folders and save this file as local_settings.m
param.songdir = 'E:\Users\pgsr\Downloads\Projeto_Pronto-20191203T173920Z-001\Projeto_Pronto\songdir';
param.hashdir = 'E:\Users\pgsr\Downloads\Projeto_Pronto-20191203T173920Z-001\Projeto_Pronto\hashdir';
param.dir = 'E:\Users\pgsr\Downloads\Projeto_Pronto-20191203T173920Z-001\Projeto_Pronto';

param.fs = 8000;

% window length: 20 ms, but in samples
param.wlen = param.fs*0.02;
% overlap:
param.olen = param.wlen/2;

% define target window
param.t_mindelta = 1;
param.t_maxdelta = 20;
param.t_freqdiff = 10; % maximum difference in index
