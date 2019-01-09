function varargout = gui(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 09-Jan-2019 11:10:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in boton_selecciona_imagen.
function boton_selecciona_imagen_Callback(hObject, eventdata, handles)
% hObject    handle to boton_selecciona_imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, Path]=uigetfile({'*'},'Abrir Documento');
set(handles.InputImage,'String', Path +""+FileName)


% --- Executes on button press in boton_busca_Q.
function boton_busca_Q_Callback(hObject, eventdata, handles)
% hObject    handle to boton_busca_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, Path]=uigetfile({'*.mat'},'Abrir Documento');
set(handles.texto_matriz_Q,'String', Path +""+FileName)


% --- Executes on button press in boton_busca_T.
function boton_busca_T_Callback(hObject, eventdata, handles)
% hObject    handle to boton_busca_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, Path]=uigetfile({'*.mat'},'Abrir Documento');
set(handles.texto_matriz_T,'String', Path +""+FileName)

% --- Executes on button press in boton_busca_S.
function boton_busca_S_Callback(hObject, eventdata, handles)
% hObject    handle to boton_busca_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, Path]=uigetfile({'*.mat'},'Abrir Documento');
set(handles.texto_matriz_S,'String', Path +""+FileName)

% --- Executes on button press in boton_descifrar.
function boton_descifrar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_descifrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = get(handles.InputImage,'String');
image = strcat(image);
textQ = get(handles.texto_matriz_Q,'String');
textQ = strcat(textQ);
textT = get(handles.texto_matriz_T,'String');
textT = strcat(textT);
textS = get(handles.texto_matriz_S,'String');
textS = strcat(textS);
if isempty(image)
    f = errordlg('No se ha introducido una imagen','No file error');
elseif isempty(textQ) && isempty(textT)
    f = errordlg('No se han introducido los datos necesarios para desencriptar','No file error');
elseif isempty(textQ)
    f = errordlg('No se ha introducido los datos de la matriz Q','No file error');
elseif isempty(textT)
    f = errordlg('No se ha introducido los datos de la matriz T','No file error');
else
    image = load(image);
    Q = load(textQ);
    T = load(textT);
    S = load(textS);
    decryptedImage = decryptionBX(cell2mat(struct2cell(image)),cell2mat(struct2cell(T)),cell2mat(struct2cell(Q)),cell2mat(struct2cell(S)));
    w = msgbox('Proceso completado','Éxito');
end


% --- Executes on button press in boton_cifrar.
function boton_cifrar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cifrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = get(handles.InputImage,'String');
image = strcat(image);
if isempty(image)
    f = errordlg('No se ha introducido una imagen','No file error');
else
    cypherMIE_BX(image);
    w = msgbox('Proceso completado','Éxito');
end
