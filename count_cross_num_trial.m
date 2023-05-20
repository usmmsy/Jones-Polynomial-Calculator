D = 'C:\Users\yeti9\Dropbox\Jones Polynomial Calculator Project\diagrams';
files = dir(fullfile(D, '*.png'));
file_size = length(files);

I = imread(files(501).name);

if size(I,1)<400
    fprintf('File is too small.')
    return
end

if size(find(I),1) < size(find(~I),1)
    binaryImage = I > 0;
    X = find(I);
else
    binaryImage = I < 10;
    X = find(~I);
end

%binaryImage = binaryImage(9:310, 10:387);

[labeledImage, numStr] = bwlabel(binaryImage);

[xx,yy] = meshgrid(1:400,1:400);
x1 = xx(X);
y1 = yy(X);
plot(x1,y1,'r*')

caption = sprintf('Here is a link diagram with %d crossings', numStr);

title(caption);
