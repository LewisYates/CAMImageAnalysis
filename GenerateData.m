function GenerateData
%GenerateData Generates feature data from input image.

%% Variable Declarations
filelist = dir([fileparts('/Users/LewisYates/Documents/MATLAB/Dissertation/Manual Classification/') filesep '*.mat']);
filenames = {filelist.name};
outDir = ('/Users/LewisYates/Documents/MATLAB/Dissertation/TrainingFeatures/');
w = 256;
h = 256;
currDr = cd;
directory = 'Manual Classification';
files = dir(fullfile(currDr, directory, '*.mat'));
numPatchFiles = size(files, 1);
images = {};

featureFunctions = {
            %@(block_struct) graycoprops_fun(range(double(block_struct.data, 'Homogeneity'))),...
            %@(block_struct) graycoprops_fun(range(double(block_struct.data, 'Energy'))),...
            %@(block_struct) graycoprops_fun(range(double(block_struct.data, 'Contrast'))),...
            @(f1) var(range(double)),...
            @(f2) skewness(range(double)),...
            @(f3) kurtosis(range(double)),...
            @(f4) mean2(double), ...
            @(f5) median(median(double)), ...
            @(f6) std(std(double)), ...
            @(f7) mode(mode(double)), ...
            @(f8) min(min(double)), ...
            @(f9) max(max(double)), ...
            @(f10) gradient(double(double)), ...
            @(f11) gradient(gradient(double(double)))...
            @(f12) rangefilt(double(double))
    };

%Loop through all of the feature patches
for i = 1 : numPatchFiles
    [~,name, ~] = fileparts(files(i).name);
    %I = (imread(fullfile(currDr, directory,files(i).name)));
    
    %HSV Colour Space Conversion from RGB
    I_HSV = uint8(rgb2hsv(I) * (255/1));
    
    %Define the colour channels
    IR = I(:,:,1);
    IG = I(:,:,2);
    IB = I(:,:,3);
    IGray = rgb2gray(I);
    IH = I_HSV(:,:,1);
    IS = I_HSV(:,:,2);
    IV = I_HSV(:,:,3);
    
    images = {IR IG IB IGray IH IS IV};
    tags = {'RED' 'GREEN' 'BLUE' 'GRAY' 'HUE' 'SAT' 'INT'};
    
    %Loop through all the feature generation functions
    for j=1:length(featureFunctions)
        
        functions = featureFunctions{j};
        filename = filenames{i};
        
        for k=1:length(images)
            process_image_fun(images{k}, filename, tags{k}, functions, outDir, w, h);
        end
        
    end
    
end

end

function process_image_fun(image, imageFilename, imageName, fun, outDir, w, h)
    regex = ',';
    replace = '.';
    outFile = strcat(outDir, imageFilename, '.', imageName, func2str(fun), '.mat');
    outFile = regexprep(outFile,regex,replace);
    blocks = blockproc(image, [w, h], fun);
    save(outFile, 'blocks');
    
end

% function [out_val] = graycoprops_fun (block, param)
% 
%     if(isfloat(block))
%         A = []
%     end
%     out_val = graycoprops(block, param);
%     out_val = getfield(out_val, param);
    
%end