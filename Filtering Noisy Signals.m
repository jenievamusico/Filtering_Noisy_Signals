% Filter Design for a Noisy Sinusoid Signal

t = 0:0.001:1;
t_count = length(t);
x = sin(2*pi*10*t);
n = 0.5*randn(1,t_count);

x_n = x + n;

% lowpass filter for filtering out noise

x_f = lowpass(x_n,0.001);

figure
subplot(4,2,1);
plot(t,x);
title('Sinusoid: x(t)');
ylabel('x(t)');
xlabel('Time (s)');

subplot(4,2,2);
plot(t,n);
title('Noise: n(t)');
ylabel('n(t)');
xlabel('Time (s)');

subplot(4,2,3);
plot(t,x_n);
title('Sinusoid with noise: x_n(t)');
ylabel('x_n(t)');
xlabel('Time (s)');

subplot(4,2,4);
plot(t,x_f);
title('Sinusoid with noise filtered: x_f(t)');
ylabel('x_f(t)');
xlabel('Time (s)');

% frequency spectrum

FT_x = abs(fft(x));
FT_x_n = abs(fft(x_n));
FT_x_f = abs(fft(x_f));

subplot(4,2,5);
plot(t,FT_x);
title('Fourier Transform of x(t)');
ylabel('x(t)');
xlabel('Time (s)');

subplot(4,2,6);
plot(t,FT_x_n);
title('Fourier Transform of x_n(t)');
ylabel('x_n(t)');
xlabel('Time (s)');

subplot(4,2,[7,8]);
plot(t,FT_x_f);
title('Fourier Transform of x_f(t)');
ylabel('x_f(t)');
xlabel('Time (s)');
