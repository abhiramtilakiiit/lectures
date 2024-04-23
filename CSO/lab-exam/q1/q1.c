#include <stdio.h>
#define ll long long int

ll operations(ll, ll, ll);

int
main() {
    ll M, N, S;
    scanf("%lld %lld %lld", &M, &N, &S);
    printf("%lld\n", operations(M, N, S));
    return 0;
}
