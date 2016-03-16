function [abnormalpatches, allpatches] = SelectManualClassification(I, patchWidth, shiftdir)

%%% SelectManualClassification function allows for the precise collection of patch data from a Training Data Set


I1=I;

% if shiftdir == 1
%     %shift along x axis
%     shiftx = round(patchWidth/2);
%     shifty = 0;
%     
%     I1(patchWidth:patchWidth-shifty:end,:, 2) = 0;
%     I1(:,patchWidth-shiftx:patchWidth:end, 2) = 0;
%     
% elseif shiftdir == 2
%     %shift along y axis
%     shiftx = 0;
%     shifty = round(patchWidth/2);
%     
%     I1(patchWidth-shifty:patchWidth:end,:, 1) = 0;
%     I1(:,patchWidth-shiftx:patchWidth:end, 1) = 0;
%     
% else
%     %no shift
%     shiftx = 0;
%     shifty = 0;
%     
%     I1(patchWidth:patchWidth:end,:) = 1;
%     I1(:,patchWidth:patchWidth:end) = 1;
%     
% end


if shiftdir == 1
    %shift along x axis
    shiftx = round(patchWidth/2);
    shifty = 1;
    
elseif shiftdir == 2
    %shift along y axis
    shiftx = 1;
    shifty = round(patchWidth/2);
    
else
    %no shift
    shiftx = 1;
    shifty = 1;
   
end

xRange = patchWidth-shiftx-1:patchWidth:size(I1,2);
yRange = patchWidth-shifty-1:patchWidth:size(I1,1);
I1(yRange,:,:) = 1;
I1(:,xRange,:) = 1;

% I1(shifty:patchWidth:end,:,:) = 1;
% I1(:,shiftx:patchWidth:end,:) = 1;

%I1(:,128:256:end,:) = 1;
% I1(patchWidth-shifty-1:patchWidth:end,:) = 1;
% I1(:,patchWidth-shiftx-1:patchWidth:end) = 1;

% I(256:256:end,:,:) = 0;
% I(:,256:256:end,:) = 0;


f = figure; imshow(I1); hold on
% to collect up left corner cordinate of all patches
% allpatches = [];
% xcordofPatches = [1 xRange(1:end-1)];
% ycordofPatches = [1 yRange(1:end-1)];
% for x=1:length(xcordofPatches)
%     for y=1:length(ycordofPatches)
%         allpatches=[allpatches; xcordofPatches(x) ycordofPatches(y)];
%     end
% end
% for w=1:size(allpatches,1)
%    plot(allpatches(w,1), allpatches(w,2),'dy');
% end

abnormalpatches=[];

getpoints = 1;

while getpoints
    
    [x, y, button] = ginput(1);
    
    if(button == 1) %abnormal patch
        x1 = uint32(floor(x/patchWidth) * patchWidth);
        y1 = uint32(floor(y/patchWidth) * patchWidth);
        
        abnormalpatches = [abnormalpatches; x1 y1 patchWidth];
        plot(x1,y1,'+y');
        
        plot(x,y, 'r+', 'LineWidth', 0.9);
        plot([x1 x1], [y1 y1 + patchWidth],'-r');
        plot([x1 x1 + patchWidth], [y1 y1],'-r');
        plot([x1 + patchWidth x1 + patchWidth], [y1 y1 + patchWidth],'-r');
        plot([x1 x1 + patchWidth], [y1 + patchWidth y1 + patchWidth],'-r');
        
    else
        getpoints = 0;
        
            
    end
end

close (f);

end