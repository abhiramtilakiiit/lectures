# Quiz 2 notes

## Applications of classifications

- Text classification

  - Classify emails into spam
  - Classify search results

- Risk Management / Fraud detection
- Machine learning
- Helps in future prediction

## Metric used to measure classifiers

- Accuracy
- Classifying time
- training time
- main memory usage
- model time

### Accuracy

Accuracy is measured like bernoulli (X=1 is correct guess).

### Binomial Distribution

- If we treat each classified record as bernoulli trial then the accuracy will
  follow a binomial distribution, since its the sum of bernoullis.

- It is difficult to compute for large n because factorials are involved

### Normal Distribution

- WKT, for using central limit theorem. Any distribution like binomial will
  converge to a normal distribution.
- Mean an variance remain the same as binomial though

### Confidence Intervals

- Any normal distribution has has a $P[a < x < b]$, which is called the
  confidence interval between a and b.
- For standard normal distribution (mean=0, var=1), the whole area of the normal
  distribution is 1. So we can use the CDF of normal to find the confidence
  interval. $P[-b < x < b] = 1 - 2 F(b) $.

### Estimating accuracy

Accuracy is just number of time the model is true out of tested times.


