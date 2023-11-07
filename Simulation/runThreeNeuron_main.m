clc
clear

addpath Hill_model\Simulink_Model\
addpath CAD\

c1 = [200 36 35]/255;       % red
c2 = [40 120 181]/255;      % blue
c3 = [248 172 140]/255;     % yellow 
c4 = [119 144 67]/255;      % green

handDamp = 10;
pkRatio = 2;
pdRatio = 2;
sdRatio = 2;
muscleFeedback = 1;
scaleDownS = 0.01 * sdRatio;
scaleDownE = 0.03 * sdRatio;
scaleDownW = 0.02 * sdRatio; 

device = mididevice('Microsoft GS Wavetable Synth');   % only for making actual acoustic sound, comment this if unnecessary.
addpath('Hill_model\Simulink_Model\')

tesArmTaga;
init_muscle;

load ('opt_k.mat');
amplify = 10.0;

%% Colors
colorFinger = [255 190 122];

%% Initial pose
elbowAngle = 10;
iniIndex = 0;
iniMiddle = 0;
iniRing = 0;
fanWan = -1.7; % tune initial wrist position, -2.5 is the pre-tuned value.  add angle -> blue, reduce angle-> red pressed more

equIndexJoint = 20; I2 = -10;I3 = 5;I4 = 5;
equMiddleJoint = 30; M2 = -15; M3 = 10; M4 = 10;
equRingJoint = 20;  R2 = -5; R3 = 10; R4 = 10;
equLittleJoint = 30; L2 = 20; L3 = 20; L4 = 20;

iniThumbX = 5; % Rotation sequence for Thumb finger, X-Y-0
iniThumbY = -30;

iniLittleY = 5; % Rotation sequence for Little finger, Y-X-0
iniLittleX = -5;

%% Stiffness properties
K_thumb = opt_K(1,1);
K_index = opt_K(1,2);
KT1=K_thumb * 20;
KT2=K_thumb * 20;
KT3=K_thumb * 20;
K1=0.1;
K2=K_index * 20;
K3=K_index * 20;
K4=K_index * 20;

ES = 0; % shoulder joint equilium position
KS = KT1; % shoulder joint stiffness
equElbow = -18; % elbow joint equilium position
equWrist = 10; % wrist joint equilium position
pianoDensity = 100 * 0.1;

%% obtain result
angle = [];
velo = [];

s = sim('ArmHand');

%% MIDI generation
T1 = s.note1AngVel.Time;
A1 = rad2deg(s.note1AngVel.Data(:,1));
V1 = 150 * (s.note1AngVel.Data(:,2));

T2 = s.note2AngVel.Time;
A2 = rad2deg(s.note2AngVel.Data(:,1));
V2 = 150 * (s.note2AngVel.Data(:,2));

msg1 = geneMIDI(T1,A1,V1,60); % C4 （middle C is 60）
msg2 = geneMIDI(T2,A2,V2,72);   % C5 （MIDI note number for C5 is 72）

% MIDI output for C4
bpmC4 = [];
for i=1:2:length(msg1)
    bpmC4 = [bpmC4 (msg1(i+1,1).Timestamp - msg1(i,1).Timestamp)];
end
bpmC4 = 60./bpmC4;

% MIDI output for C5
bpmC5 = [];
for i=1:2:length(msg2)
    bpmC5 = [bpmC5 (msg2(i+1,1).Timestamp - msg2(i,1).Timestamp)];
end
bpmC5 = 60./bpmC5;


%% do figure
bpmC4(1,1) = NaN;
bpmC5(1,1) = NaN;
plotTempoTransFig;

%% play the music, only when a piano is connected to your piano.
msg_final = [msg1; msg2];
midisend(device,msg_final);

