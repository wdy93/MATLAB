dev_col=1;  flag='2D';
ball_center=[5 0];
ball_radius=2;
box_center=[-2 4];
box_radius=0.5;
lb=box_center-box_radius*ones(size(box_center));
ub=box_center+box_radius*ones(size(box_center));
x=[5 -2];                 % starting point



sigma=2;

tau=3/2;  % steplength parameter
lambda=1;

k=1;                        % iteration counter
v=[0,0];
p2=v;
w2=v;
m=1000

fprintf('********** DR1 Algorithm *************\n')
n=10000
alpha=2-1/m
while (k<n)  %k<=maxiter  
    % computing Prox_tau f
    temp_p1=x-tau/2*v-ball_center;
    p1=ball_center+ball_radius*(temp_p1)/max(ball_radius,norm(temp_p1));
    temp_p2=v-sigma/2*x+sigma*p1
    p2=(temp_p2)/max(1,norm(temp_p2))
    w1=alpha*p1-x
    w2=alpha*p2-v
    z1=w1-tau/2*w2
    temp=w2-sigma/2*w1+sigma*z1
    z2=temp-[sigma sigma].*max(lb,min(temp./[sigma sigma],ub))
    new_x = x + lambda*(z1-p1);
    new_v=v + lambda*(z2-p2);
    
    x=new_x;
    v=new_v;
    
k=k+1
    % monitoring area
   y1=p1
   y2=p2
end
