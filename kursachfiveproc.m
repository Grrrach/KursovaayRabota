function varargout = kursachfiveproc(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kursachfiveproc_OpeningFcn, ...
                   'gui_OutputFcn',  @kursachfiveproc_OutputFcn, ...
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



function kursachfiveproc_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);
function varargout = kursachfiveproc_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function popupmenu1_Callback(hObject, eventdata, handles)


set(handles.text9, 'Visible' ,'on');

set(handles.uitable1, 'Visible' ,'on');
n=get(hObject,'Value');
Dat=zeros(n+1,n+1);
A=true(1,n+2);
set(handles.uitable1,'Data',Dat,'ColumnEditable',A);

set(handles.uitable2, 'Visible', 'on');
Dat=zeros(n+1,1);
C=true(1,n+2);
set(handles.uitable2,'Data',Dat,'ColumnEditable',C)


function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
n=get(handles.popupmenu1,'Value');
A=get(handles.uitable1,'Data');
C=get(handles.uitable2,'Data');
r=rank([A C]);
R=rank(A);
d=n+1;

if  r<d;
    errordlg('Система линейно зависима', 'Ошибка ввода');
    set(handles.text2,'String','Повторите ввод', 'Visible', 'On');
else
    if R<d;
       errordlg('Система вырождена', 'Ошибка ввода'); 
       set(handles.text2,'String','Повторите ввод', 'Visible', 'On');
    else
    x=A\C;
    q = transpose(x);
    set(handles.text2,'String',num2str(q), 'Visible', 'On');
    end
end

function pushbutton2_Callback(hObject, eventdata, handles)
msgbox({'Вас приветствует программа для решения СЛАУ',' ',...
       'Данная программа имеет следующие особенности:',' ',...
       '- решение СЛАУ не более чем из шести уравнений;',...
       '- обход ячеек осуществляется при помощи клавиши Tab;',...
       '- для перехода между матрицами используйте двойной щелчек.'...
          }, 'Помощь', 'none');

