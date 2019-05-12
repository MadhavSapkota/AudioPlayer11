function varargout = MusicPlayerS(varargin)


% MUSICPLAYERS MATLAB code for MusicPlayerS.fig
%      MUSICPLAYERS, by itself, creates a new MUSICPLAYERS or raises the existing
%      singleton*.
%
%      H = MUSICPLAYERS returns the handle to a new MUSICPLAYERS or the handle to
%      the existing singleton*.
%
%      MUSICPLAYERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSICPLAYERS.M with the given input arguments.
%
%      MUSICPLAYERS('Property','Value',...) creates a new MUSICPLAYERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MusicPlayerS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MusicPlayerS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MusicPlayerS

% Last Modified by GUIDE v2.5 26-Dec-2018 22:30:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MusicPlayerS_OpeningFcn, ...
                   'gui_OutputFcn',  @MusicPlayerS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MusicPlayerS is made visible.
function MusicPlayerS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MusicPlayerS (see VARARGIN)

% Choose default command line output for MusicPlayerS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MusicPlayerS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MusicPlayerS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
%function slider1_Callback(hObject, eventdata, handles)
%Pause audioplayer



%guidata(hObject,handles);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
%function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
%if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   % set(hObject,'BackgroundColor',[.9 .9 .9]);
%end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
clear all;
playersound




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%power = 0.5;
%x = -1.0:0.01:1.0;   % equally spaced numbers between -1 and 1
%plot(sign(x).*abs(x).^power)
%disp('Plotting scale function.');

%disp('Hit any key to continue ...');
%pause



%https://www.mathworks.com/help/matlab/ref/listdlg.html#mw_7ac3a717-c0cd-472d-969b-0fb09b7f2674
ls;
clc;
clear all;
%fn = {d.name};
%filename = uigetfile('*.*');
list = ls(uigetfile({'*.*'}));

format_list = [
 {'04 - Chal Mere Ghar - DownloadMing.SE.mp3'}, ....
 {'guitar.wav'},  ...
 {'lost_in_euroland.wav'}, ...
 {'partytrain.wav'},  ...
 {'Suney khabar.mp3'}...
 {'Mohani.mp3'}....
 {'kabhi.mp3'}....
 {list}...
 {'underground_scene.wav'}];
    


    
[selection,was_OK] = listdlg('PromptString','Select a file:',...
                          'ListSize',[250,200], 'SelectionMode','multiple',...
                           'ListString',format_list);
                       
% filename = uigetfile('*.wav*');
global x; %Making x global
[y,Fs]=audioread(list);
save madhav.mat
x = audioplayer(y,Fs);
disp('Playing at the original sample rate.');
play(x);
size(list);
length(y);
whos y;
whos Fs;
TotalTime = length(y)./Fs;
t = 0:TotalTime/(length(y)):TotalTime-TotalTime/length(y);
plot(t,y);



%disp('Playing at the original sample rate.');
%sound(y,Fs);



                   
                       
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%https://www.mathworks.com/help/matlab/ref/questdlg.html
answer = questdlg('Are you sure to exit?','ExitButton');
% Handle response
switch answer
    case 'Yes'
        %disp([answer 'Thanks for being here right up.'])
        close all;
        clear all;
        clc;
    case 'No'
        %disp([answer 'Thanks for staying here'])
        
    
      
end






