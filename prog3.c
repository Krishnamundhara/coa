// BINARY SEARCH
#include <stdio.h>
int binarySearch(int a[], int l, int r, int x) {
while (l <= r) {
int m = (l + r) / 2;
if (a[m] == x) return m;
else if (a[m] < x) l = m + 1;
else r = m - 1;
}
return -1;
}
int main() {
int n, a[100], x;
printf("Enter n: ");
scanf("%d", &n);
printf("Enter %d sorted numbers: ", n);
for (int i = 0; i < n; i++) scanf("%d", &a[i]);
printf("Enter number to search: ");
scanf("%d", &x);
int res = binarySearch(a, 0, n - 1, x);
if (res == -1) printf("Not found\n");
else printf("Found at index %d\n", res);
}