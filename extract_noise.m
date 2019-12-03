close all
clear

param = local_settings();
fs = param.fs;
hashdir = param.hashdir;
dir = param.dir;

wlen = param.wlen;
olen = param.olen;

load songnames.mat;
num_songs = length(songnames);
score = zeros(num_songs,1);

% fid = fopen('length_song.txt','rt');
% songLength = fscanf(fid,'%lf');
% fclose(fid);

maxSongLength = 20000000;

num_win = floor((maxSongLength-olen)/(wlen-olen));

% song + noise
songnoisename = fullfile(dir,'s_noise.wav');
s_noise = audioread(songnoisename);


%sample

sampsec = 5;
sampleLength = sampsec*fs;
sampleStart = 73829;  %floor(rand*(songLength-sampleLength-1)+1);

sampleSong = s_noise(sampleStart:sampleStart+sampleLength-1);



for s_ind = 1:num_songs,
    
    sname_i = strrep(songnames{s_ind},'.','_');
    hashname = fullfile(hashdir,sprintf('hashtable %s.mat',sname_i));
    
    load(hashname);
    
    score(s_ind) = trymatch(sampleSong,localhash,num_win);

end
 
fprintf('\n')
 
[maxscore,detected_songind] = max(score);
fprintf(1,'Detected song: %s\n',songnames{detected_songind});



