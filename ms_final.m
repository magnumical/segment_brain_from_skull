%% openning
FileName = 'ms.dcm';
folder = pwd
fullFileName = fullfile(folder, FileName)
I = dicomread(fullFileName);
figure(1);imshow(I, []);


%% pre-processing
threshold = 100;
I2 = I > threshold;
figure(2);imshow(I2, []);
%% seperating brain
% select 2 large areas in image! (skull and cerebellum) 
I3 = bwareafilt(I2, 2);		
I3 = imopen(I3, ones(5));
I3 = bwareafilt(I3, 1);
figure(3);imshow(I3, []);
%I3 = imfill(I3, 'holes');
%I3 = imdilate(I3, ones(5));%true
figure(4);imshow(I3, []);
%% without skull
I4=I;
figure(5)
I4(I3)= 0 ;
subplot(1,2,1)
imshow(I4, []);

I4=I;
I4(~I3)= 0 ;
subplot(1,2,2)
imshow(I4, []);
