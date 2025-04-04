# BAPI teaches BRSM

## Data Organization

-   Involves identifying variables and categorizing them into different
    types.
-   Deal with missing data by replacing with mean

## Visualize

### Why we visualize

Even though some piece of data has

-   same mean
-   same std deviation and correlation
-   same regression line

They can be vastly different in how they are spread out if we plot them.
Thus individual metrics like above mentioned don't give a good clarity
on how the data exists.

Visualization helps us to:

-   Make initial guesses about data distributions
-   Gives us the direction of effect, thus help reach conclusions
-   Helps find outliers or errors (0 value or NaN value)
-   Visualization acts as a tool to present our results (legally or not)

#### What makes a good visualization

-   Reduces cognitive load. **Less is more**, **Simplicity**,
    **Relevancy** (easy for audience to comprehend metrics)
-   Storytelling: convince the reader, and provide a motive
-   Color Consistency:
    -   Same colors accross multiple charts
    -   Avoid using colors with less contrast
    -   Conventional colors should have conventional meanings ( green is
        good, red is bad )
    -   Check the output in grayscale too, for colorblind (inclusion)
-   Accurate scaling - (can use kink but use only when the actual graph
    is on the side)
-   Explain from missing data
-   Labelling:
    -   Label axes correctly and consistently across all charts
    -   Avoid using acronyms that are not too popular
    -   Make chart title concise and description
    -   Use a legend
    -   Use symbols consistently

#### Types of Charts

-   Pie chart - when there is piechart, always specify percentages in
    the legend. If all values are similar avoid using this
-   Bar chart - Used for almost everything, nominal. When oridinal, use
    historgram, when continuous use bins or use line plot.
-   Area Plots - Area plots, they only work well for certain types of
    data, better version of pie chart
-   Waffle Plots - better looking version of area plots, works everytime

#### Tufty's design principles

-   Self-explanation of the graph is important ( no need for a narrator)
    -   Effect in graph -\> Effect in the data
    -   Minimize the Lie factor
-   Use the least ink (don't use text to write paragraphs in a graph)
-   Display greatest amount of imformation you can
-   Emphasize visual comparisions and relationships

### How to pick a plot

#### Based on what data

#### Initial data vs final results visualization

-   Initial Data:
    -   Histogram
    -   Scatter Plot
    -   Box plot
    -   Pie Charts
    -   Bar Charts
    -   Mosaic Plot
    -   Violin Plot
    -   Rain-Drop
-   Final Results:
    -   Funnel Plot
    -   SpiderPlot/Radar Chart
    -   Radial Heat Map
    -   Circos plot
    -   Streamgraph

Plots that have emphasis to mean and variance have outlier detection
capabilities (histogram, box,violin plot)

#### Pie charts vs. Bar charts

Use pie charts when:

-   Less number of categories (rely on less colors)
-   slices should be differentiable
-   total adds upto 100%

Use bar chart when:

-   Numbers are near to each other (side-by-side viewing)
-   Don't add upto 100%

#### Mosaic Plots

Used for cases when there are multiple categorial variables in each
value and there are nominal values. (stacked bar plot)

#### Temporal Plots

Showing change over time:

-   Bar chart
-   Line chart
-   Stream graph

#### Proportions

-   Pie Chart Preferrable
-   Bar charts work sometimes
-   Stream charts also work
-   Area plots

#### Data Distributions

-   Histograms
-   Box plot
-   Violin plots
-   Rain drop

#### Group Differences

Same as above, only Histogram is called bar graph and x-axis changes

#### Relationships between Variables

-   Scatter plots (correlation graphs) and Bubble plots
-   Circos plot
-   Heat maps

#### Geographical Data

### Bad design and misleading graphs

Already covered about

## Normal Distributions

-   A bell shaped mathematical curve describing how values are
    distributed.
-   Inferential Statistics required that inferential statistics are
    normally distributed and when we collect samples we assume it is
    normal.

No matter what mean and std are:

-   $\\mu - \\sigma$ and $\\mu + \\sigma$, is about 68%
-   $\\mu - 2\\sigma$ and $\\mu + 2\\sigma$, is about 95%
-   $\\mu - 3\\sigma$ and $\\mu + 3\\sigma$, is about 99.7%

Almost all values fall within 3 standard deviations.

### Skewed Distributions

-   Resembles an exponential distributions
-   They are not useful for statistics by default

Types of skews:

-   Negetive Skew: Results from easy experiment (a lot of high scores)
-   Positive skew: Results from hard tests ( a lot of low scores ) like
    reaction times
-   Bimodal: Two distinct peaks, probable indications that there is
    groupings, (completion time of marathon runners)

### Normality in real world data

-   Real world data is skewed

### Testing normality

-   QQ graph is a graphical technique that can be used to any
    theoratical data
-   Kolmogorov-Smirnov (\>= 50)
-   Shapiro-Wilk (\< 50)
-   Anderson-Darling ( modified Kolmogorov shi )
-   Lilliefors test

For non-normal data:

-   Transform to normal by using log or sqrt or some test.
-   If still not normal use non-parametric tests
-   If you have different groups, (bimodal), both should be evaluated to
    normality

### Normality Transforms

-   Moderately positive skewness - sqrt{x}
-   Substantially positive skewness - log(x)
-   Moderately negative skewness - sqrt{k-x}
-   Substantially negative skewness - log(k-x)

Box-cox transformation uses a hyperparameter lambda and only applies to
positive values (its like a positive distribution).

$$ w_t = \\frac{y_t^\\lambda - 1}{\\lambda} $$

### Pearson's R

Used to measure correlation:

$$ r = sumof(x-x_m)(y-y_m) / std(x)\*std(y)$$

This is when both are quantitative variables, other varialbes have
biserial way to get r.

Pearson's R is very sensitive to outliers

### Sphearman's Rho

This deals with ordinal data. Spearman's correlation occurs the best
when there is a one to one monotone function.

This is 1 when there is a monotonically increasing and -1 when
decreasing, when mixed it is same as pearson's R and is non-parametric
(doesn't assume normal)

### Strength and Significance

Strong relationships shown by correlation coefficient close to +1/-1
needs large sample size etc, we just can't conclude stuff.

When we have less number of data we find fake correlations, (you can
test by just plotting random low number of x,y)

## Partial Correlation

-   Measure of association between two variables, when the third
    variable is controlled or adjusted. In the formula we subtract the r
    values of the controlled one, to the required correlation and divide
    by the normalizing factor of both these.
-   Measure of the association between two variables, when the third
    variable is controlled only for one of the variables. The formula is
    similar to partial correlation except we only divide by the
    normalizing factor for the variable which correlates.
