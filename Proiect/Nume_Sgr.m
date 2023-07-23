function varargout = Nume_Sgr(varargin)
% NUME_SGR MATLAB code for Nume_Sgr.fig
%      NUME_SGR, by itself, creates a new NUME_SGR or raises the existing
%      singleton*.
%
%      H = NUME_SGR returns the handle to a new NUME_SGR or the handle to
%      the existing singleton*.
%
%      NUME_SGR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUME_SGR.M with the given input arguments.
%
%      NUME_SGR('Property','Value',...) creates a new NUME_SGR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Nume_Sgr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Nume_Sgr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Nume_Sgr

% Last Modified by GUIDE v2.5 12-Mar-2019 08:45:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Nume_Sgr_OpeningFcn, ...
                   'gui_OutputFcn',  @Nume_Sgr_OutputFcn, ...
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


% --- Executes just before Nume_Sgr is made visible.
function Nume_Sgr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Nume_Sgr (see VARARGIN)

% Choose default command line output for Nume_Sgr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Nume_Sgr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Nume_Sgr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
