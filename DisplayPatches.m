function DisplayPatches

%% Variable Declarations

filelist = dir([fileparts('/Users/LewisYates/Documents/MATLAB/Dissertation/Patches/') filesep '*.mat']);
filenames = {filelist.name};
outDir = ('/Users/LewisYates/Documents/MATLAB/Dissertation/Working Set/');
showresults = 1;
currDr = cd;
directory = 'Training';
directory2 = 'Patches';
files = dir(fullfile(currDr, directory, '*.JPG'));
files2 = dir(fullfile(currDr, directory2, '*.mat'));
resultfolder = fullfile(currDr, 'Manual Classification');
resultfolder2 = fullfile(currDr, 'Patches');
patchWidth = 256;
numImageFiles = size(files, 1);
numPatchFiles = size(files2, 1);
%labelling = double(0);
allpatches = double(0);
labelling = double(0);

% show the abnormal patches

for i = 1 : numImageFiles
    [~,name, ~] = fileparts(files(i).name);
    I = (imread(fullfile(currDr, directory,files(i).name)));
    
%     for j=0% may be later we will try this 0:2
%         
%         if j == 1
%             %shift along x axis
%             shiftx = round(patchWidth/2);
%             shifty = 1;
%             
%         elseif j == 2
%             %shift along y axis
%             shiftx = 1;
%             shifty = round(patchWidth/2);
%             
%         else
%             %no shift
%             shiftx = 1;
%             shifty = 1;
%             
%         end
        
%         xRange = patchWidth-shiftx-1:patchWidth:size(I,2);
%         yRange = patchWidth-shifty-1:patchWidth:size(I,1);
%         I(yRange,:,:) = 1;
%         I(:,xRange,:) = 1;
        
%         %collect all patches
%         allpatches = [];
%         xcordofPatches = [1 xRange(1:end-1)];
%         ycordofPatches = [1 yRange(1:end-1)];
%         for x=1:length(xcordofPatches)
%             for y=1:length(ycordofPatches)
%                 allpatches = [allpatches; xcordofPatches(x) ycordofPatches(y)];
%             end
%         end
        
        figure; imshow(I); hold on
        
