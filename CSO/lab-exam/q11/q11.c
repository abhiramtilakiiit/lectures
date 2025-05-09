#include <stdio.h>
#include <stdlib.h>

#define ll long long int

void leftright(ll, ll *, ll *);

int
main() {
    ll n;
    scanf("%lld", &n);
    ll *arr = (ll *)calloc(n, sizeof(ll));
    ll *res = (ll *)calloc(n, sizeof(ll));
    for (ll i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
    }
    leftright(n, arr, res);
    for (ll i = 0; i < n; i++) {
        printf("%lld ", res[i]);
    }
    printf("\n");
    return 0;
}
