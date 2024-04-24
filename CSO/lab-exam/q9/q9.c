#include <stdio.h>
#include <stdlib.h>
#define ll long long int

ll first(ll, ll *);

int
main() {
    ll n;
    scanf("%lld", &n);
    ll *arr = (ll *)calloc(n, sizeof(ll));
    for (ll i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
    }
    printf("%lld\n", first(n, arr));
    return 0;
}
