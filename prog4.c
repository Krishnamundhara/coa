// DIJKSTRA'S ALGORITHM

#include <stdio.h>
#define INF 999

int main() {
    int n, source;
    printf("Enter number of vertices: ");
    scanf("%d", &n);

    int cost[n][n], dist[n], visited[n];

    printf("Enter adjacency matrix (%d for no edge):\n", INF);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &cost[i][j]);
        }
    }

    printf("Enter source vertex (0 to %d): ", n - 1);
    scanf("%d", &source);

    // Initialization
    for (int i = 0; i < n; i++) {
        dist[i] = cost[source][i];
        visited[i] = 0;
    }

    dist[source] = 0;
    visited[source] = 1;

    // Dijkstra’s algorithm
    for (int count = 1; count < n - 1; count++) {
        int min = INF, u;

        // Find vertex with minimum distance
        for (int i = 0; i < n; i++) {
            if (!visited[i] && dist[i] < min) {
                min = dist[i];
                u = i;
            }
        }

        visited[u] = 1;

        // Update distances
        for (int v = 0; v < n; v++) {
            if (!visited[v] && dist[u] + cost[u][v] < dist[v]) {
                dist[v] = dist[u] + cost[u][v];
            }
        }
    }

    printf("\nShortest distances from vertex %d:\n", source);
    for (int i = 0; i < n; i++) {
        if (dist[i] == INF)
            printf("%d -> %d = INF\n", source, i);
        else
            printf("%d -> %d = %d\n", source, i, dist[i]);
    }

    return 0;
}
