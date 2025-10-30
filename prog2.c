// MERGE SORT
#include <stdio.h>
void merge(int a[], int l, int m, int r) {
int i=l, j=m+1, k=0, t[100];
while(i<=m && j<=r)
t[k++] = (a[i]<a[j]) ? a[i++] : a[j++];
while(i<=m) t[k++] = a[i++];
while(j<=r) t[k++] = a[j++];
for(i=0; i<k; i++) a[l+i] = t[i];
}
void mergeSort(int a[], int l, int r) {
if(l<r) {
int m = (l+r)/2;
mergeSort(a,l,m);
mergeSort(a,m+1,r);
merge(a,l,m,r);
}
}
int main() {
int n, a[100];
printf("Enter n: ");
scanf("%d",&n);
printf("Enter %d numbers: ",n);
for(int i=0;i<n;i++) scanf("%d",&a[i]);
mergeSort(a,0,n-1);
printf("Sorted: ");
for(int i=0;i<n;i++) printf("%d ",a[i]);
}