function varargout = analog_input_arayuz(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analog_input_arayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @analog_input_arayuz_OutputFcn, ...
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
function analog_input_arayuz_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);


clear all;
global a;
a = arduino('COM5');

function varargout = analog_input_arayuz_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
sayac = 0;
global a;
while (1)
    sayac = sayac + 1;
t = a.analogRead(8)
pause(0.1);
liste(sayac) = t;
plot(liste);
end
