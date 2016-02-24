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
            
<<<<<<< HEAD
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
                    
                    IR = I(:,:,1);
                    IG = I(:,:,2);
                    IB = I(:,:,3);
                    IGray = rgb2gray(I);
                    
                    I_HSV = uint8(rgb2hsv(I) * (255/1));
                    IH = I_HSV(:,:,1);
                    IS = I_HSV(:,:,2);
                    IV = I_HSV(:,:,3);
                    
                    patchRed = double(IR(labelling(k,2):labelling(k,2) + labelling(k,3),...
=======
            figure; imshow(I); hold on
            resultfile = fullfile(resultfolder,['labelling_' name, '_', int2str(j),'.mat']);
            load(resultfile); %labelling

%% Plot the patches            
            for k = 1 : size(labelling, 1)
                if showresults
                    x1 = double(labelling(k,1));
                    y1 = double(labelling(k,2));
                    patchWidth = double(labelling(k,3));
                    
                    plot([x1 x1], [y1 y1 + patchWidth],'-r');
                    plot([x1 x1 + patchWidth], [y1 y1],'-r');
                    plot([x1 + patchWidth x1 + patchWidth], [y1 y1 + patchWidth],'-r');
                    plot([x1 x1 + patchWidth], [y1 + patchWidth y1 + patchWidth],'-r');

%% Save Patches                    
                    if labelling(k,2) == 0 || labelling(k,1) == 0
                   
                        labelling(k,2) = 1;
                        labelling(k,1) = 1;
                        
                        p = double(I(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                        resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'.mat']);
                        save(resultfile,'p');
                        %disp(strcat('Manual Classification File Saved To: ', resultfile));
                
                    else
                        p = double(I(labelling(k,2):labelling(k,2) + labelling(k,3),...
>>>>>>> origin/master
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
                    save(resultfile,'patchRed');
                    
<<<<<<< HEAD
                    patchGreen = double(IG(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
                    save(resultfile,'patchGreen');
                    
                    patchBlue = double(IB(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
                    save(resultfile,'patchBlue');
                    
                    patchGrey = double(IGray(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
                    save(resultfile,'patchGrey');
                    
                    patchHue = double(IH(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
                    save(resultfile,'patchHue');
                    
                    patchSat = double(IS(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
                    save(resultfile,'patchSat');
                    
                    patchVal = double(IV(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Value','.mat']);
                    save(resultfile,'patchVal');
                    
                else
                    
                    IR = I(:,:,1);
                    IG = I(:,:,2);
                    IB = I(:,:,3);
                    IGray = rgb2gray(I);
                    
                    I_HSV = uint8(rgb2hsv(I) * (255/1));
                    IH = I_HSV(:,:,1);
                    IS = I_HSV(:,:,2);
                    IV = I_HSV(:,:,3);
                    
                    patchRed = double(IR(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Red','.mat']);
                    save(resultfile,'patchRed');
                    
                    patchGreen = double(IG(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Green','.mat']);
                    save(resultfile,'patchGreen');
                    
                    patchBlue = double(IB(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Blue','.mat']);
                    save(resultfile,'patchBlue');
                    
                    patchGrey = double(IGray(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Grey','.mat']);
                    save(resultfile,'patchGrey');
                    
                    patchHue = double(IH(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Hue','.mat']);
                    save(resultfile,'patchHue');
                    
                    patchSat = double(IS(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Saturation','.mat']);
                    save(resultfile,'patchSat');
                    
                    patchVal = double(IV(labelling(k,2):labelling(k,2) + labelling(k,3),...
                        labelling(k,1):labelling(k,1)+labelling(k,3)));
                    resultfile = fullfile(resultfolder2,[name, '_', 'patch-', int2str(k),'_','Value','.mat']);
                    save(resultfile,'patchVal');
                    
=======
>>>>>>> origin/master
                end
                
            end
            
        end
        
    end
end

end