
function popupmenu1_Callback(hObject, eventdata, handles)
global A1
A1=get(handles.popupmenu1, 'value')
switch A1
    case 1
        A1=0;
    case 2
        A1=1;
    case 3
        A1=2;
    case 4
        A1=3;
    case 5
        A1=4;
    case 6
        A1=5;
end
semnal_didactic(handles)



function popupmenu2_Callback(hObject, eventdata, handles)
global A2
A2=get(handles.popupmenu2, 'value')
switch A2
    case 1
        A2=0;
    case 2
        A2=1;
    case 3
        A2=2;
    case 4
        A2=3;
    case 5
        A2=4;
    case 6
        A2=5;
end
semnal_didactic(handles)


function popupmenu3_Callback(hObject, eventdata, handles)
global A3
A3=get(handles.popupmenu3, 'value')
switch A3
    case 1
        A3=0;
    case 2
        A3=1;
    case 3
        A3=2;
    case 4
        A3=3;
    case 5
        A3=4;
    case 6
        A3=5;
end
semnal_didactic(handles)



function popupmenu4_Callback(hObject, eventdata, handles)
global Semnaldevizualizat
Semnaldevizualizat=get(handles.popupmenu4, 'value');
semnal_didactic(handles)


function semnal_didactic(handles)
global F1
global F2
global F3
global A1
global A2
global A3
global Semnaldevizualizat
global Filtru
global Suma
Fs=10000;
durata=1;
t=0: 1/Fs :durata;

S1=A1*sin(2*pi*F1*t);
S2=A2*sin(2*pi*F2*t);
S3=A3*square(2*pi*F3*t);
Suma=S1+S2+S3;
axaFFT=linspace(-Fs/2, Fs/2, length(Suma));
X=fftshift(abs(fft(Suma)));

%IMPLEMENTARE FTJ
Filtru=get(handles.TipFiltru, 'value');
switch Filtru
    case 1
        %IMPLEMENTARE FTJ
        Ft=str2double(get(handles.Ft1, 'String'));
        N=str2double(get(handles.Ordin1, 'String')); %ordinul filtrului
        h=zeros(1,N);
        %calcul coeficienti
        for n=-(N-1)/2 : (N-1)/2
            h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+(2*Ft/Fs)*sinc(2*n*Ft/Fs);
        end 
        %caracteristica ideala
        H_ideal(-Fs/2+Fs/2+1:-Ft+Fs/2+1) = 0;
        H_ideal(-Ft+Fs/2+1:Ft+Fs/2+1) = 1;
        H_ideal(Ft+Fs/2+1:Fs/2+Fs/2+1) = 0;

        %caracteristica de amplitudine (reala) a filtrului
        axaFFT11_real=linspace(-Fs/2, Fs/2, length(h));
        H_real=fftshift(abs(fft(h)));
        %filtrare semnnal si spectrul semnalului filtrat
        y1=conv(Suma,h);
        durata_y1=(length(y1)-1)/Fs;
        t_y1=0:1/Fs:durata_y1;
        axaFFT12_S=linspace(-Fs/2, Fs/2, length(y1));
        Y1=fftshift(abs(fft(y1)));
        
    case 2
        %IMPLEMENTARE FTS
        Ft=str2double(get(handles.Ft1, 'String'));
        N=str2double(get(handles.Ordin1, 'String')); %ordinul filtrului
        h=zeros(1,N);
        %calcul coeficienti
        for n=-(N-1)/2 : (N-1)/2
            h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft/Fs)*sinc(n*2*Ft/Fs);
        end
        %caracteristica ideala
        H_ideal(-Fs/2+Fs/2+1:-Ft+Fs/2+1) = 1;
        H_ideal(-Ft+Fs/2+1:Ft+Fs/2+1) = 0;
        H_ideal(Ft+Fs/2+1:Fs/2+Fs/2+1) = 1;
        %caracteristica de amplitudine (reala) a filtrului
        axaFFT21_real=linspace(-Fs/2, Fs/2, length(h));
        H_real=fftshift(abs(fft(h)));
        %filtrare semnnal si spectrul semnalului filtrat
        y2=conv(Suma,h);
        durata_y2=(length(y2)-1)/Fs;
        t_y2=0:1/Fs:durata_y2;
        axaFFT22_S=linspace(-Fs/2, Fs/2, length(y2));
        Y2=fftshift(abs(fft(y2)));
    case 3
        %IMPLEMENTARE FTB
        Ft1=str2double(get(handles.Ft11, 'String'));
        Ft2=str2double(get(handles.Ft21, 'String'));
        N=str2double(get(handles.Ordin1, 'String')); %ordinul filtrului
        h=zeros(1,N);
        %calcul coeficienti
        for n=-(N-1)/2 : (N-1)/2
            h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+(2*Ft2/Fs)*sinc(2*n*Ft2/Fs)-(2*Ft1/Fs)*sinc(2*n*Ft1/Fs);
        end
        %caracteristica ideala
        H_ideal(-Fs/2+Fs/2+1:-Ft1+Fs/2+1) = 0;
        H_ideal(-Ft2+Fs/2+1:-Ft1+Fs/2+1) = 1;
        H_ideal(-Ft1+Fs/2+1:Ft1+Fs/2+1) = 0;
        H_ideal(Ft1+Fs/2+1:Ft2+Fs/2+1) = 1;
        H_ideal(Ft2+Fs/2+1:Fs/2+Fs/2+1) = 0;

        %caracteristica de amplitudine (reala) a filtrului
        axaFFT31_real=linspace(-Fs/2, Fs/2, length(h));
        H_real=fftshift(abs(fft(h)));
        %filtrare semnnal si spectrul semnalului filtrat
        y3=conv(Suma,h);
        durata_y3=(length(y3)-1)/Fs;
        t_y3=0:1/Fs:durata_y3;
        axaFFT32_S=linspace(-Fs/2, Fs/2, length(y3));
        Y3=fftshift(abs(fft(y3)));
    case 4
        %IMPLEMENTARE FOB
        Ft1=str2double(get(handles.Ft11, 'String'));
        Ft2=str2double(get(handles.Ft21, 'String'));
        N=str2double(get(handles.Ordin1, 'String')); %ordinul filtrului
        h=zeros(1,N);
        %calcul coeficienti
        for n=-(N-1)/2 : (N-1)/2
            h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft2/Fs)*sinc(2*n*Ft2/Fs)+(2*Ft1/Fs)*sinc(2*n*Ft1/Fs);
        end
        %caracteristica ideala
        H_ideal(-Fs/2+Fs/2+1:-Ft1+Fs/2+1) = 1;
        H_ideal(-Ft2+Fs/2+1:-Ft1+Fs/2+1) = 0;
        H_ideal(-Ft1+Fs/2+1:Ft1+Fs/2+1) = 1;
        H_ideal(Ft1+Fs/2+1:Ft2+Fs/2+1) = 0;
        H_ideal(Ft2+Fs/2+1:Fs/2+Fs/2+1) = 1;
        %caracteristica de amplitudine (reala) a filtrului
        axaFFT41_real=linspace(-Fs/2, Fs/2, length(h));
        H_real=fftshift(abs(fft(h)));
        %filtrare semnnal si spectrul semnalului filtrat
        y4=conv(Suma,h);
        durata_y4=(length(y4)-1)/Fs;
        t_y4=0:1/Fs:durata_y4;
        axaFFT42_S=linspace(-Fs/2, Fs/2, length(y4));
        Y4=fftshift(abs(fft(y4)));
