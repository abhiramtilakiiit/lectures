#include <stdio.h>
#define ll long long int

ll gcd(ll, ll);

int main() {
  ll n, m;
  scanf("%lld %lld", &n, &m);
  printf("%lld\n", gcd(n, m));
  return 0;
}
