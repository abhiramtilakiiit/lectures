#include <stdio.h>
#define ll long long int

ll check_odd(ll);

int
main() {
    ll n;
    scanf("%lld", &n);
    if (check_odd(n)) {
        printf("TRUE\n");
    } else {
        printf("FALSE\n");
    }
    return 0;
}
