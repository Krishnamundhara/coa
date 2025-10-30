// DIJKSTRA'S ALGORITHM
#include <stdio.h>
#define V 5
#define INF 999
int minDist(int d[], int v[]){
int m=INF, idx=-1;
for(int i=0;i<V;i++) if(!v[i] && d[i]<m){m=d[i]; idx=i;}
return idx;
}
int main(){
int g[V][V]={{0,10,0,5,0},{0,0,1,2,0},{0,0,0,0,4},{0,3,9,0,2},{7,0,6,0,0}};
int d[V], v[V]={0};
for(int i=0;i<V;i++) d[i]=INF;
d[0]=0;
for(int c=0;c<V-1;c++){
int u=minDist(d,v); v[u]=1;
for(int i=0;i<V;i++)
if(!v[i] && g[u][i] && d[u]+g[u][i]<d[i])
d[i]=d[u]+g[u][i];
}
printf("Vertex\tDistance\n");
for(int i=0;i<V;i++) printf("%d\t%d\n",i,d[i]);
}