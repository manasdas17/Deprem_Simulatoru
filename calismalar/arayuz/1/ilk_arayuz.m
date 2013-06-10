function varargout = ilk_arayuz(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ilk_arayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @ilk_arayuz_OutputFcn, ...
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
function ilk_arayuz_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);
% -------------------------

clear all;
global a;
a = arduino('COM5');
a.pinMode(2,'output');

a.pinMode(11,'output');
a.pinMode(13, 'output');
a.digitalWrite(13, 1);

% -------------------------


function varargout = ilk_arayuz_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% -------------------------

function pushbutton1_Callback(hObject, eventdata, handles)

global a;
 int fadeValue;
 sayac = 0;
    
    % for fadeValue=180:10:250
    while sayac < 10;
    a.analogWrite(9, 200);
    
    a.digitalWrite(11, 0)
    a.digitalWrite(2, 1)
    pause(0.2);
    a.digitalWrite(2, 0)
    a.digitalWrite(11, 1)
    pause(0.2);
    sayac = sayac + 1;
    end
a.digitalWrite(2, 0)
a.digitalWrite(11, 0)
