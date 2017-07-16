clear all; close all; clc
contrast =  loadSingleVariableMATFile('contrast.mat');
correlation =  loadSingleVariableMATFile('correlation.mat');
energy =  loadSingleVariableMATFile('energy.mat');
homogeneity =  loadSingleVariableMATFile('homogeneity.mat');  
 filename = 'contrast.png';

contrast=contrast(2:end,2:end-1);
correlation=correlation(2:end-1,2:end-1);
energy=energy(2:end-1,2:end-1);
%homogeneity=homogeneity(2:end-1,2:end-1);

rgbImage = cat(3,  energy.*2.3,contrast.*1.8,correlation.*1.4 );
figure

    contrastImage = imshow(rgbImage);

    colormap jet;
    shading interp;
    colorbar;
    xlabel('Contrast','FontSize',24);
    
    
    
figure

    present2 = imshow(correlation);

    colormap jet;
    shading interp;
    colorbar;
    xlabel('Correlation','FontSize',24);
figure

    present3 = imshow(energy);

    colormap jet;
    shading interp;
    colorbar;
    xlabel('Energy','FontSize',24);
    
figure

    present4 = imshow(homogeneity);

    colormap jet;
    shading interp;
    colorbar;
    xlabel('Homogeneity','FontSize',24);
