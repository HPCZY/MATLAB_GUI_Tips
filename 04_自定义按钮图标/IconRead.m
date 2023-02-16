
function icon = IconRead(filename,buttonshape,opacity)

if nargin<3 % number of input arguments
    opacity = 0;
end
% 读图
icon = imread(filename);
% 改尺寸
if ~isempty(buttonshape)
    icon = imresize(icon,buttonshape);
end
% 转格式
icon = im2double(icon);

% 透明
if opacity
    R = icon(:,:,1);
    G = icon(:,:,2);
    B = icon(:,:,3);
    bgR = R(1,1);
    bgG = G(1,1);
    bgB = B(1,1);   
    mask = R==bgR & G==bgG & B==bgB;
    R(mask) = NaN;
    G(mask) = NaN;
    B(mask) = NaN; 
    icon = cat(3,R,G,B);
end

end
