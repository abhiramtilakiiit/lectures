# ANOVA

Extension of t-test for multiple groups.

predictor should be categorical and outcome should be quantitative.

-   Kruskal's Wallace test when normality doesn't hold.

-   Homogenity of Variance - Levene Test should be used to make sure
    variances are not too extreme between categories. We use Welch ANOVA
    otherwise.

-   Homogenity of Covariance - For dependent samples, we have to use
    Mauchly's test to get the Sphericity.

If above 2 fail we can transform data into log or exp scale.

## Design type

When we use the same group to perform again, we call that dependent
sample design or factorial design.

## Sample variance

Unlike normal variance, sample variance has n-1 in denominator.

F = var between / var within

-   var between comes from actual effect + error
-   var within is basically error.

Thus F = (effect + error) / error

Var is for comfort called Mean squared.

When calculating between samples variance, multiply by number of
observations also.

## Post-hoc

We measure effect size by using Eta^2 which is SS between / SS within

We avoid t-tests becase if we have many groups, we have to run t-tests
between each of them nC2. Thus number of t-tests increase type-1 or
type-2 errors. We can still do planned comparision but requires
bon-ferroni correction

### Tukey Test

This requires all samples to be of same length. We calculate HSD given
by

HSD = q sqrt(MS within / n)

based on above value if the magnitude of mean difference is greater than
this we take it or not.

### One way repeated measures ANOVA

Used when within sample design is used.

We divide SS within into SS_subjects and SS_error, we need only SS_error

F = MS_between / MS_error

SS_error = SS_within - SS_subjects

-   SS_within is same, per each class find name and add square
    difference.
-   SS_subjects is avg of all different times for that particular
    subject, then SS.

SS_error has df = (n-1)(k-1) when finally using in equation