end



switch Semnaldevizualizat
    case 1
        plot(t,S1);
        title('Semnalul S1 in domeniul timp');
        xlabel('t');
        ylabel('Amplitudinea[V]');
        axis([0, 2*(1/F1), -6, 6]);
        zoom on
    case 2
        plot(t,S2);
        title('Semnalul S2 in domeniul timp');
        xlabel('t');
        ylabel('Amplitudinea[V]');
        axis([0, 2*(1/F2), -6, 6]);
        zoom on
    case 3
        plot(t,S3);
        title('Semnalul S3 in domeniul timp');
        xlabel('t');
        ylabel('Amplitudinea[V]');
        axis([0, 2*(1/F3), -6, 6]);
        zoom on
    case 4
        plot(t,Suma);
        title('S1+S2+S3 in domeniul timp');
        xlabel('t');
        ylabel('Amplitudinea[V]');
        zoom on
    case 5
        plot(axaFFT,X);
        title('Spectrul sumei S1+S2+S3');
        xlabel('f');
        ylabel('Amplitudinea[V]');
        zoom on
    case 6
        switch Filtru
            case 1
                cla
                hold on
                plot(axaFFT11_real,H_real,'r');
                plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
                hold off
            case 2
                cla
                hold on
                plot(axaFFT21_real,H_real,'r');
                plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
                hold off
            case 3
                cla
                hold on
                plot(axaFFT31_real,H_real,'r');
                plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
                hold off
            case 4
                cla
                hold on
                plot(axaFFT41_real,H_real,'r');
                plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
                hold off
        end
        zoom on
    case 7
        switch Filtru
            case 1
                plot(t_y1, y1);
            case 2
                plot(t_y2, y2);
            case 3
                plot(t_y3, y3);
            case 4
                plot(t_y4, y4);
        end
        zoom on
    case 8
        switch Filtru
            case 1
                plot(axaFFT12_S, Y1);
            case 2
                plot(axaFFT22_S, Y2);
            case 3
                plot(axaFFT32_S, Y3);
            case 4
                plot(axaFFT42_S, Y4);
        end
        zoom on
        
end
            



function semnal_audio(handles)
RedareSunetOriginal=get(handles.SemnalOriginal, 'Value');
Fs=44100;
[Sunet, Fs]=audioread('SemnalDistorsionat.wav');

axaFFT=linspace(-Fs/2, Fs/2, length(Sunet));
X=fftshift(abs(fft(Sunet)));
SpectruSOrig=get(handles.SpectruSemnalOriginal, 'Value');
SpectruSFiltrat=get(handles.SpectruSemnalFiltrat, 'Value');
SunetFiltrat=get(handles.SemnalFiltrat, 'Value');
N=5000;

Ft11=1000;
Ft12=1200;
h=zeros(1,N);

for n=-(N-1)/2 : (N-1)/2
      h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft12/Fs)*sinc(2*n*Ft12/Fs)+(2*Ft11/Fs)*sinc(2*n*Ft11/Fs);
end
y1=conv(Sunet,h);

Ft21=3800;
Ft22=4200;
h=zeros(1,N);

for n=-(N-1)/2 : (N-1)/2
      h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft22/Fs)*sinc(2*n*Ft22/Fs)+(2*Ft21/Fs)*sinc(2*n*Ft21/Fs);
end
y2=conv(y1,h);

axaFFTSunet=linspace(-Fs/2, Fs/2, length(y2));
Y=fftshift(abs(fft(y2)));
     

if RedareSunetOriginal==1
    sound(Sunet, Fs);
end

if SpectruSOrig==1
    plot(axaFFT,X);
    title('Spectrul semnalului original');
    xlabel('f');
end
    
if SpectruSFiltrat==1
    plot(axaFFTSunet, Y);
    title('Spectrul semnalului filtrat');
    xlabel('f');
end

if SunetFiltrat==1
    sound(y2, Fs);
end

    
zoom on

