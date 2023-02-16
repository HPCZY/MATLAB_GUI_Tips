clear; close all; clc

addpath('C:\Users\ASUS\Desktop\GUI小技巧\4 自定义按钮图标')
GUI1()

function GUI1()

Fig = figure('Name','自定义图标','Position',[400,400,400,300],...    
    'color',[.9,.9,.9],'menu','none','NumberTitle','off');

BT1 = uicontrol(Fig,'style','pushbutton','String',[],...
        'Units','pixels','Position',[100,100,64,64]);
BT2 = uicontrol(Fig,'style','pushbutton','String',[],...
        'Units','pixels','Position',[300-64,100,64,64]);
    
% icon1 = imread('pause.jpeg');
% icon2 = imread('play.jpeg');
% 
% icon1 = imresize(icon1,[64,64]);
% icon2 = imresize(icon2,[64,64]);
% 
% icon1 = im2double(icon1);
% icon2 = im2double(icon2);
% 
% icon1(icon1>0.8) = NaN;
% icon2(icon2>0.8) = NaN;

icon1 = IconRead('pause.jpeg',[64,64],1);
icon2 = IconRead('play.jpeg',[64,64],1);

set(BT1,'CData',icon1)
set(BT2,'CData',icon2)
    
end
