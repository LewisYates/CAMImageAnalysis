function [ M ] = RemoveSpecifiedColumns( M1, C1 )
%UNTITLED4 Remove columns as secified by C1

[~,c] = find(C1);
M = M1(:,c);

end

