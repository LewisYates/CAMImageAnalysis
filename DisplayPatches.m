function DisplayPatches

%% Variable Declarations

showresults = 1;
currDr = cd;
directory = 'Training';
files = dir(fullfile(currDr, directory, '*.JPG'));
resultfolder = fullfile(currDr, 'Manual Classification');
patchWidth = 256;
numImageFiles = size(files, 1);
labelling = double(0);

%% show the abnormal patches

    for i = 1 : numImageFiles
        [~,name, ~] = fileparts(files(i).name);
        I = (imread(fullfile(currDr, directory,files(i).name)));
        sz = size(I);
        
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
                    
                end
                if labelling(k,2) == 0 || labelling(k,1) == 0
                   
                    labelling(k,2) = 1;
                    labelling(k,1) = 1;
                    
                Patch = double(I(labelling(k,2):labelling(k,2) + labelling(k,3), labelling(k,1):labelling(k,1)+labelling(k,3)));
                
                end
                %step 1: collect features for each patch
                %patchfeatures = getData(Patch);
                
                %y2 = min([y1 sz(1)]);
                %x2 = min([x1 sz(2)]);
                
                %p1 = I(y1:y2, x1:x2);
                
%                 y2 = min([y1 sz(1)]);
%                 x2 = min([x1 sz(2)]);
%                 y3 = (y1:y2);
%                 x3 = (x1:x2);
%                 p1 = mod(y3, x3);

                
                %for k = 1 : length(patchNum)
                
                %generate feature data for each identified patch, for loop?
                %e.g. 
                %f1 = skewness(double(p1));
                %f2 = kurtosis(double(p1));
                
            end
        end
    end