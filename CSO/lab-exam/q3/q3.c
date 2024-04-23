#include <stdio.h>
#include <stdlib.h>
#define ll long long int

ll *multiples(ll, ll *);

int
main() {
    ll n;
    scanf("%lld", &n);
    ll *arr = (ll *)calloc(n, sizeof(ll));
    multiples(n, arr);
    for (ll i = 0; i < n; i++) {
        printf("%lld ", arr[i]);
    }
    return 0;
}
