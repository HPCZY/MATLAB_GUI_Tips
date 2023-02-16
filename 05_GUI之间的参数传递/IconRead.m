
function icon = IconRead(filename,buttonshape,opacity)

if nargin<3 % number of input arguments
    opacity = 0;
end
% ��ͼ
icon = imread(filename);
% �ĳߴ�
if ~isempty(buttonshape)
    icon = imresize(icon,buttonshape);
end
% ת��ʽ
icon = im2double(icon);

% ͸��
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
