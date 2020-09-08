function getImage = Viola_Jones_Face_Detection(fileName,ImgLoc)

I = imread(fileName);
%detection of face
FaceDetect = vision.CascadeObjectDetector;
imshow(I);

hold on
Obj = step(FaceDetect,I);
for i=1:size(Obj,1)
    rectangle('position',Obj(i,:),'Linewidth',4,'Linestyle','-','Edgecolor','y');
end
hold on
N=size(Obj,1);
handles.N=N;
counter=1;
for i=1:N
    face=imcrop(I,Obj(i,:));
    %this is where image will be saved
    getImage = strcat(ImgLoc ,num2str(counter), '.JPG'); 
    baseDir  = ImgLoc;
    %     baseName = 'image_';
    newName  = [baseDir num2str(counter) '.JPG'];
    handles.face=face;
    while exist(newName,'file')
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.JPG'];
    end
    fac=imresize(face,[112,92]);
    imwrite(fac,newName);
figure(2);
imshow(face); 
title('crop pic');
   
    pause(.5);
end
end