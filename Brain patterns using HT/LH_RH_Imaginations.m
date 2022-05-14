LH_pattern_BP=(ERD_alpha_C3_filtered_avg_LH)-(ERD_alpha_C4_filtered_avg_LH);
RH_pattern_BP=(ERD_alpha_C3_filtered_avg_RH)-(ERD_alpha_C4_filtered_avg_RH);
LH_pattern_HT=(ERD_alpha_C3_HT_LH)-(ERD_alpha_C4_HT_LH);
RH_pattern_HT=(ERD_alpha_C3_HT_RH)-(ERD_alpha_C4_HT_RH);

%% comparision
figure;
subplot(2,1,1);
plot(t1,LH_pattern_BP,'r');
hold on;
plot(t1,RH_pattern_BP,'b');
xlabel('Time ( Sec)')
ylabel('%ERD/ERS pattern difference')
title('(a) LH and RH imaginations using Band Power')
legend('LH','RH')
subplot(2,1,2);
plot(t1,LH_pattern_HT,'r');
hold on;
plot(t1,RH_pattern_HT,'b');
xlabel('Time (Sec)')
ylabel('%ERD/ERS pattern difference')
title('(b) LH and RH imaginations using Hilbert Transform')
legend('LH','RH')

