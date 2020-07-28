% Data Analytics --  Task 2

x=csvread('Iris.csv');
[m n]=size(x);
x=x(2:end,1:n-1);
[m,n]=size(x);
X=x;
k=zeros(m,1);
maxiter=300;
figure;
hold on;
previous=0;
for i=1:length(k),
  initial_centroid=kMeansInitCentroids(X,i);
  [centroids, idx]=runkMeans(X,initial_centroid,maxiter);
  idx = findClosestCentroids(X, centroids);
  J=0;
  for j=1:i,
    x_1=X(find(idx(1,:)==j),:)-centroids(j,:);
    J=J+(sum(sum(x_1.*x_1,2))/m);
  endfor
  if i>1,
    plot(i,J,'x','MarkerEdgeColor','k','MarkerSize', 5, 'LineWidth', 2);
    plot([i i-1],[J previous]);
    fprintf('For K = %d ... Cost = %d\n', i,J);
    y='N';
    
    y=input('enter y/Y to stop',"s");
    if y=='y' || y=='Y',
      break
    endif
  endif  
k(i)=J;
previous=J;
    
endfor
hold off;

fprintf('\n');
K=input('ENTER NO. OF CLUSTERS: ');

initial_centroid=kMeansInitCentroids(X,K);
[centroids, idx]=runkMeans(X,initial_centroid,maxiter);
idx = findClosestCentroids(X, centroids);

figure;
hold on;
palette=hsv(K+1);
colors=palette(idx,:);
scatter(X(:,1),X(:,2),15,colors);
plot(centroids(:,1), centroids(:,2), 'x','MarkerEdgeColor','k', 'MarkerSize', 10, 'LineWidth', 3);
fprintf('\n\nPress enter to continue\n');
pause;
