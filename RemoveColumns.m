function [ M1, M2 ] = RemoveColumns( mx1, mx2, my1, my2 )
%GetZeroColumns removes columns c from m
%   mx1 training x
%   mx2 testing x
%   my1 training y
%   my2 testing y

% remove any columns with all zero in either training or testing
[M1, M2] = RemoveZeroColumns(mx1, mx2);

% remove any columns which for any class label has a variance of 0 or less
[C] = GetNonPositiveClassVarianceCols(M1, my1);
M1(:,C) = [];
M2(:,C) = [];

% remove any columns with nan
[~,c1]=find(isnan(M1));
[~,c2]=find(isnan(M1));
c = [c1;c2];
c = unique(c);
M1(:,c) = [];
M2(:,c) = [];

end

function [ C ] = GetNonPositiveClassVarianceCols(mx1, my1)

numFeatures = size(mx1,2);
C = []; % columns to remove if too low in var for a class

[~,~,v] = find(my1);
v = unique(v);
v = [v; 0];

numLabels = size(v, 1);

% for all class labels
for k=1:numLabels
    
    lbl = v(k,1);
    dataForLabel = mx1(my1(:,1) == lbl, :);
    
    % for all features
    for j=1:numFeatures
        variance = var(dataForLabel(:, j));
        if(variance <= 0)
            C = [C j];
        end
    end
    
end

end

function [ M1, M2 ] = RemoveZeroColumns( ma1, ma2 )
% remove empty columns in ma1 from ma1 and ma2
[~,c1] = find(ma1);
c1 = unique(c1);

ma1 = ma1(:, c1);
ma2 = ma2(:, c1);

% remove empty columns in ma2 from ma1 and ma2
[~,c2] = find(ma2);
c2 = unique(c2);

M1 = ma1(:, c2);
M2 = ma2(:, c2);
end