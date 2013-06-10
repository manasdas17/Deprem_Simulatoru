function varargout = untitled2(varargin)
% UNTITLED2 M-file for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 08-Jun-2013 22:39:12

% Begin initialization code - DO NOT EDIT
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

imaqhwinfo
 
vid = videoinput('winvideo',2,'YUY2_352x288')
preview(vid);



% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
int sayac;
sayac = 0;
global liste;
global liste_sayac;
  saniye = str2num(get(handles.edit1,'String'));
    t = cputime;
    % for fadeValue=180:10:250
    while sayac < saniye + 1;

    int siddet;
    
    siddet = 140;
    
    a.analogWrite(9, siddet);
    
    if mod(liste_sayac,2) == 0
        liste(liste_sayac) =  siddet / 14;
    else
        liste(liste_sayac) =  -1 * siddet / 14;
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
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

saniye = str2num(get(handles.edit1,'String'));

global a;
int sayac;
sayac = 0;
 global liste_sayac;
 global liste
    
    % for fadeValue=180:10:250
    while sayac < saniye*2;

    int siddet;
    
    siddet = 180;
    
    a.analogWrite(9, siddet);
    
    if mod(liste_sayac,2) == 0
        liste(liste_sayac) =  siddet / 7;
    else
        liste(liste_sayac) =  -1 * siddet / 7;
    end
    liste_sayac = liste_sayac + 1;
    
    
    a.digitalWrite(11, 0)
    a.digitalWrite(2, 1)
    pause(0.2);
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 1)
    pause(0.2);
    sayac = sayac + 1;
    plot(liste)
    end
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

global a;
int sayac;
sayac = 0;
global liste;
global liste_sayac;
saniye = str2num(get(handles.edit1,'String'));   
    % for fadeValue=180:10:250
    while sayac < saniye + 1;

    int siddet;
    
    siddet = 255;
    
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
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)



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
    % for fadeValue=180:10:250
    while sayac < saniye + 1;

    int siddet;
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