% --- Executes on button press in pushbutton4.
function pushbutton4_Callback (hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%% load some audio data (available with MATLAB)
clear sound;
global x;
pause(x);%Pausing sound

%---------------------------------
%x = wavread('D:\\Sample.wav');
%filename = uigetfile('G:\Year3\MediaTechnology\Assignment\Mohani.mp3');
%k = audioread(filename);
%disp(k);
%[y,Fs] = audioread(k);
%double t;
%t = resample(k,5,1);
%p = audioplayer(t);
%soundsc(t);
%sound(t);


%------------------------------------




%For the read functionality
%https://www.music.mcgill.ca/~gary/307/matlab/wavinout.m
function player=playersound
%My Function
global x;
global filename;
filename = uigetfile('*.*');
[y,Fs]=audioread(filename);
save madhav.mat
x = audioplayer(y,Fs);
disp('Sound Plays.');
play(x);





%https://www.mathworks.com/matlabcentral/answers/303114-plotting-wav-sound-file-onto-graph
%[Brendon Zotto,Plotting sound wave into graphs 2016]. 
size(filename);
length(y);
whos y;
whos Fs;
TotalTime = length(y)./Fs;

t = 0:TotalTime/(length(y)):TotalTime-TotalTime/length(y);
plot(t,y);



%player=audioplayer(y,Fs); 
%playblocking(player)

%For the write Functionality
function writer=writedata
%My Function
filename = uigetfile('*.*');
%audiowrite('handel1.wav',y,Fs);
audiowrite(filename,y,Fs);
[y,Fs]=audioread(filename);
sound(y,Fs);



%clear y Fs  


% --- Executes on slider movement.
%function slider2_Callback(hObject, eventdata, handles)



% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints:
%returns position of slider
%--------
%global filename;

%[y,Fs]=audioread(filename);
%handles.myPlayer=audioplayer(y*Volume,Fs);
%Fs = 44100;
%duration = 2.0;

%numberOfSamples = Fs * duration;
%samples = (1:numberOfSamples) / Fs;

%-----------------

%slider_val = get(hObject, 'Value');

%if slider_val == get(hObject,'Max')
 %   s = sin(2 * pi * freq * samples);
 %   sound(s, Fs);
   
%elseif slider_val == get(hObject,'Min')
 %   s2 = 0.5*sin(2*pi*freq*samples);
   % sound(s2,Fs);
   
%end

%----------------------

%get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%pause(handles.myPlayer);

%Know how far the user has got in the sample

%NewStart=get(handles.myPlayer,'CurrentSample')+1;

%stop current player

%stop(handles.myPlayer);

%Reload your sample


% --- Executes during object creation, after setting all properties.
%function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%global filename;

%[y,Fs]=audioread(filename);
%handles.slider = uicontrol('Style','slider','Position',[50 50 400 20],'Min',0,'Max',1,'Value',.5);
%handles.Listener = addlistener(handles.slider,'Value','PostSet',@(s,e) GetValue(handles));

%hSlider = controllib.widget.Slider(gcf, [200,500,100,50], 5:25);
%myCallback = @(h,e) disp(h.Value);  % as an example
%addlistener(hSlider, 'ValueChanged', myCallback);





%Create a new sample by cutting x and keeping only the lines from NewStart 
%to the end

%x=x(NewStart:end,:); 

%Get the value of the slider

%Volume=get(handles.slider2,'value');

%Set new audioplayer

%handles.myPlayer=audioplayer(x*Volume,Fs);

%Play

%play(handles.myPlayer);


% save handles structure

%guidata(hObject,handles);


% Hint: slider controls usually have a light gray background.



%if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
 %   set(hObject,'BackgroundColor',[.9 .9 .9]);
  %  controllib.widget.Slider(gcf, [10,10,100,50], 5:25)
%end


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
%hSlider = controllib.widget.Slider(gcf, [200,500,100,50], 5:25);
%myCallback = @(h,e) disp(h.Value);  % as an example
%addlistener(hSlider, 'ValueChanged', myCallback);
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
 

% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
          
           

           %save madhav.mat
           %filename = uiget('*.');
           %filename = uigetfile('*.*');
          
           %[y,Fs]=audioread(filename);
          %[y,Fs] = audioread(filename);
          
      %slider_val = get(hObject, 'Value');
      %disp(get(hObject,'Value'));
      %k = slider_val;
      %soundsc(y*k, Fs);
         % x = audioplayer(y*k,Fs);
         % player = audioplayer(x,Fs*k);
          %play(x);
          
          %load(MusicPlayerS,madhav.mat);
           load madhav.mat;
            slider_val = get(hObject, 'Value');
             %disp(get(hObject,'Value'));
              k = slider_val;
              x = y*k; % Decrease volume
              sound(x, Fs);
              %player = audioplayer(x, Fs);
              %play(player,[1 (get(player, 'SampleRate')*3)]);
              %x = y*3; % Increase volume
              %player = audioplayer(x, Fs); 
            %  play(player,[1 (get(player, 'SampleRate')*3)]);
          
              

%y_temp=y;
%disp(get(hObject,'Value'));
%if(get(hObject,'Value')==0)
 %  y_temp=0;
%else
 %   y_temp=(get(hObject,'Value')/10)*y;
%end
%pl=audioplayer(y_temp,f);
%resume(pl);

%global filename;
%[y,Fs] = audioread(filename);


%----------------------------------------
    
        %load handle;
    
%global filename;
       
     %[x,Fs]= audioread('G:\Year3\MediaTechnology\Assignment\Sune Khabar.mp3');
    %if slider_val <= 0.4778
         
    %load(MusicPlayerS,z);
         %slider_val = get(hObject, 'Value');
         %disp(get(hObject,'Value'));
         %k = slider_val;
        % player = audioplayer(y,Fs*k);
         %[loudness,loudnessRange] = integratedLoudness(x,Fs);
         %volume = [loudness*k,loudnessRange];
         %player = audioplayer(volume*Fs);
         
          %global x;
          
          %-------------------------------------------
           
    % filename = uigetfile('*.wav*');
            %global x;
            %[y,Fs]=audioread(list);
            %x = audioplayer(y,Fs);
            %disp('Playing at the original sample rate.');
            %play(x);
          %global filename;
          %load handel;
          %global x;
         
          
         
         %--------------------------------------------------
        
        %load handel; % 'handel' is a MAT-file which is shipped with MATLAB as an example
        %x = y/5; % Decrease volume
        %player = audioplayer(x, Fs);
       % play(player,[1 (get(player, 'SampleRate')*3)]);
       % x = y*5; % Increase volume
       % disp(x);
        %player = audioplayer(x, Fs); 
        %play(player,[1 (get(player, 'SampleRate')*3)]);
        %-----------------------------------------------------
        
         
          
         % [y,Fs] = audioread(filename,samples)
          % y1 = Fs;
          %vol= db2mag(1);
          %y=vol*sin(2*pi*f*tt);
          % soundsc( y, fs );
          
           
          % soundsc(player,Fs);
           %play(player);
           %guidata(hObject,handles);
         % play(player,[1 (get(player, 'SampleRate')*3)]);
          
   
%x = 0; % Decrease volume
    %@leftchannel = y1(:,1);
    %@firstcut = leftchannel(Fs*6:Fs*7)*20;
    %player = audioplayer(x, Fs);
    %play(player,[1 (get(player, 'SampleRate')*3)]);
    %z=y/10;
   % m=y*3;
  % sound(m, Fs);
%@sound(firstcut, Fs);
    
   

    %if slider_val >= 0.4778
    %slider_val = get(hObject, 'Value');
    %@disp(get(hObject,'Value'));
   %[y1,Fs]= audioread('G:\Year3\MediaTechnology\Assignment\Sune Khabar.mp3');
   %m=y1*3;
   %@y1 = 0;
   %@sound(y1, Fs);
   % Fs = get('SampleRate')/TotalSample;
  
   
    %play(player,[1 (get(player, 'SampleRate')*10)]);
   

   
    
%if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
 %   set(hObject,'BackgroundColor',[.9 .9 .9]);
%end



% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
%h lider
%load handel; % 'handel' is a MAT-file which is shipped with MATLAB as an example


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%resume(audioplayer);
global x;
resume(x);%Resuming data load



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles,varargin)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global filename;
%filename = uigetfile('*.*');
%[y,Fs]=audioread(filename);
%x = audioplayer(y,Fs);
%disp('Playing at the original sample rate.');
%play(x);

