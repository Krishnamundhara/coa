// NAVIE STRING
#include <stdio.h>
#include <string.h>
int main(){
char t[100], p[50];
printf("Text: "); scanf("%s", t);
printf("Pattern: "); scanf("%s", p);
int n=strlen(t), m=strlen(p);
for(int i=0;i<=n-m;i++){
int j;
for(j=0;j<m;j++) if(t[i+j]!=p[j]) break;
if(j==m) printf("%d ", i);
}
}