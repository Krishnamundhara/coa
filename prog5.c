// FRACTIONAL KNAPSACK PROBLEM
#include <stdio.h>
typedef struct { float w,p,r; } Item;
int main(){
Item a[]={{10,60,0},{20,100,0},{30,120,0}};
int n=3; float W=50, tot=0;
for(int i=0;i<n;i++) a[i].r=a[i].p/a[i].w;
for(int i=0;i<n-1;i++)
for(int j=0;j<n-i-1;j++)
if(a[j].r<a[j+1].r){Item t=a[j]; a[j]=a[j+1]; a[j+1]=t;}
for(int i=0;i<n;i++){
if(W>=a[i].w){ W-=a[i].w; tot+=a[i].p; }
else{ tot+=a[i].r*W; break;}
}
printf("Max profit: %.2f\n",tot);
}