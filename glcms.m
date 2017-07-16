clear all; close all; clc
%%%%%%%%%%%%%%

windowSize = 400;

stepSize = 25;


%%%%%%%%%%%%%%
rgbPicture = imread('haha.tif');
grayPicture=rgb2gray(rgbPicture);

[xPictureSize,yPictureSize]=size(grayPicture);

% window = zeros(windowSize); 
% contrast=zeros(xPictureSize,yPictureSize);

yy=1;

for y = 1: stepSize: yPictureSize-windowSize;
        xx=1;
    for x = 1: stepSize: xPictureSize-windowSize;
        window=grayPicture([x:x+windowSize-1],[y:y+windowSize-1]);
        glcmsMatrix = graycomatrix(window);
        
        glcmsStruct = graycoprops(glcmsMatrix);
        
        contrast(xx,yy)=glcmsStruct.Contrast;
        xx=xx+1;
        correlation(xx,yy)=glcmsStruct.Correlation;
        energy(xx,yy)=glcmsStruct.Energy;
        homogeneity(xx,yy)=glcmsStruct.Homogeneity;
        fprintf('x=%i out of %i, y=%i out of %i.\n',x,xPictureSize,y, yPictureSize)
    end
    yy=yy+1;
end

 save('contrast.mat','contrast','-v7.3');
  save('correlation.mat','correlation','-v7.3');
   save('energy.mat','energy','-v7.3');
    save('homogeneity.mat','homogeneity','-v7.3');

 