cf1 = [250 127 111]/255;    % 红
cf2 = [130 176 210]/255;    % 蓝
cf3 = [255 190 122]/255;    % 黄
cf4 = [142 207 201]/255;    % 绿
cf5 = [190 184 220]/255;    % 紫色
cf6 = [153 153 153]/255;    % 灰

cp1 = [248 172 140]/255; % 黄
cp2 = [40 120 181]/255; % 蓝色


t = s.tout;
% do MIDI figure
bpmC4(1,1) = NaN;
bpmC5(1,1) = NaN;
kn = 1:1:length(bpmC4);
figure
pC4 = plot(kn, bpmC4, 'color',c1,'Marker', 'd','MarkerSize',8);
hold on
% plot(kn, bpmC4, 'color',[0 0 0 0.5],'LineStyle','--','LineWidth',2);
pC5 = plot(kn, bpmC5,'color',c2,'Marker', 'd','MarkerSize',8);
% plot(kn, bpmC5, 'color',[0 0 0 0.5],'LineStyle','--','LineWidth',2);

xlabel('Number of Keystrokes','FontSize',12,'FontWeight','bold');
ylabel('Tempo (BPM)','FontSize',12,'FontWeight','bold');
legend('Note C4', 'Note C5');
fontsize(gcf,14,"points");

% pSmallBPM = line([0 20], [60  60],'linewidth',1);
% hold on
% pMidBPM = line([0 20], [120 120],'linewidth',1);
% hold on
% pBigBPM = line([0 20], [176 176], 'linewidth',1);
ylim([30 240]);
set(gcf,'position',[100,100,1800,300]);
box off
pC4.LineStyle = '--';
pC4.Marker = 'd';
pC4.MarkerSize = 14;
pC4.MarkerFaceColor = c1;

pC5.LineStyle = '--';
pC5.Marker = 'd';
pC5.MarkerSize = 14;
pC5.MarkerFaceColor = c2;

% pBigBPM.LineStyle = '--';
% pBigBPM.Color = [0 0 0 0.5];
% 
% pMidBPM.LineStyle = '--';
% pMidBPM.Color = [0 0 0 0.5];
% 
% pSmallBPM.LineStyle = '--';
% pSmallBPM.Color = [0 0 0 0.5];

% end do MIDI figure

%% begin neuron acitivity figure
n1 = s.nS2F.Data; 
n2 = s.nS2E.Data - 5 * 1;
n3 = s.nE2E.Data - 5 * 2; 
n4 = s.nE2F.Data - 5 * 3; 
n5 = s.nW2E.Data - 5 * 4; 
n6 = s.nW2F.Data - 5 * 5; 
figure
set(gcf,'position',[100,100,1800,300]);
plot(t, n1, 'color','k', 'linewidth',2);
hold on
plot(t, n2, 'color','k', 'linewidth',2);
plot(t, n3, 'color','k', 'linewidth',2);
plot(t, n4, 'color','k', 'linewidth',2)
plot(t, n5, 'color','k', 'linewidth',2)
plot(t, n6, 'color','k', 'linewidth',2)
box off
axis off;
% xlabel('Time (s)','FontSize',12,'FontWeight','bold');
% ylabel('Tempo (BPM)','FontSize',12,'FontWeight','bold');
% legend('Note C4', 'Note C5');

figure
Ax = [0 4 6 8 10 14 16];
Ay = [1.86 3.6 8 3.6 1.86 8 1.86];
Bx = [4 6 8 10 14 16 20 ];
By = [1.86 3.6 8 3.6 1.86 8 1.86];
X_strength = [Ax; Bx];
Y_strength = [Ay; By];

line(X_strength, Y_strength,'color',c1,'linewidth',5);
set(gcf,'position',[100,100,1800,100]);
axis off
% end neuron  figure

%% begin joint angle plot

figure;
set(gcf,'position',[100,100,1800,500]);
Ang_S = rad2deg(s.ang_shoulder);
Ang_E = rad2deg(s.ang_elbow);
Ang_W = rad2deg(s.ang_wrist);

subplot(3,1,1);
plot(s.tout, Ang_S, 'color',cf1, 'linewidth',3);
fontsize(gcf,18,"points");
ylim([-1 1]);
set(gca,'xtick',[]);
box off;
ylabel('\theta (deg)','FontSize',12,'FontWeight','bold');

subplot(3,1,2);
plot(s.tout, Ang_E, 'color',cf2, 'linewidth',3);
fontsize(gcf,18,"points");
ylabel('\theta (deg)','FontSize',12,'FontWeight','bold');
ylim([-23 -18]);
set(gca,'xtick',[]);
box off

subplot(3,1,3);
plot(s.tout, Ang_W, 'color',cf3, 'linewidth',3);
fontsize(gcf,18,"points");
ylabel('\theta (deg)','FontSize',12,'FontWeight','bold');
ylim([5 13]);
box off
% end joint figure

%% begin fingertip plot
D_thumb = 1e3 * s.thumbZ.Data(:,1);
D_little = 1e3 * s.littleZ.Data(:,1) + 2;
figure
set(gcf,'position',[100,100,1800,300]);
% subplot(2,1,2)
plot(s.tout, D_thumb, 'color', cf1, 'linewidth',3);
hold on;
plot(s.tout, D_little, 'color',cf2, 'linewidth',3);
fontsize(gcf,14,"points");
legend('Thumb','Little Finger');
xlabel('Time (s)');
ylabel('Z (mm)','FontSize',12,'FontWeight','bold');
ylim([14 31]);
box off
% end fingertip plot

% msg_final = [msg1; msg2];
% midisend(device,msg_final);

%% 画图
c1 = [200 36 35]/255; % 红
c2 = [40 120 181]/255;% 蓝
c3 = [248 172 140]/255;% 黄 
c4 = [119 144 67]/255;% 绿

%% make video
% Video_3_trans_Video;