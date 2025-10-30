// Floyd-Warshall Algorithm
#include <stdio.h>
#define INF 999
int main(){
int n;
printf("Vertices: ");
scanf("%d",&n);
int g[n][n], i, j, k;
printf("Adjacency matrix (%d for no edge):\n", INF);
for(i=0;i<n;i++) for(j=0;j<n;j++) scanf("%d",&g[i][j]);
for(k=0;k<n;k++)
for(i=0;i<n;i++)
for(j=0;j<n;j++)
if(g[i][k]+g[k][j]<g[i][j]) g[i][j]=g[i][k]+g[k][j];
printf("Shortest distances:\n");
for(i=0;i<n;i++){
for(j=0;j<n;j++) printf("%s%d ", g[i][j]==INF?"INF ":"", g[i][j]);
printf("\n");
}
}