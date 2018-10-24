a= audioread('orig_input.wav');
fs=44100;
t = 0 : 1/fs :3; 
%---- tao cac tin hieu giai dieu----
Rs = sin(2*pi*.0000*.5); 
C = sin(2*pi*130.82*t);
G = sin(2*pi*196*t);
E = sin(2*pi*164.81*t);
%tao nen giai dieu
y = [C G E Rs C];
x2=a(1:length(y));
%melody
melody = y+2*x2;
%xuat file melody.wav
audiorecorder('melody.wav',melody,44100);
%----------------FFT-----
N = fs;
transform = fft(melody,N)/N;
magTransform = abs(transform);

faxis = linspace(-fs/2,fs/2,N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency (Hz)')
title('FFT of Melody')
%-------------Spectrogram----
win = 128; 
hop = win/2;            

nfft = win; 
spectrogram(y,win,hop,nfft,fs,'yaxis')
 

