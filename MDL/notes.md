# AI.pdf

## What is machine learning

It is learning by machines that requires recognition of patterns.

## Why machine learning

Humans are idiots, they can't handle repetitive tasks, so we make "work" done
by machines.

Machines are just almost perfect, we can let them do the task in a perfect way
and assume work done is
correct, if machine gives wrong output, there is human error in configuration,
machine never makes mistakes.

Machines can be trained on terabytes of data within shorter time than what
humans need to do the same.
Machines are also more scalable, and cheap long term.

## Peace

Machine + Human Expert ---> Tireless Most efficient human

## Machine learning and Automation difference

Machine learning can adapt to dynamic changes. But automation is just shear iteration.

Data technology is the ability to use various algorithms and stuff to analyse
data.
Since we have so much data now.

### Unsupervised Learning

When data only contains like input and output randomly, it is up to us
(algorithm designer) to analyse the data and find out how to describe the data.

Eg: k-clustering

### Supervised Learning

When learning comes with a good description, targets or indicative signals. The
goal is to find a general
rule to map input and output (like a polynomial). They also have a validation step.

Eg: Regression, Classification

Regression - predicts continuous values predictions like graphs and stocks

Classification - find appropriate class like.

### Reinforcement Learning

It has a feedback mechanism which takes care of dynamic changes. Reinforcement
learning has some sort of interaction with the environment.

Eg: Feedback and reward system shown in chimpanzee thing

### Semi-supervised learning

When it is too expensive to find a huge labelled dataset, only some part is labelled.

## History

Categories of ML algorithms:

- Logic-Based: Formal logic and hypotheses
- Statistical-Learning: Function finding and fitting, relationship between
  variables (popular in 90s)
- Artificial Neural Networks: Pushed aside in 80s by above, try to emulate
  brain. Coming back with Deep Neural Networks (2006), multilayer networks.
  GPUs we good at this.
- Genetic Algorithms: Popular in 90s too, try to use biological evolution like approach.

## Generalizing with data

Its the ability to learn from training data and be able to
apply those to test data. The mock tests in between called validation
samples are used to check in between training.

Machine learning is based on this generalization, where we will give it
input and output and let it decide what algorithm to apply to get a good
result.

Thus if we have enough sample data, we need not work on finding equations
that satisfy. Let Machine do it itself.

There are two types of generalization; underfitting, overfitting.

## Overfitting

When we learn more things than we should. This situation is called
high variance, because the model is not consistently built up,
and thus cannot perform well in test.

## Underfitting

It fails to capture the underlying trend of the data so it performs bad in
both training and test.
The model is consistent, but consistently bad.

## Bias-Variance Trade off

We need a quantity that takes into account both bias and variance, that is MSE

## Avoiding overfitting

Underfitting is easy to recognize and requires us to make the model better to
get better results.

But overfitting is hard to spot so below are the methods to avoid it in the
first place

### Using Cross-Validation

Usually we split data into 60% train, 20% validation and 20% test, but we
don't always have that much data. Thus we use cross-validation.

Cross validation we divide only in test and train, but we do that multiple
times and each time the value is different, then we average out.

There are also two types of cross validation schemes

- Exhaustive: We leave one part for testing, in multiple iterations until
  all parts are covered under testing atleast once. (LOOCV is n^2)

- Non-Exhaustive: Eg - k-fold We do k times, one of the k becomes test
  and rest are train, thus we only iterate k times, low var than LOOCV.
  There are other methods like this called Holdout(random), nested-cross
  validation ( Inner (k-fold like) + Outer (for performance) )

### Using Regularization

This means, using simpler models like Occam's Razor. One common means
is to 'Early Stopping', where we don't train the whole data at all.

### Using Feature Selection And Dimentionality Reduction

The columns in data of Supervised machine learning is called Features.
Selecting features that are useful is called feature selection

When there are a lot of features, taking a feature and checking if
it affects things can be slow, we need advanced feature selection
algorithms.

Dimensionality Reduction: Or feature projection is a way in which
features can be reduced by mixing two of them, etc. This is done
for images and text data.

## But how to make features from Data anyway

There is generalized guideline which comes from data science world
called CRISP-DM (Cross Industry Standard Process for Data Mining).

Big process of Following phases:

- Business understanding - This phase is often taken care of by
  specialized domain experts. To come up with a business problem
  (or create one)
- Data understanding - This requires domain experts with spreadsheet
  knowledge but may require some technical specialist involved.
- Data preparation - This is also a phase, which requires technical
  expertise in generating datasets.
- Modelling - We design algorithms and design a model that helps us
  fit future data.
- Evaluation - Evaluate the performance of the model in the business
  problem in the first place.
- Deployment - Setting up an interface, and integrating it to the
  production environment.

### Preprocessing

We need to clean the data, so that the machine understands it.
If we want to clean data ourself, we have to scan data, visualize it.

### Dealing with missing values

Simplest way to deal with missing values is to ignore them, except programs
sometimes don't run without those values.

- Imputing: Thus second thing is to substitute the values with a fixed one.
  Usually this value is Mean, Median, Mode of already existing data.

## Labelling

Labelling can be just done by using enum like thing, but then if numbers
will have values like 1, 2, 3, the model may take it as a value and assign
weights. We want something that gives classification with equal weights

### One-hot encoding

We can use variables with conditionals (0 or 1). Like the `is_asia` is a
variable, like this we need labels - 1, variables last one is the else.

This turns out to be a sparse matrix, on a table.

## Scaling

In the dataset, the larger values my dominate the smaller ones, so we need
to scale the data to keep things consistent. Some good methods are:

- Gaussian: Divide by standard deviation
- Interquartile range: Divide by middle values ( mean(25 - 75 ) )
- Scaling features between 0 to 1 (some logic) is common programming practice

## Feature Engineering

Deep neural networks derive features themselves, otherwise its just art.

### Polynomial transformations

If we want to measure how two features interact with each other, we can
use polynomial product of the two, or sum, ratio etc, and use it as a seperate
feature. Avoid complex polynomial relations.

### Power transforms

Using logarithm is a good example to make a new feature.

Or use Box-Cox Transformation to find the best power to get closer to the
normal distribution.

### Binning

Just categorize values into bins, and then perform, this increases speed
and avoids overfitting ( simples dimentionality reduction )
