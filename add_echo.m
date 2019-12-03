close all
clear

param = local_settings();
songdir = param.songdir;
fs = param.fs;


audio = 'audio2';

%choose song
songname = fullfile(songdir,sprintf('%s.wma',audio));
song = audioread(songname);
songLength = length(song);


% apply echo
delay   = 0.5;
ds = floor(fs*delay);

signal = zeros(songLength+ds,1);
signal(1:songLength)=song;
echo_signal =zeros(songLength+ds,1);
echo_signal(ds+(1:songLength))=song;
echo_song= signal + echo_signal;

audiowrite('echo_song.wav', echo_song, fs);