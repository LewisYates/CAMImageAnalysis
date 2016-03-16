function NormalPatches

%% Variable Declarations

filelist = dir([fileparts('/Users/LewisYates/Documents/MATLAB/Dissertation/Normal Patches/') filesep '*.mat']);
filenames = {filelist.name};
showresults = 1;
currDr = cd;
directory = 'Training';
directory2 = 'Normal Patch Channels';
files = dir(fullfile(currDr, directory, '*.JPG'));
files2 = dir(fullfile(currDr, directory2, '*.mat'));
resultfolder = fullfile(currDr, 'Manual Classification');
resultfolder2 = fullfile(currDr, 'Normal Patch Channels');
patchWidth = 256;
numImageFiles = size(files, 1);
numPatchFiles = size(files2, 1);
labelling = double(0);
allpatches = double(0);
normalpatches = double(0);

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
%     end
%         
%         xRange = patchWidth-shiftx-1:patchWidth:size(I,2);
%         yRange = patchWidth-shifty-1:patchWidth:size(I,1);
%         I(yRange,:,:) = 1;
%         I(:,xRange,:) = 1;
        
%         %collect all patches
% %         allpatches = [];
% %         xcordofPatches = [1 xRange(1:end-1)];
% %         ycordofPatches = [1 yRange(1:end-1)];
% %         for x=1:length(xcordofPatches)
% %             for y=1:length(ycordofPatches)
% %                 allpatches = [allpatches; xcordofPatches(x) ycordofPatches(y)];
% %             end
% %         end
%         
         figure; imshow(I); hold on
%         
% %         for w=1:size(normalpatches,1)
% %             plot(normalpatches(w,1), normalpatches(w,2),'dy');
% %         end
% %         
%         
%         resultfile2 = fullfile(resultfolder2,['normalpatches_' name, '_', int2str(j),'.mat']);
%         load(resultfile2); %labelling       
%         
%         
% %        for k = 1 : size(labelling, 1)
%         for k = 1: size(normalpatches,1)
%             %if ismember(normalpatches(k,:), labelling)
% %            end
% %        end
%         %collect features of normal patches
%         
%         if showresults
%             x1 = double(normalpatches(k,1));
%             y1 = double(normalpatches(k,2));
%             patchWidth = double(normalpatches(k,3));
%             
%             %plot the patches
%             plot([x1 x1], [y1 y1 + patchWidth],'-r');
%             plot([x1 x1 + patchWidth], [y1 y1],'-r');
%             plot([x1 + patchWidth x1 + patchWidth], [y1 y1 + patchWidth],'-r');
%             plot([x1 x1 + patchWidth], [y1 + patchWidth y1 + patchWidth],'-r');
%             
%         end
% 
%         %% Colour Channels for each normal patch
%             if normalpatches(k,2) == 0 || normalpatches(k,1) == 0
%             
%                 normalpatches(k,2) = 1;
%                 normalpatches(k,1) = 1;
%             
% %             if ismember(normalpatches(k,:), labelling)
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
%                 patchRed = double(IR(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
%                 save(resultfile1,'patchRed');
%                 
%                 patchGreen = double(IG(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
%                 save(resultfile1,'patchGreen');
%                 
%                 patchBlue = double(IB(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
%                 save(resultfile1,'patchBlue');
%                 
%                 patchGrey = double(IGray(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
%                 save(resultfile1,'patchGrey');
%                 
%                 patchHue = double(IH(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
%                 save(resultfile1,'patchHue');
%                 
%                 patchSat = double(IS(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
%                 save(resultfile1,'patchSat');
%                 
%                 patchVal = double(IV(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
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
%                 patchRed = double(IR(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
%                 save(resultfile1,'patchRed');
%                 
%                 patchGreen = double(IG(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
%                 save(resultfile1,'patchGreen');
%                 
%                 patchBlue = double(IB(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
%                 save(resultfile1,'patchBlue');
%                 
%                 patchGrey = double(IGray(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
%                 save(resultfile1,'patchGrey');
%                 
%                 patchHue = double(IH(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
%                 save(resultfile1,'patchHue');
%                 
%                 patchSat = double(IS(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
%                 save(resultfile1,'patchSat');
%                 
%                 patchVal = double(IV(normalpatches(k,2):normalpatches(k,2) + normalpatches(k,3),...
%                     normalpatches(k,1):normalpatches(k,1)+normalpatches(k,3)));
%                 resultfile1 = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Value','.mat']);
%                 save(resultfile1,'patchVal');
%             end
%         end
%     end

% Feature Generation
normalFeatures=[];
for l = 1 : numPatchFiles
    [~,name, ~] = fileparts(files2(l).name);
    resultfile1 = fullfile(resultfolder2,[name, '.mat']);
    conv = load(fullfile(resultfile1));
    structConversion = struct2cell(conv);
    cellConversion = cell2mat(structConversion);
    
    F1 = var(cellConversion);
    F2 = skewness(cellConversion);
    F3 = kurtosis(cellConversion);
    F4 = mean(double(cellConversion));
    F5 = median(double(cellConversion));
    F6 = std(cellConversion);
    F7 = mode(cellConversion);
    F8 = min(cellConversion);
    F9 = max(cellConversion);
    %F10 = gradient(cellConversion);
    %F11 = gradient(F10);
    %F12 = rangefilt(cellConversion);
    %GLCMconv = GLCM_Features1(cellConversion);
    %GLCMconv2 = struct2cell(GLCMconv);
    %F10 = cell2mat(GLCMconv2);
    
    normalpatches = 1;
    
    normalFeatures = [normalFeatures; i l F1 F2 F3 F4 F5 F6...
        F7 F8 F9 normalpatches];
    
end
end

save('normalFeatures');

end