% %         for w=1:size(allpatches,1)
% %             plot(allpatches(w,1), allpatches(w,2),'dy');
% %         end
% %         
%         
%         resultfile = fullfile(resultfolder,['labelling_' name, '_', int2str(j),'.mat']);
%         load(resultfile); %labelling
%         
% 
%         
%         
%         for k = 1 : size(labelling, 1)
% %             for l=1: size(allpatches,1)
% %                 if ismember(allpatches(k,:), labelling)
% %                     continue
% %                 end
% %             end
%             %collect features of normal patches
%             
%             if showresults
%                 x1 = double(labelling(k,1));
%                 y1 = double(labelling(k,2));
%                 patchWidth = double(labelling(k,3));
%                 
%                 %plot the patches
%                 plot([x1 x1], [y1 y1 + patchWidth],'-r');
%                 plot([x1 x1 + patchWidth], [y1 y1],'-r');
%                 plot([x1 + patchWidth x1 + patchWidth], [y1 y1 + patchWidth],'-r');
%                 plot([x1 x1 + patchWidth], [y1 + patchWidth y1 + patchWidth],'-r');
%                 
%             end
%             %% Colour Channels for each patch
%             if labelling(k,2) == 0 || labelling(k,1) == 0
%                 %if ismember(allpacthes(k,:), labelling(k,2) & labelling(k,1))
%                 
%                 labelling(k,2) = 1;
%                 labelling(k,1) = 1;
%                 
%                 IR = I(:,:,1);
%                 IG = I(:,:,2);
%                 IB = I(:,:,3);
%                 IGray = rgb2gray(I);
%                 
%                 I_HSV = uint8(rgb2hsv(I) * (255/1));
%                 IH = I_HSV(:,:,1);
%                 IS = I_HSV(:,:,2);
%                 IV = I_HSV(:,:,3);
%                 
%                 patchRed = double(IR(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
%                 save(resultfile1,'patchRed');
%                 
%                 patchGreen = double(IG(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
%                 save(resultfile1,'patchGreen');
%                 
%                 patchBlue = double(IB(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
%                 save(resultfile1,'patchBlue');
%                 
%                 patchGrey = double(IGray(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
%                 save(resultfile1,'patchGrey');
%                 
%                 patchHue = double(IH(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
%                 save(resultfile1,'patchHue');
%                 
%                 patchSat = double(IS(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
%                 save(resultfile1,'patchSat');
%                 
%                 patchVal = double(IV(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Value','.mat']);
%                 save(resultfile1,'patchVal');
%                 
%             else
%                 
%                 IR = I(:,:,1);
%                 IG = I(:,:,2);
%                 IB = I(:,:,3);
%                 IGray = rgb2gray(I);
%                 
%                 I_HSV = uint8(rgb2hsv(I) * (255/1));
%                 IH = I_HSV(:,:,1);
%                 IS = I_HSV(:,:,2);
%                 IV = I_HSV(:,:,3);
%                 
%                 patchRed = double(IR(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
%                 save(resultfile1,'patchRed');
%                 
%                 patchGreen = double(IG(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
%                 save(resultfile1,'patchGreen');
%                 
%                 patchBlue = double(IB(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
%                 save(resultfile1,'patchBlue');
%                 
%                 patchGrey = double(IGray(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
%                 save(resultfile1,'patchGrey');
%                 
%                 patchHue = double(IH(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
%                 save(resultfile1,'patchHue');
%                 
%                 patchSat = double(IS(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
%                 save(resultfile1,'patchSat');
%                 
%                 patchVal = double(IV(labelling(k,2):labelling(k,2) + labelling(k,3),...
%                     labelling(k,1):labelling(k,1)+labelling(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Value','.mat']);
%                 save(resultfile1,'patchVal');
% 
%             end
%         end
%     end
%         
    %% Feature Generation
    abnormalFeatures=[];
    for l = 1 : numPatchFiles
        [~,name, ~] = fileparts(files2(l).name);
        resultfile1 = fullfile(resultfolder2,[name, '.mat']);
        conv = load(fullfile(resultfile1));
        structConversion = struct2cell(conv);
        cellConversion = cell2mat(structConversion);
        
        F1 = double(var(cellConversion(:)));
        F2 = skewness(cellConversion(:));
        F3 = kurtosis(cellConversion(:));
        F4 = mean2(double(cellConversion));
        F5 = median(median(double(cellConversion)));
        F6 = std2(cellConversion);
        F7 = mode(mode(cellConversion));
        F8 = min(cellConversion(:));
        F9 = max(cellConversion(:));
        F10 = mean(gradient(cellConversion(:)));
        F11 = mean(rangefilt(cellConversion(:)));
        
        GLCM1 = graycomatrix(cellConversion);
        GLCMconv = GLCM_Features1(GLCM1);
        GLCMconv2 = struct2cell(GLCMconv);
        GLCMfeatures = cell2mat(GLCMconv2);
        F12 = GLCMfeatures(1,1); %AutoCorrelation
        F13 = GLCMfeatures(2,1); %Contrast
        F14 = GLCMfeatures(7,1); %Dissimilarity
        F15 = GLCMfeatures(8,1); %Energy
        F16 = GLCMfeatures(9,1); %Entropy
        F17 = GLCMfeatures(10,1); %Homogeneity
        
        %Extraction of GLCM Features into Normal Features Vector Array
        abnormalpatches = 1;
        
        abnormalFeatures = [abnormalFeatures; i l F1 F2 F3 F4 F5 F6 F7 F8 F9 F10...
            F11 F12 F13 F14 F15 F16 F17 abnormalpatches];
        
    end
end

save('abnormalFeatures');

end
   