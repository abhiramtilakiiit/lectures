#include<stdio.h>
#include<stdlib.h>
void func(long long* array,long long size, long long * res);
int main()
{
    long long n;
    scanf("%lld",&n);
    long long array[n];
    for(long long i=0;i<n;i++)
    {
        scanf("%lld",&array[i]);
    }
    long long res[n];
    func(array,n,res);
    for(long long i=0;i<n;i++)
    {
        printf("%lld ",res[i]);
    }
    printf("\n");
    return 0;
}