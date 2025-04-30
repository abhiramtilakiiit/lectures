# Hypothesis testing

## What is a hypothesis?

-   It is an educated guess
-   Can be supported or refuted through experimentation
-   It can be only disproven not proven

### Example 1

-   H0 - All forms of teaching are the same
-   HA - Offline is better

### Example 2

-   H0 - Leopards and Tigers are equally strong
-   H1 - Tigers are stronger than Leopards
-   H2 - Leopards are stronger than Tigers

### Example 3

-   H0 - Excercise does not affect anxiety
-   H1 - Excercise decreases anxiety
-   H2 - Excercise increases anxiety

## Types of variables

-   Independent Variabes (Controlling) - Not changed by other variables
    in experiment
-   Dependent Variabe (Outcome) - Value is affected by other independent
    variables

## Directionality in a hypothesis

This prediction of H1 are usually based on past research, accepted
theory, extensive experience or literature on the topic.

Or else correlation is not causation.

If you have a direction then use one-tailed test, otherwise mostly two
tailed test.

### When to not use one-tailed test

-   If two tailed failed to reject H0 then you can't use one tailed
-   If you don't have a proper reason and only tried to attain
    significance, then one tailed shouldn't be used

If you don't use these tests properly they won't be replicable.

## Confidence Intervals

CI = sample mean +- z \* std / sqrt(n)

-   z = confidence level value ( depends on significance level )
-   alpha (significance level) = 100% - confidence level (in percentage
    like 95%)

## Types of Errors

-   alpha or False Positive rate (Type-1): Observe a difference when non
    exists
-   beta or False Negetive rate (Type-2): Observe no difference when
    there is one.

## P-Values

P value tells how much of the H0 is false.

If p-value is below alpha (significance level) (False-Positive rate),
then we reject H0

P-value is composed of three parts:

-   The probability random chance would result in the observation.
-   The probability of observing something that is equally rare.
-   The probability of something more rare, or something more extreme.

Basically lesser the p-value (probabilistic value) more special our
observation is.

We add second and third thing because, if the data consists of a lot of
rare stuff, it would make it less rare. Like if you have animals with
different species but each species has very less population, then
finding one of those species is not that rare. It is rare if all other
species are more in number.

## Measuring P-Values for normal curves

Let's say we have a population which has mean and std deviation and we
have (a1, b1) as the CI at 95%. If we measure a new height and it lies
in the a1,b1 range, then we can make a conclusion that this height comes
from this distribution, but if it is outside that (5% here is the
threshold), then we can make a conclusion that probably the value came
from some other distribution.

Thus p-value is only good to reject the null hypothesis.

## P-Hacking (multiple testing problem)

Just keep finding a H_i until I find one that has p \< 0.05.

Multiple Comparisons Problem: The more tests you do on the data, the
more likely you will mistakenly claim an effect when there is none.

## Power

Probability of correctly rejecting the null hypothesis. It only applies
when the difference actually exists and we know, or else we will be
hacking.

Improving the power helps reduce the type-II error. Generally try to
keep the power above 0.8, when you know you have a difference.

Power obviously depends on the alpha value, but also the samples sizes.

Just like alpha is significance value, Beta is the power value and
Z_alpha, Z_beta, means the points on the normal to get the required
value.

## Effect Size

It is a standardized measure of strength of the phenomenon. Means it
measures the size of the difference between two things.

We use different metrics of Effect Size based on the scenario:

-   Correlation between two variables - R2 (pearson's R)
-   Regression - The regression coefficient (B0, B1)
-   Mean differences in t-tests - Cohen's D (differences in mean divided
    by pooled variance)
-   Mean differences in ANOVA - Eta

## Basic formula of sample size

Some shit 2 x (z_a + z_b)^2 x var / size of difference^2

## Normality test

-   Shapiro-Wilk test \< 50
-   Kolmogorov-Shmirnov test \> 50

If P-value of normality test holds it is called parametric.

## T-test

First calculate df value, which is n1 + n2 - 2, (for independent t-test)
Then calculate the t Stat = t = mean(first) - mean(second) /
sqrt(var1/n1 + var2/n2)

Use the table to find the critical t value for given df and alpha
values, if the t state is bigger than t critical, then null hypothesis
fails.

-   For single, there is no second sample and we take 0.
-   For paired t-test, the calculations are a bit different. (mean of
    differences / sqrt(var of differences / n) )

## Correction Methods for multiple comparisons

-   Increase the p-value ( False discovery rate ) ( Benjamini-Hochberg
    method )

-   Correct the alpha (Family wise Error rate ) ( Bonferronic Correction
    )

There is minor difference between the both.

-   FWER - Probability of falsely rejecting the null hypothesis (
    opposite of power ) P (FP \>= 1)

-   FDR - Proportion of false discoveries among all discoveries.
    E\[FP/R\]

They both are same if all the null hypothesis are true, otherwise the
FWER also accounts for only the ones which were actually true but we
rejected.

### Benjamini-Hochberg test

First sort all the p-values in descending order, the

adj pi = pi \* n / (n - i)

OR

adj alpha = alpha \* i / n

when iterating from left to right (i is the index)

### Bon-Ferroni Correction

Bon-Ferroni Corrected alpha = alpha / k ( k is total number of tests )

-   Reduces the type-1 error and increases the type-2 error.
-   It doesn't depend on the structure of the data, but only on the
    number of tests.

### Permutation test

Doesn't assume independence of the two tests, thus permutation tests.

Parts:

-   Specify the H0 and HA
-   Choose test-statistic (observed -\> expect)
-   Determine the distribution of test-statistic
-   Convert test-statistic -\> P-value

Small samples sizes are small or nonparametric, we use permutation
tests. It also doesn't use means and medians.

Bootstrapping is the idea of shuffling the dataset after removing the
labels and dividing into two groups randomly and calculate the test stat
(mean or median). Then keep doing that multiple times like 10000 times.

P-value = % of number of times permutation test stat \> observed
test-stat

In the context of the FDR correction, we have to find the p-value
threshold for the uncorrected p-values, this is done by repeating the
experiment 1000 times with random shuffling and finding the case when
the value at which we get 5% significant results.
