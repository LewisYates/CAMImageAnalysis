function [ M1, M2 ] = RemoveZeroColumns( ma1, ma2 )
%GetZeroColumns removes columns c from m

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