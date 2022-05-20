function [ output_args ] = calcDenoiseResult( CleanTensor,NoiseTensor,DenoiseTensor,state ,debug)
%ͳ��ȥ���Ľ��
%  ����ֱ�Ϊ�ɾ�����������������ȥ�������


[sx,sy,sz]=size(CleanTensor);
noise_psnr=zeros(1,sz);%������psnr
denoise_psnr=zeros(1,sz);%ȥ����psnr
denoise_ssim=zeros(1,sz);%ȥ����SSIM
noise_ssim=zeros(1,sz);
denoise_sam=zeros(1,sz);%ȥ����SAM
for i=1:sz
    noise_psnr(1,i)=psnr(NoiseTensor(:,:,i),CleanTensor(:,:,i));%����ͼ���psnr�ȼ�
    
    denoise_psnr(1,i)=psnr(DenoiseTensor(:,:,i),CleanTensor(:,:,i));%ȥ���ͼ���psnr�ȼ�
    
    noise_ssim(1,i)=ssim(NoiseTensor(:,:,i),CleanTensor(:,:,i));
    denoise_ssim(1,i)=ssim(DenoiseTensor(:,:,i),CleanTensor(:,:,i));%ȥ����SSIM�ĵȼ�
    
end
output_args.noise_psnr=noise_psnr;
output_args.denoise_psnr=denoise_psnr;

output_args.noise_ssim=noise_ssim;
output_args.denoise_ssim=denoise_ssim;




if(debug == true)

        psnrtitle=[state ' PSNR'];
        figure;
        subplot(121);hold on
        plot(noise_psnr,'r');
        plot(denoise_psnr,'g');
        title(psnrtitle);
        legend('NOISE','DENOISE');

        ssimtitle=[state ' SSIM'];
        subplot(122);hold on
        plot(noise_ssim,'r');
        plot(denoise_ssim,'g');
        title(ssimtitle);
        legend('NOISE','DENOISE');
end
        mpsnrsig=mean(noise_psnr);
        mpsnrdenoise=mean(denoise_psnr);
        mssimsig=mean(noise_ssim);
        mssimdenoise=mean(denoise_ssim);
        
             fprintf('\n ����ͼ��Ϊ%f dB,SSIMΪ %f ,ȥ���Ϊ %f dB SSIMΪ %f f\n',mpsnrsig,mssimsig,mpsnrdenoise,mssimdenoise);
end

