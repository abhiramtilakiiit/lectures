#include <stdio.h>
#define ll long long int

ll palindrome(ll);

int
main() {
    ll num;
    scanf("%lld", &num);
    if (palindrome(num)) {
        printf("True\n");
    } else {
        printf("False\n");
    }
    return 0;
}
