function [ c ] = GetZeroColumns( m1, m2 )
%GetZeroColumns Get numbers of columns that contain only zeros

[~,c1] = find(m1);
[~,c2] = find(m2);

c1 = unique(c1);
c2 = unique(c2);

c = unique([c1; c2]);

end