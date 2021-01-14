
ball_center=[5 0];
ball_radius=2;
box_center=[3,1.5]
box_radius=1;
lb=box_center-box_radius*ones(size(box_center));
ub=box_center+box_radius*ones(size(box_center));
x=[5 1];                 % starting point

m=10
alpha=2-1/m
k=1;                        % iteration counter
n=1000

fprintf('********** DR1 Algorithm *************\n')

while (k<n)   
    y=max(lb,min(x,ub))
    temp=alpha*y-x
    z=[5,0]+2*temp/max(ball_radius,sqrt(temp(1,1)^2+temp(1,2)^2))
    x_new=x+z-y
    x=x_new
    k=k+1; 
    yopt=y
end
