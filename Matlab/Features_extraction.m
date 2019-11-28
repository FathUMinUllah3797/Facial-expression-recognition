clc
clear all;
DBAngry   = dir('F:\fathuminullah 60\classes\angry\*.jpg');
DBDisgust = dir('F:\fathuminullah 60\classes\disgust\*.jpg');
DBFear    = dir('F:\fathuminullah 60\classes\fear\*.jpg');
DBHappy   = dir('F:\fathuminullah 60\classes\happy\*.jpg');
DBNeutral = dir('F:\fathuminullah 60\classes\neutral\*.jpg');
DBSad     = dir('F:\fathuminullah 60\classes\sad\*.jpg');
DBSurprise= dir('F:\fathuminullah 60\classes\surprise\*.jpg');

% DBSize=length(DBFolder);
%  trainData=zeros(60,63504);
AngryDBSize=length(DBAngry);
AngryTrainData=zeros(AngryDBSize,63504);

DisgustDBSize=length(DBDisgust);
DisgustTrainData=zeros(DisgustDBSize,63504);

FearDBSize=length(DBFear);
FearTrainData=zeros(FearDBSize,63504);

HappyDBSize=length(DBHappy);
HappyTrainData=zeros(HappyDBSize,63504); 

NeutralDBSize=length(DBNeutral);
NeutralTrainData=zeros(NeutralDBSize,63504);

SadDBSize=length(DBSad);
SadTrainData=zeros(SadDBSize,63504);

SurpriseDBSize=length(DBSurprise);
SurpriseTrainData=zeros(SurpriseDBSize,63504);


k=1;
l=1;
                                %%%%% Retrieving Anger Dataset %%%%% 
for i=1:AngryDBSize
    I=strcat('F:\fathuminullah 60\classes\angry\',int2str(k),' (',int2str(i),').jpg');
    imgAnger=imread(I);
    processedImg=preProcessingOfImg(imgAnger);
    hogFeature=extractHOGFeatures(processedImg);
    AngryTrainData(i,:)=hogFeature;
end
                               %%%%% Retrieving Disgust Dataset %%%%% 
for i=1:DisgustDBSize
    I=strcat('F:\fathuminullah 60\classes\disgust\',int2str(k),' (',int2str(i),').jpg');
    imgDisgust=imread(I);
    processedImg=preProcessingOfImg(imgDisgust);
    hogFeature=extractHOGFeatures(processedImg);
    DisgustTrainData(i,:)=hogFeature;
end
                               %%%%% Retrieving Fear Dataset %%%%% 
for i=1:FearDBSize
    I=strcat('F:\fathuminullah 60\classes\fear\',int2str(k),' (',int2str(i),').jpg');
    imgFear=imread(I);
    processedImg=preProcessingOfImg(imgFear);
    hogFeature=extractHOGFeatures(processedImg);
    FearTrainData(i,:)=hogFeature;
end
                                %%%%% Retrieving Happy Dataset %%%%% 
for i=1:HappyDBSize
    I=strcat('F:\fathuminullah 60\classes\happy\',int2str(k),' (',int2str(i),').jpg');
    imgHappy=imread(I);
    processedImg=preProcessingOfImg(imgHappy);
    hogFeature=extractHOGFeatures(processedImg);
    HappyTrainData(i,:)=hogFeature;
end
                                %%%%% Retrieving Neutral Dataset %%%%% 
for i=1:NeutralDBSize
    I=strcat('F:\fathuminullah 60\classes\neutral\',int2str(k),' (',int2str(i),').jpg');
    imgNeutral=imread(I);
    processedImg=preProcessingOfImg(imgNeutral);
    hogFeature=extractHOGFeatures(processedImg);
    NeutralTrainData(i,:)=hogFeature;
    
end
                                %%%%% Retrieving Sad Dataset %%%%% 
for i=1:SadDBSize
    I=strcat('F:\fathuminullah 60\classes\sad\',int2str(k),' (',int2str(i),').jpg');
    imgSad=imread(I);
    processedImg=preProcessingOfImg(imgSad);
    hogFeature=extractHOGFeatures(processedImg);
    SadTrainData(i,:)=hogFeature;
end
                                %%%%% Retrieving Surprise Dataset %%%%% 
for i=1:SurpriseDBSize
    I=strcat('F:\fathuminullah 60\classes\surprise\',int2str(k),' (',int2str(i),').jpg');
    imgSurprise=imread(I);
    processedImg=preProcessingOfImg(imgSurprise);
    hogFeature=extractHOGFeatures(processedImg);
    SurpriseTrainData(i,:)=hogFeature;
end

trainLabel=[zeros(1,60) ones(1,60) 2*ones(1,25) 3*ones(1,60) 4*ones(1,60) 5*ones(1,58) 6*ones(1,60)];
trainCell=[AngryTrainData(1:60,:);DisgustTrainData(1:60,:);FearTrainData(1:25,:);HappyTrainData(1:60,:); NeutralTrainData(1:60,:);SadTrainData(1:58,:);SurpriseTrainData(1:60,:)];
svmmodel=fitcecoc(trainCell,trainLabel);
%save('svmmodel')
clear;
% k=1;
% l=1;
% for i=1:DBSize
%     if l >20
%         l=1;
%         k=k+1;
%     end
%     I=strcat(int2str(k),' (',int2str(l),').jpg');
%     img=imread(I);
%     processedImg=preProcessingOfImg(img);
% %     Face = step(faceDetector, img);
% %     Face=imresize(Face,[164,164]);
% %     img=(img(Face(1,2):Face(1,2)+Face(1,4),Face(1,1):Face(1,1)+Face(1,3),:));
% %     IFaces = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
% %     imshow(IFaces), title('Detected faces');
%       
%       hogFeature=extractHOGFeatures(processedImg);
%       trainData(i,:)=hogFeature;
%     l=l+1;   
% end
