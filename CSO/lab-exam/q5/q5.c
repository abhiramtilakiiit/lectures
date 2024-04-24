#include <stdio.h>
#include <stdlib.h>
#define ll long long int

void rearrange(ll, ll *);

int main() {
  ll n;
  scanf("%lld", &n);
  ll *arr = (ll *)calloc(n, sizeof(ll));
  for (ll i = 0; i < n; i++) {
    scanf("%lld", &arr[i]);
  }
  rearrange(n, arr);
  for (ll i = 0; i < n; i++) {
    printf("%lld ", arr[i]);
  }
  printf("\n");
  return 0;
}
