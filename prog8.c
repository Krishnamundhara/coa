// TSP Algorithm
#include <stdio.h>
int n, cost[10][10], visited[10], ans=999;
void tsp(int pos, int count, int sum){
if(count==n && cost[pos][0]){
if(sum+cost[pos][0]<ans) ans=sum+cost[pos][0];
return;
}
for(int i=0;i<n;i++)
if(!visited[i] && cost[pos][i]){
visited[i]=1;
tsp(i,count+1,sum+cost[pos][i]);
visited[i]=0;
}
}
int main(){
printf("Enter number of cities: ");
scanf("%d",&n);
printf("Enter cost matrix:\n");
for(int i=0;i<n;i++)
for(int j=0;j<n;j++)
scanf("%d",&cost[i][j]);
visited[0]=1;
tsp(0,1,0);
printf("Minimum tour cost: %d\n",ans);
}