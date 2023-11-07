clc

% gsI = 0.01;
gsI = 0.5;
inhib_sE2e = gsI;
inhib_sF2e = gsI;

inhib_sE2w = gsI;
inhib_sF2w = gsI;

% bt = 0.93;  % 60 bpm
% bt = 1.8;   % 120 bpm
% bt = 4.0;    % 176bpm
%% Parameter for neuron1
s1  = 5.0;
q1  = 1;
tr1 = 1/32;
ta1 = 1/2;
% b1  = 2 * bt;
w12 = 2;
w13 = 2;
%% Parameter for neuron2
s2  = 5.0;
q2  = 1;
tr2 = 1/32;
ta2 = 1/2;
% b2  = 2 * bt;
w21 = 2;
w23 = 2;
%% Parameter for neuron3
s3  = 5.0;
q3  = 1;
tr3 = 1/32;
ta3 = 1/2;
% b3  = 2 * bt;
w31 = 2;
w32 = 2;


%
Tr1 = tr1;
Ta1 = ta1;
Tr2 = tr2;
Ta2 = ta2;
Tr3 = tr3;
Ta3 = ta3;

% s = sim('armTaga.slx');

%% 画图
c1 = [200 36 35]/255; % 红
c2 = [40 120 181]/255;% 蓝
c3 = [248 172 140]/255;% 黄
c4 = [119 144 67]/255;% 绿

% figure;
% % subplot(3,1,1)
% plot(s.tout, s.synY1.Data, 'color',c1, 'linewidth',2);
% % subplot(3,1,2)
% hold on
% plot(s.tout, s.synY2.Data, 'color',c2, 'linewidth',2);
% % subplot(3,1,3)
% hold on
% plot(s.tout, s.synY3.Data, 'color',c4, 'linewidth',2);
% legend('neuron 1 - shoulder','neuron 2 - elbow','neuron 3 - wrist','location','northwest');
% xlabel('Time (s)');
% ylabel('CPG Output (Unitless)');
% set(gcf,'position',[700,400,1200,600]);
% 
% figure
% 
% temp = max(s.synY2.Data, s.synY3.Data);
% plot(s.tout, temp,'k');