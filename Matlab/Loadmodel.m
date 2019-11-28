%Author Fath U Min Ullah
%Sejong University 


clear all;
clc
load('svmmodel2.mat')

    faceDetector = vision.CascadeObjectDetector(); 
    
    I = imread(imgetfile);
   % I = imresize(I,0.3);
  
    bboxes = step(faceDetector, I);
    num=size(bboxes);
    
    angry=0;
    disgust=0;
    fear=0;
    happy=0;
    neutral=0;
    sad=0;
    surprise=0;

   for i=1:num(1)
    
    a=imcrop(I,bboxes(i,:));
    a=rgb2gray(a);
    a=imresize(a,[350,350],'bicubic');
       
    featureVector = extractHOGFeatures(a);
    %Test_data=featureVector;


    %test=predict(trainCell,trainLabel,Test_data);
    test= predict(svmmodel2,featureVector);
    %figure,imshow(a),title(test)

    %overall=zeros(7,1)
      avg=zeros(7,1); 
   if test == 0
   label_str{i} = 'Angry' ;
   avg(1,1)=avg(1,1)+1;
   elseif test == 1
   label_str{i} = 'Disgust';
   avg(2,1)=avg(2,1)+1;
   elseif test == 2
   label_str{i} = 'Fear';
   avg(3,1)=avg(3,1)+1;
   elseif test == 3
   label_str{i} = 'Happy';
   avg(4,1)=avg(4,1)+1;
   elseif test == 4
   label_str{i} = 'Neutral';
   avg(5,1)=avg(5,1)+1;
   elseif test == 5
   label_str{i} = 'Sad';
   avg(6,1)=avg(6,1)+1;
   elseif test == 6
   label_str{i} = 'Surprise';
   avg(7,1)=avg(7,1)+1;   
   end
   
   [mm, idm]=max(avg);
   
  if idm ==1
      ovr='Angry';
  elseif idm ==2
      ovr='Disgust';
  elseif idm ==3
      ovr='Fear';
  elseif idm ==4
      ovr='Happy';
  elseif idm ==5
      ovr='Neutral';
  elseif idm ==6
      ovr='Sad';
  elseif idm ==7
      ovr='surprise';
 
  end
  
  
   

   end
   IFaces = insertObjectAnnotation(I, 'rectangle', bboxes,label_str );  
 
   %%RGB = insertText(IFaces,[50,50],'Over All Expersion');
   
   figure, imshow(IFaces), title(strcat('Over All Expression of the group photo : ',ovr)); 
   clear all;
   clc
   
