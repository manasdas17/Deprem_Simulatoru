function varargout = untitled2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


clear all;

global il;
global il2;
il = 'kocaeli.txt';
il2 = 'kocaeli.txt';


global a;
global liste;
liste = [-10.0000   10.0000  -10.0000   10.0000  -10.0000   25.7143  -25.7143   25.7143  -25.7143  25.7143  -25.7143   25.7143  -10.0000   10.0000  -10.0000   10.0000  -10.0000   51.0000 -51.0000   51.0000  -51.0000   51.0000  -51.0000   51.0000  -51.0000   10.0000  -10.0000 10.0000  -10.0000   10.0000  -10.0000   51.0000  -51.0000   51.0000  -51.0000   25.7143 -25.7143   25.7143  -25.7143   25.7143  -25.7143   25.7143  -25.7143   25.7143  -25.7143 51.0000  -51.0000   51.0000];
global liste_sayac;
liste_sayac = 50;

a = arduino('COM5');
a.pinMode(2,'output');

a.pinMode(11,'output');
a.pinMode(13, 'output');
a.digitalWrite(13, 1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

global a;
int sayac;
sayac = 0;
global liste;
global liste_sayac;

    siddet = str2num(get(handles.edit2,'String'));   
    saniye = str2num(get(handles.edit3,'String')); 
    siddet = (siddet * 16) + 64
    
    while sayac < saniye + 1;
    
    a.analogWrite(9, siddet);
    
    if mod(liste_sayac,2) == 0
        liste(liste_sayac) =  siddet / 5;
    else
        liste(liste_sayac) =  -1 * siddet / 5;
    end
    liste_sayac = liste_sayac + 1;
    
    a.digitalWrite(11, 0)
    a.digitalWrite(2, 1)
    pause(0.2);
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 1)
    pause(0.2);
    sayac = sayac + 1;
    plot(liste);
    end
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)


% --- Executes on button press in pushbutton2.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)







function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)

global a;
int sayac;
sayac = 0;
global liste;
global liste_sayac;
 
saniye = str2num(get(handles.edit4,'String'));
    % for fadeValue=180:10:250
    while sayac < saniye + 1;

    siddet = get(hObject, 'Value');
    siddet = (siddet * 130) + 70
    siddet = int16(siddet)

    a.analogWrite(9, siddet);

    if mod(liste_sayac,2) == 0
        liste(liste_sayac) =  siddet / 5;
    else
        liste(liste_sayac) =  -1 * siddet / 5;
    end
    liste_sayac = liste_sayac + 1;
    
   a.digitalWrite(11, 0)
    a.digitalWrite(2, 1)
    pause(0.3);
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 1)
    pause(0.3);
    sayac = sayac + 1;
    plot(liste);
    end
    
    a.digitalWrite(2, 1)
    a.digitalWrite(11, 0)
    pause(0.1);    
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
vid = videoinput('winvideo',2,'YUY2_640x480')
    vid.FramesPerTrigger = 1;
    vid.ReturnedColorspace = 'rgb';
    triggerconfig(vid, 'manual');
    vidRes = get(vid, 'VideoResolution');
    imWidth = vidRes(1);
    imHeight = vidRes(2);
    nBands = get(vid, 'NumberOfBands');
    hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axes2);
    preview(vid, hImage);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

[filename pathname] = uigetfile({'*.txt'}, 'Dosya Seç');
fullpathname = strcat(pathname, filename);
text = fileread(fullpathname);
set(handles.text6, 'String', fullpathname);
set(handles.text4, 'String', text);


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popupmenu1_Callback(hObject, eventdata, handles)

global il;

val = get(hObject,'value');

switch val

case 1
    il = 1 ;

case 2
    il = 2;

end

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popupmenu2_Callback(hObject, eventdata, handles)

global il2;

val = get(hObject,'value');

switch val


case 1
    il2 = 1 ;

case 2
    il2 = 2;
    
end




function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function pushbutton11_Callback(hObject, eventdata, handles)
global a;
global il;
global il2;
int sayac;
sayac = 0;
global liste;
global liste_sayac;

int dosya_sirasi;
dosya_sirasi = 1;
% global il;


if (il == 1) & (il2 == 1)
    dosya = fopen('kocaeli_kocaeli.txt' ,'r');
     [b , sayi] = fscanf(dosya, '%f', inf);
    b_dosya = b;

end

if (il == 2) & (il2 == 2)
    disp('2222222222222')
    dosya = fopen('duzce_duzce.txt' ,'r');
     [b , sayi] = fscanf(dosya, '%f', inf);
    b_dosya = b;

end

if (il == 1) & (il2 == 2)
    dosya = fopen('kocaeli_duzce.txt' ,'r');
     [b , sayi] = fscanf(dosya, '%f', inf);
    b_dosya = b;

end

if (il == 2) & (il2 == 1)
    dosya = fopen('duzce_kocaeli.txt' ,'r');
     [b , sayi] = fscanf(dosya, '%f', inf);
    b_dosya = b;

end



    saniye = 3;

    while sayac < sayi - 1;

        if b(dosya_sirasi) > 0
     
 while b(dosya_sirasi) < 1
    b(dosya_sirasi) = b(dosya_sirasi) * 10;
 end
 else
     b(dosya_sirasi) = b(dosya_sirasi) * -1;
      while b(dosya_sirasi) < 1
    b(dosya_sirasi) = b(dosya_sirasi) * 10;
      end
 end

 b(dosya_sirasi) = b(dosya_sirasi)/10

if (0.1 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.2)
    siddet = 80
elseif (0.2 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.3)
    siddet = 95
elseif (0.3 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.4)
    siddet = 110
elseif (0.4 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.5)
    siddet = 125
elseif (0.5 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.6)
    siddet = 140
elseif (0.6 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.7)
    siddet = 155
elseif (0.7 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.8)
    siddet = 170
elseif (0.8 < b(dosya_sirasi)) & (b(dosya_sirasi) < 0.8)
    siddet = 185
elseif (0.9 < b(dosya_sirasi)) & (b(dosya_sirasi) < 1)
    siddet = 200
end
  
    a.analogWrite(9, siddet);
  
    if mod(liste_sayac,2) == 0
        liste(liste_sayac) =  siddet / 5;
    else
        liste(liste_sayac) =  -1 * siddet / 5;
    end
    liste_sayac = liste_sayac + 1;
    
    a.digitalWrite(11, 0)
    a.digitalWrite(2, 1)
    pause(0.3);
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 1)
    pause(0.3);
    sayac = sayac + 1;
    plot(liste);
    dosya_sirasi = dosya_sirasi + 1;
     
    end
    
    a.digitalWrite(2, 1)
    a.digitalWrite(11, 0)
    pause(0.1);    
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 0)
