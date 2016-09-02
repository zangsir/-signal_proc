%from CM book page 224 subtractive synthesis
fs = 44100;
x = rand (fs,1);
%sound(x,fs);
x = x - mean(x);
% make random noise
% take out DC
% make band-pass filter using LPF and BPF
[b1, a1] = butter (10, 0.5);
[b2, a2] = butter (10, 0.4, 'high');
% filter using above coefficients
y1 = filter (b1,a1,x);
y2 = filter (b2,a2,y1);
% envelope the filtered signal
env = 1./exp ((0:(length(y2)-1))/fs).^10;
% play the signal
sound (env'.* y2, fs)