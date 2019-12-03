close all
clear


param = local_settings();
fs = param.fs;
songdir = param.songdir;

dir = param.dir;


audio = 'audio0';

%choose song
songname = fullfile(songdir,sprintf('%s.wma',audio));
song = audioread(songname);
songLength = length(song);
info = audioinfo(songname);

fid = fopen('length_song.txt','wt');
fprintf(fid,'%d\n',songLength);
fclose(fid);


% adicionando ruido
name_noise = fullfile(dir,'noise.wav');
noise = audioread(name_noise);
noiseLength = length(noise);



x = noise;

y = floor(songLength/noiseLength);
song_noise = zeros(y, 1);

for i = 1:y-1
    noise = horzcat(noise,x); %concatenando ruido
end
    
for i = 1:(songLength-noiseLength)-1
    song_noise(i) = [noise(i)]/5+song(i);%inserindo ruido
end

audiowrite('s_noise.wav', song_noise, fs);
