# Simple Linear Regression

Ordinary Least Squares Regression: Try to minimize the sum of square
residuals (MLE, SSres)

## Multiple Linear Regression (MLR)

-   When you have more than one predictor variable (in SMAI we did for d
    all this lite)

## Quantifying Prediction

We need to come up with a score to quantify the fit.

-   R-Squared or the R2 score

Rsq = 1 - SSres / SStotal

Rsq doesn't account for the increase in complexity and increasing
degrees of freedom due to new predictors. Thus we need to use Adjusted
Rsq value.

This Adjustment comes from the logic of ANOVA. Where we use

F = MS btw / MS wit

Here the SSres is like SSwit and

-   SSbtw = SStot - SSwit
-   SSmod = SStot - SSres

Thus we need a final correction of F = MSmod / MSres

which is N-1 / N - k - 1

Thus,

Adj Rsq = 1 - SSres / SStotal (N-1/N-k-1)

Or you can just use the F stat as is F = MSmod / MSres, and it is a good
evaluator.

### Assumptions of Linear regression

-   Normality:
-   Linearity: If not no use of regression
-   Homogenity of Variance: At each level of X,Y the var is almost same
-   Unrelated predictors
-   No outliers: Use the Cook's Distance. if cook's distance is \> 1
    remove and do regression again.

We use VIF for checking Collinearity

### Step regression

PCA, like Occam's razor, we try to remove unneeded stuff, this is
backward.

Forward might be different, but we try to take only the required
predictors.
