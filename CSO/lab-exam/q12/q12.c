#include <stdio.h>
#define ll long long int

ll krishnamurthy(ll);

int main() {
  ll n;
  scanf("%lld", &n);
  if (krishnamurthy(n)) {
    printf("True\n");
  } else {
    printf("False\n");
  }
  return 0;
}
