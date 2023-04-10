clear; close all; clc

%% 准备图像
folderPath = 'C:\Users\ASUS\Desktop\20230402\图片';
fileList = dir(fullfile(folderPath,'*.jpg'));
fileList = {fileList.name};

imgNum = length(fileList);
imgList = cell(imgNum,1); % （cell格式）
for n = 1:imgNum
    imgList{n} = imread(fullfile(folderPath,fileList{n}));
end

% 请使用自己的数据集（cell格式），然后调用下面的函数。
%% 显示
GUIfig(imgList)







