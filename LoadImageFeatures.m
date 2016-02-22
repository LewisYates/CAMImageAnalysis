function [ FeatureMatrix ] = LoadImageFeatures( csv_filename, feature_path, num_features )
%LoadImageFeatures Loads image feature data
%   Detailed explanation goes here

csv_fid = fopen(csv_filename);
contents = fread(csv_fid, '*char')';
fclose(csv_fid);
filenames = regexp(contents, ',', 'split');

FeatureMatrix = [];
TempFeatureMatrix = []

for k=1:length(filenames)
    label_filename = strcat(feature_path, filenames{k});
    label_filename
    labels = csvread(label_filename);
    labels = labels (:);
    TempFeatureMatrix = [TempFeatureMatrix  labels];
    
    t = mod(k, num_features);
    
    if(mod(k, num_features) == 0)
        FeatureMatrix = [FeatureMatrix ; TempFeatureMatrix];
        TempFeatureMatrix = [];
    end
end

end

