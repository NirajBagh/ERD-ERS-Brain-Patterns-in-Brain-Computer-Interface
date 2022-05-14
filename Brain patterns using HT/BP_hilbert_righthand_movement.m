%Right movement using AM-EEG Modulation
%% Coding by Niraj Bagh
%% extraction of all Right hand trials
y1=find(y_train==2); %find all left hand trials assign to 1
for i=1:length(y1)
      C3_trials_right(:,i)=x_train(:,1,y1(i));%% C3 for Left hand trials
      X(:,i)=C3_trials_right(:,i); 
      C4_trials_right(:,i)=x_train(:,3,y1(i));%% C4 for left hand trials
      Y(:,i)=C4_trials_right(:,i); 
end
[m,n]=size(X);
fs=128;
ts=1/fs;
t1=(0:m-1)*ts;
%%%ploting of signal
figure;
plot(t1,X(:,1), 'r')
hold on;
plot(t1,Y(:,1), 'b')
xlabel('Time (Sec)')
ylabel('Amp(Volt)')
title('Raw EEG signals from a single trial during RH imagination')
legend('C3','C4')

%% 1)a)-- ---alpha band pass (8-12 Hz) filtering for C3
for i=1:n
d1 = fdesign.bandpass('N,F3dB1,F3dB2',8,8,12,fs);
Hd1 = design(d1,'butter');
C3_filt_alpha(:,i)= filter(Hd1,X(:,i)); %% filtered signal
C3_filt_alpha_mag=abs((C3_filt_alpha).^2);
hilb_alpha_C3=abs(hilbert(C3_filt_alpha)); % envelope from HT
%C3_mag_alpha=abs((C3_filt_alpha).^2); %% power of signal
end
%% ----HT method for ERD/ERS calculation for C3 channel----------------------------------------------------
C3_filt_alpha_mag_avg=sum(C3_filt_alpha_mag,2)/size(C3_filt_alpha_mag,2);
base_avg_filtered_C3 = C3_filt_alpha_mag_avg(128:384); % power before visual cue 1-3 second or baseline
base_avg_C3=mean(base_avg_filtered_C3); % avg of baseline
ERD_alpha_C3_filtered_avg_RH = (C3_filt_alpha_mag_avg- base_avg_C3)/base_avg_C3 * 100;
hilb_alpha_avg_C3 = sum(hilb_alpha_C3,2)/ size(hilb_alpha_C3,2); % average of all HT of each trials
base_avg_HT_C3 = hilb_alpha_avg_C3 (128:384); 
base_avg_HT_C3=mean(base_avg_HT_C3);
ERD_alpha_C3_HT_RH= (hilb_alpha_avg_C3 -base_avg_HT_C3)/base_avg_HT_C3 * 100;

%%% FOR C4 ELECTRODE

%% 1)b)-- ---alpha band pass (8-12 Hz) filtering for C4 channel
for i=1:n
d1 = fdesign.bandpass('N,F3dB1,F3dB2',8,8,12,fs);
Hd1 = design(d1,'butter');
C4_filt_alpha(:,i)= filter(Hd1,Y(:,i)); %% filtered signal
C4_mag_alpha=abs((C4_filt_alpha).^2); %% power of signal
hilb_alpha_C4=abs(hilbert(C4_filt_alpha)); % envelope from HT

end
%% ----HT method for ERD/ERS calculation for C4 channel----------------------------------------------------
C4_mag_alpha_avg=sum(C4_mag_alpha,2)/size(C4_mag_alpha,2);
base_avg_filtered_C4 = C4_mag_alpha_avg(128:384); % power before visual cue 1-3 second or baseline
base_avg_C4=mean(base_avg_filtered_C4); % avg of baseline
ERD_alpha_C4_filtered_avg_RH = (C4_mag_alpha_avg- base_avg_C4)/base_avg_C4 * 100;
hilb_alpha_C4_avg = sum(hilb_alpha_C4,2)/ size(hilb_alpha_C4,2); % average of all HT of each trials
base_avg_HT_C4 = hilb_alpha_C4_avg(128:384); 
base_avg_HT_C4=mean(base_avg_HT_C4);
ERD_alpha_C4_HT_RH= (hilb_alpha_C4_avg-base_avg_HT_C4)/base_avg_HT_C4 * 100;


%% comparision
figure;
subplot(2,1,1);
plot(t1,ERD_alpha_C3_filtered_avg_RH,'r');
hold on;
plot(t1,ERD_alpha_C4_filtered_avg_RH,'b');
xlabel('Time ( Sec)')
ylabel('%ERD/ERS')
title('(a) ERD/ERS patterns using Band Power method during RH imaginationst')
legend('C3','C4')
subplot(2,1,2);
plot(t1,ERD_alpha_C3_HT_RH,'r');
hold on;
plot(t1,ERD_alpha_C4_HT_RH,'b');
xlabel('Time (Sec)')
ylabel('%ERD/ERS')
title('(b) ERD/ERS patterns using Hilbert transform method during RH imaginations')
legend('C3','C4')






















