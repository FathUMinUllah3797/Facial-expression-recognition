function resultantImg=preProcessingOfImg(img)

       % preprocessing starts
%     gamma correction
    gamma=...
        vision.GammaCorrector(1,'Correction','De-gamma');
    img1=step(gamma,img);
%      imshow(img1);
   
   %DoG Filtering
%     gaussian1 = fspecial('Gaussian', [3, 3],0.2);
%  gaussian2 = fspecial('Gaussian', [3, 3],0.5*10);
%  dog = gaussian1 - gaussian2;
%  dogFilterImage = conv2(double(img1), dog, 'same');
%  imshow(dogFilterImage);
% % contrast Equaization
  resultantImg=histeq(img1);
%  imshow(img1);

end
