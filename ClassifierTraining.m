function ClassifierTraining 

%% Naive Bayes Training 
normalFeaturesLoad = load('normalFeatures', '-regexp', 'normalFeatures');
structConversion = struct2cell(normalFeaturesLoad);
X = cell2mat(structConversion);

Y = X(1, :);
X = X(:, 3: 2316);

pS = sum (Y)/size(Y,1);     % all rows with Y = 1 
pE = sum (1 - Y)/size(Y,1);  % all rows with Y = 0

phiS = X * Y / sum(Y);  % all instances for which attrib phi(i) and Y are both 1
              % meaning all Scotts with attribute phi(i)  = 1 
phiE = X * (1-Y) / sum(1-Y) ;  % all instances for which attrib phi(i) = 1 and Y =0
              % meaning all English with attribute phi(i) = 1 
              
pxS = prod(phiS.^x.*(1-phiS).^(1-x));
pxE = prod(phiE.^x.*(1-phiE).^(1-x));

pxSF = (pxS * pS ) / (pxS + pxE)
pxEF = (pxE * pS ) / (pxS + pxE)

end