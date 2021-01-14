ball_center=[5 0];
ball_radius=2;
box_center=[3,1.5];
box_radius=1;
lb=box_center-box_radius*ones(size(box_center));
ub=box_center+box_radius*ones(size(box_center));
x=[5 1];                 % starting point



sigma=2;

tau=3;  % steplength parameter
lambda=1;

k=1;                        % iteration counter
v=[0,0];
p2=v;
w2=v;
m=100

fprintf('********** DR1 Algorithm *************\n')
n=10000
alpha=2-1/m
while (k<n)  %k<=maxiter  
    % computing Prox_tau f
    temp_p1=x-tau/2*v-ball_center;
    p1=ball_center+ball_radius*(temp_p1)/max(ball_radius,norm(temp_p1));
    temp_p2=v-sigma/2*x+sigma*p1
    p2=temp_p2-[sigma sigma].*max(lb,min(temp_p2./[sigma sigma],ub))
    w1=alpha*p1-x
    w2=alpha*p2-v
    z1=w1-tau/2*w2
    z2=w2-sigma/2*w1+sigma*z1
    new_x = x +(z1-p1);
    new_v=v + (z2-p2);
    
    x=new_x;
    v=new_v;
    
k=k+1
    % monitoring area
   y1=p1
   y2=p2
end
