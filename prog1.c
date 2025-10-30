// INSERTION SORT
#include <stdio.h>
void sort(int a[], int n) {
for (int i = 1; i < n; i++) {
int key = a[i], j = i - 1;
while (j >= 0 && a[j] > key) {
a[j + 1] = a[j];
j--;
}
a[j + 1] = key;
}
}
int main() {
int n, a[100];
printf("Enter n: ");
scanf("%d", &n);
printf("Enter %d numbers: ", n);
for (int i = 0; i < n; i++) scanf("%d", &a[i]);
sort(a, n);
printf("Sorted: ");
for (int i = 0; i < n; i++) printf("%d ", a[i]);
}