function ManuallyClassifyImageDataset
%ManuallyClassifyImageDataset Manually select good/bad cells within the input image
%   imageFile   - file name of image
%   cellWidth   - width of patches
%   cellHeight  - height of patches
%   outDir      - manual classification result output directory

%% Variable Declaration
currDr = cd;
directory = 'Testing';
files = dir(fullfile(currDr, directory, '*.JPG'));
resultfolder = fullfile(currDr, 'Manual Classification');
patchWidth = 256;
numImageFiles = size(files, 1);

%% Label Abnormal Patches
    
    for i = numImageFiles
        [~,name, ~] = fileparts(files(i).name);
        I = (imread(fullfile(currDr, directory,files(i).name)));
        
        for j=0 % maybe later we will try this 0:2 (shiftx, y)
            %0 no shift
            %1 shift x
            %2 shift y
            
            % get a set of abnormal paches
            testAbnormalPatches = SelectManualClassification(I, patchWidth, j);
            %resultfile = fullfile(resultfolder,['abnormalpatches_' name, '_', int2str(j),'.mat']);
            %save(resultfile,'abnormalpatches');
            resultfile = fullfile(resultfolder,['testAbnormalPatches_' name, '_', int2str(j),'.mat']);
            save(resultfile,'testAbnormalPatches');
            disp(strcat('Manual Classification File Saved To: ', resultfile));
        end
    end
end

