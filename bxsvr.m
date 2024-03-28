function [alpha] = bxsvr(X, Y ,a, b , C,gamma,type)
[m, ~] = size(X);
X = [X ones(m,1)];
alpha = zeros(m,1);
K=kernel(X,X,type,gamma,1);

learning_rate = 0.001;
itn =100;
tol = 1e-6;
vel = zeros(m,1);%v
r = 0.6; %gamma
k = 0.05;
for t=1:itn
     fprintf('\n*****************************iter: %d ******************************\n', t);
    alpha_til = alpha - r*vel;
    T= ones(m,1)+b*(exp(a*(Y-K*alpha_til))-ones(m,1)-a*(Y-K*alpha_til));
    grada_til = K*alpha_til+a*b*C*K*(ones(m,1)./(T.*T))-a*b*C*K*(exp(a*(Y-K*alpha_til))./(T.*T));
    
    vel = r*vel + learning_rate*grada_til;
    alpha = alpha - vel;
    learning_rate = learning_rate*exp(-k*t);
    
    stopCond = max(abs(grada_til));
    fprintf('\n*****************************stopCond: %d ******************************\n', stopCond);
    if (t> 80) && (stopCond < tol)
                disp(' !!!stopped by termination rule!!! ');
        break;
    end  
end
end