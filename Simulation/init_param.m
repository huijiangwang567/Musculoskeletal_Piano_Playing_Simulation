clc;
clear all;
% From paper Matsuoka 1987

% It can be seen that the
% rhythm frequency is positively correlated to the parameter
% b, and is negatively correlated to the rise time
% constant T~, the adaptation time constant Ta, and the
% synaptic weights of the mutual inhibition, al2 and a21.


%% Parameter for neuron1
s1  = 5.0;
q1  = 1;
Tr1 = 0.025;
Ta1 = 0.5;
b1  = 1.5;
w12 = 1.5;

%% Parameter for neuron2
s2  = 5.0;
q2  = 1;
Tr2 = 0.025;
Ta2 = 0.5;
b2  = 1.5;
w21 = 1.5;

%% 

% 
% % Parameter for neuron1
% s1  = 1;  
% q1  = 1;  % change q1,q2 can change the width of peak
% Tr1 = 0.25;
% Ta1 = 0.5;
% b1  = 2.5;
% w12 = 2.5;
% 
% % Parameter for neuron2
% s2  = 1;
% q2  = 1;
% Tr2 = 0.25;
% Ta2 = 0.5;
% b2  = 2.5;
% w21 = 2.5;
% % 
% % %% Parameter for neuron1
% % s1  = 5.0;
% % q1  = 1;
% % Tr1 = 1/32;
% % Ta1 = 1/2;
% % b1  = 2.0;
% % w12 = 2.0;
% % 
% % %% Parameter for neuron2
% % s2  = 5.0;
% % q2  = 1;
% % Tr2 = 1/32;
% % Ta2 = 1/2;
% % b2  = 2.0;
% % w21 = 2.0;
