// N- QUEEN
#include <stdio.h>
#define N 4
void printBoard(int b[N][N]) {
for (int i = 0; i < N; i++, printf("\n"))
for (int j = 0; j < N; j++)
printf("%c ", b[i][j] ? 'Q' : '.');
}
int isSafe(int b[N][N], int r, int c) {
for (int i = 0; i < c; i++) if (b[r][i]) return 0;
for (int i = r, j = c; i >= 0 && j >= 0; i--, j--) if (b[i][j]) return 0;
for (int i = r, j = c; i < N && j >= 0; i++, j--) if (b[i][j]) return 0;
return 1;
}
int solve(int b[N][N], int c) {
if (c == N) return 1;
for (int i = 0; i < N; i++) {
if (isSafe(b, i, c)) {
b[i][c] = 1;
if (solve(b, c + 1)) return 1;
b[i][c] = 0;
}
}
return 0;
}
int main() {
int b[N][N] = {0};
if (solve(b, 0)) printBoard(b);
else printf("No solution\n");
}