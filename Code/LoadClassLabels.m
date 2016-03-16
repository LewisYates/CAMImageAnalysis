function [ LabelMatrix ] = LoadClassLabels( csv_filename, label_path )
%LoadClassLabels Loads all class labels specified in the csv file
%   The csv file should contain filenames of other csv files that contain
%   the actual class labels for images. The output of this function will
%   be in the order the filenames appear in the csv.

csv_fid = fopen(csv_filename);
contents = fread(csv_fid, '*char')';
fclose(csv_fid);
filenames = regexp(contents, ',', 'split');

LabelMatrix = [];

for k=1:length(filenames)
    label_filename = strcat(label_path, filenames{k})
    labels = csvread(label_filename);
    labels = labels (:);
    LabelMatrix = [LabelMatrix ; labels];
end

end

