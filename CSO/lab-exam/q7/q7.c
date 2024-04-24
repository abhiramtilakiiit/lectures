#include <stdio.h>
#include <stdlib.h>
#define ll long long int

ll maxsum(ll, ll, ll *);

int main() {
  ll n, b;
  scanf("%lld %lld", &n, &b);
  ll *arr = (ll *)calloc(n, sizeof(ll));
  for (ll i = 0; i < n; i++) {
    scanf("%lld", &arr[i]);
  }
  printf("%lld\n", maxsum(n, b, arr));
  return 0;
}
