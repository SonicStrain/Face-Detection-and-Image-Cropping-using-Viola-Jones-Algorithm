%Enter the location of the folder containing images
ImgFol = 'C:\Users\User\Desktop\Viola Zones Face Detector and cropper\jaffedbase';
%Enter the location where you want to receieve the images
ImgLoc = 'C:\Users\User\Desktop\Viola Zones Face Detector and cropper\result';

%driver code
str2 = [ImgFol,'\'];
str1 = [str2,'*.TIFF'];
Loc = [ImgLoc,'\result'];
Ifolder = dir(str1);

for ii = 1:length(Ifolder)
    str = [str2,Ifolder(ii).name];
    join(str);
    getImage = Viola_Jones_Face_Detection(str,Loc);
end