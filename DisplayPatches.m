function DisplayPatches

%% Variable Declarations

showresults = 1;
currDr = cd;
directory = 'Training';
files = dir(fullfile(currDr, directory, '*.JPG'));

resultfolder = fullfile(currDr, 'Manual Classification');
resultfolder2 = fullfile(currDr, 'TrainingFeatures');
patchWidth = 256;
numImageFiles = size(files, 1);
labelling = double(0);

%% show the abnormal patches

    for i = 1 : numImageFiles
        [~,name, ~] = fileparts(files(i).name);
        I = (imread(fullfile(currDr, directory,files(i).name)));
        
        for j=0% may be later we will try this 0:2
            
            if j == 1
                %shift along x axis
                shiftx = round(patchWidth/2);
                shifty = 1;
                
            elseif j == 2
                %shift along y axis
                shiftx = 1;
                shifty = round(patchWidth/2);
                
            else
                %no shift
                shiftx = 1;
                shifty = 1;
                
            end
            
            xRange = patchWidth-shiftx-1:patchWidth:size(I,2);
            yRange = patchWidth-shifty-1:patchWidth:size(I,1);
            I(yRange,:,:) = 1;
            I(:,xRange,:) = 1;
            
            figure; imshow(I); hold on
            resultfile = fullfile(resultfolder,['labelling_' name, '_', int2str(j),'.mat']);
            load(resultfile); %labelling

            for k = 1 : size(labelling, 1)
                if showresults
                    x1 = double(labelling(k,1));
                    y1 = double(labelling(k,2));
                    patchWidth = double(labelling(k,3));
                    
                    plot([x1 x1], [y1 y1 + patchWidth],'-r');
                    plot([x1 x1 + patchWidth], [y1 y1],'-r');
                    plot([x1 + patchWidth x1 + patchWidth], [y1 y1 + patchWidth],'-r');
                    plot([x1 x1 + patchWidth], [y1 + patchWidth y1 + patchWidth],'-r');
                    
                    if labelling(k,2) == 0 || labelling(k,1) == 0
                   
                        labelling(k,2) = 1;
                        labelling(k,1) = 1;
                        
                        p{k} = double(I(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                        resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'.mat']);
                        save(resultfile,'p');
                        %disp(strcat('Manual Classification File Saved To: ', resultfile));
                
                    else
                        p{k} = double(I(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                        resultfile = fullfile(resultfolder2,[name, '_', 'patch_', int2str(k),'.mat']);
                        save(resultfile,'p');
                        %disp(strcat('Manual Classification File Saved To: ', resultfile));
                    end
                    
                end
                
                %for m = 1:size(labelling, 1)
                %step 1: collect features for each patch
                    
                %end
                
            end
            
        end
    end
end