clc;clear;
% filename= strcat('./Diabetes','.csv');
% s=load(filename);
% x=s(:,2:end);
% y=s(:,1);
% [l,~]=size(x);
rand('state',0);
train_data= 0:0.1:5;
train_label= train_data .* cos(train_data);
a=1;
b=1;
c=1;
gamma=1;
[alpha] = bxsvr(train_data,train_label,a,b,c,gamma,'rbf');