%----------------------------

%filename=uigetfile('*.*');
%[y,Fs] = audioread(filename);

%handles.playlist=[];
%p=get(handles.playlist,'String');
%p{length(p)+1}=y;
%set(handles.playlist,'String',p);
%handles.playfiles{length(handles.playfiles)+1}=[Fs '\' y];
%guidata(hObject,handles);

%-----------------------------------


function pladd_Callback(hObject, eventdata, handles,varargin)
% hObject    handle to pladd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 
 %state=get(handles.button1, 'Value');
 % global filename;
  %[y,Fs] = audioread(filename);  
  


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%For the fast play
load madhav.mat;
soundsc(y, 2*Fs);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%For the slow play
load madhav.mat;
soundsc(y, Fs/2);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%For mixing property]


[y,fs]=audioread('G:\Year3\MediaTechnology\Assignment\Sune Khabar.mp3');
 [z,fs]=audioread('G:\Year3\MediaTechnology\Assignment\Kabhi.mp3');
  ny=length(y);
  nz=length(z);
  N=min([ny nz]);
  Y=y(1:N);
  Z=z(1:N);
  signal=Y+Z;
  sound(signal);
  audiowrite('MixFile1.wav',y,fs);
  
  
 length(signal);
whos signal;
whos fs;
TotalTime = length(signal)./fs;

t = 0:TotalTime/(length(signal)):TotalTime-TotalTime/length(signal);
plot(t,signal);
  
  %[Youssef Khmou. 2013,i am adding two sound waves. i am receiving an error : ??? Error using ==> plus Matrix dimensions must agree. how i can add these two waves?]. 
  
  
%https://www.mathworks.com/matlabcentral/answers/71016-i-am-adding-two-sound-waves-i-am-receiving-an-error-error-using-plus-matrix-dimensions-mu?s_tid=answers_rc1-3_p3_Topic  
  
  


%[x,Fs]= audioread('G:\Year3\MediaTechnology\Assignment\Sune Khabar.mp3'); 
%[y,Fs]= audioread('G:\Year3\MediaTechnology\Assignment\Kabhi.mp3'); 
%y1 = [x; y];
%player(y1,Fs)





%player = audioplayer(k*x,Fs); %audiofile read
%play(player);






% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
%if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    %set(hObject,'BackgroundColor',[.9 .9 .9]);
%end





% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%For adding volume

load madhav.mat;
 global z ;
 z = y*2;
  sound(z, Fs);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%For decreasing volume
 load madhav.mat;
 global p;
 p = y/2;
 sound(p, Fs);
 
 
 % --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load handel;
%load madhav.mat;

%z1 = [handel,madhav.mat];
%z = cat(2,handel,madhav.mat);
%soundsc(z);

