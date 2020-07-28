 %DATA ANALYTICS -- TASK 1
 
 % Load Training Data
fprintf('LOADING and VISUALIZING DATA ...\n')
data=load('study.txt');

x=data(:,1);
y=data(:,2);

% m = Number of examples
m=length(y);


% Plot training data
plotData(x,y)
fprintf('Program paused. Press enter to continue.\n');
pause;
fprintf('\n\n\n');

fprintf('LINEAR REGRESSION WITH FEATURE NORMALIZATION\n');

[x1 mu sigma] = featureNormalize(x);
X=[ones(m,1) x1];


theta=zeros(2,1);

costFunction=@(t) computeCost(X,y,t);
options=optimset('MaxIter',200,'GradObj','on');
finaltheta=fmincg(costFunction,theta,options);
fprintf('\n\n\n');
fprintf('PLOTTING THE TRAINED LINEAR REGRESSION\n');
hold on;
plot(x,X*finaltheta,'-')
legend('Training data', 'Linear regression');
hold off 
fprintf('\n\n\n');
fprintf('PREDICTED SCORE FOR STUDY HOUR 9.25 \n');
[1 ((9.25-mu)/sigma)]*finaltheta

fprintf('\n\n\n');
fprintf('\n\n\n');
fprintf('LINEAR REGRESSION WITHOUT FEATURE NORMALIZATION\n');
X=[ones(m,1) x];

theta=zeros(2,1);
J=computeCost(X,y,theta);
[J,grad]=computeCost(X,y,theta);
costFunction=@(t) computeCost(X,y,t);
options=optimset('MaxIter',200,'GradObj','on');
finaltheta=fmincg(costFunction,theta,options);
fprintf('\n\n\n');
fprintf('PREDICTED SCORE FOR STUDY HOUR 9.25 \n');
[1 9.25]*finaltheta

