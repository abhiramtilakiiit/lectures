# Categorical test

Nominal and Ordinal variables are called categorical variables.

## Choosing a statistical test

Quantitative:

-   If the predictor is quantitative, then it is called regression.

Categorical:

-   If the predictor is categorical, and outcome is quantitative, we can
    use comparision of means and stuff.
-   If the predictor is categorical, and outcome is categorical, we use
    non-parametric tests

Comparision of means has some types to it:

-   Two samples - t-test ( paired t-test when samples are from the same
    population at different times or something )
-   More than two samples - ANOVA and MANOVA

For categorical tests where we try to measure the difference not
correlation, we use Unrelated Chi-square test, Related Binomial sign
test.

For nonparametric, we have Mann-Whitney U test and Wilcoxon's T test.

### Non-parametric counter parts

-   Spearman's R is used in place of Pearson's R when both predictor and
    outcome is quantitative.
-   When both are categorical, Chi-Square test is used instead of
    Pearson's R.
-   Sign test is used when input is categorical and output is
    Quantitative, used in replacement to one-sample t-test
-   Kruskal-Wallis H replacement for ANOVA, ANOSIM for MANOVA.

Important ones are:

-   Wilcoxon Rank-Sum test is used in replacement for independent t-test
-   Wilcoxon Signed-rank test is used in replacement for paired t-test

### Chi-square test

The formulae is:

xc^2 = summation sum (Oi - Ei)^2/ Ei

Applications

-   Goodness of fit, tells how good a sample fits the theoratical PDF
    (need not be normal)

This is simple, we have the fit value and the Eis thus just compare with
Oi.

df = c - 1 (c - number of categories )

Doing this is simple just

-   Test of independence between two variables. Needs us to calculate
    the expected frequencies (Ei).

We have to calculate

df = (r - 1) (c -1)

r - rows, c - colsh

Using the Df we need to find the critical Chi^2 value corresponding to
the alpha value. If calculated Chi^2 is greater than the critical, then
we Reject the null hypothesis.

#### Chi-squared for independence

There are two types to this:

-   Relationship between two seperate variables ( correlation between
    extraversion and comfort level )
-   Relationship between two conditions ( difference between comfort
    level between introverts and extroverts )

Expected freqencies = row total x column total / n (total of all)

-   Effect Sizes: there are two variables, Phi Coefficient (sqrt(Chi^2 /
    n)) and Crammer's V (sqrt(Chi^2 / n x df)).

#### Median test

used for quantitative outcomes, uses Chi^2 underneath. This is basically
just divide the values into high, medium and low.

#### Limitations

-   Not continuous: Each person must fall into one of the cells.
-   Only frequencies are studied not means, percentages.
-   Very low values \< 5 cause problems.
-   Doesn't measure the strength of the association.

### Mann-Whitney U test

Replacement for individual t-test. Instead of measuring the mean
difference, and used on ordinal data. If not ordinal convert to ordinal
data.

Works on the idea that if we rank all the values, one will have more
higher values than other.

According to this method, just find U1 and U2, sum of all ranks. And use
a table to find significance

### Wilcoxon Signed Rank test

This is also ordinal, if not make it. This is useful for within subject
design (when the same subject changes values over time)

Find the difference before vs after and rank based on magnitude. Now T+
is the sum of positive difference's ranks and T- is the sum of negative
differences ranks. Find the minimum of both and compare it to the table.

#### Breaking ties

To break tie, take all the avg of all the ranks which tie.

### Binomial Sign test

Same used for within sample data. Here we use for categorical data or we
can convert to categorical by taking difference and the sign of it.

Basically the idea is if it is binomial, then we have two classes, and
using probability of class A is p, then x be the number of elements in
the class and n be total.

-   nCx p^x (1-p)^(n-x)




