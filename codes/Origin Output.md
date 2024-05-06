# Origin Output

```R
/usr/local/bin/R --slave --no-save --no-restore --no-site-file --no-environ -f /Users/fa2nica/PycharmProjects/modeling-a2/a3/main.R --args ""
Loading required package: Rcpp
Loading 'brms' package (version 2.21.0). Useful instructions
can be found by typing help('brms'). A more detailed introduction
to the package is available through vignette('brms_overview').

Attaching package: ‘brms’

The following object is masked from ‘package:stats’:

    ar

Loading required package: StanHeaders

rstan version 2.32.6 (Stan version 2.32.2)

For execution on a local, multicore CPU with excess RAM we recommend calling
options(mc.cores = parallel::detectCores()).
To avoid recompilation of unchanged Stan programs, we recommend calling
rstan_options(auto_write = TRUE)
For within-chain threading using `reduce_sum()` or `map_rect()` Stan functions,
change `threads_per_chain` option:
rstan_options(threads_per_chain = 1)


Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Registered S3 method overwritten by 'GGally':
  method from   
  +.gg   ggplot2
        Alsace white blend   Bordeaux-style Red Blend 
                         1                          2 
Bordeaux-style White Blend             Cabernet Franc 
                         3                          4 
        Cabernet Sauvignon            Champagne Blend 
                         5                          6 
                Chardonnay               Chenin Blanc 
                         7                          8 
   Chenin Blanc-Chardonnay                      Gamay 
                         9                         10 
            Gewürztraminer                   Grenache 
                        11                         12 
                    Malbec              Malbec-Merlot 
                        13                         14 
                  Marsanne                      Melon 
                        15                         16 
                    Merlot                     Muscat 
                        17                         18 
             Petit Manseng                Pinot Blanc 
                        19                         20 
                Pinot Gris                 Pinot Noir 
                        21                         22 
                 Red Blend      Rhône-style Red Blend 
                        23                         24 
   Rhône-style White Blend                   Riesling 
                        25                         26 
                      Rosé            Sauvignon Blanc 
                        27                         28 
           Sparkling Blend                   Sylvaner 
                        29                         30 
                     Syrah                     Tannat 
                        31                         32 
           Tannat-Cabernet                   Viognier 
                        33                         34 
               White Blend 
                        35 
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1.00    6.00   12.00   14.82   24.00   35.00 
   Length     Class      Mode 
     2500 character character 
   variety             variety_name           variety_factor
1        6          Champagne Blend          Champagne Blend
2        2 Bordeaux-style Red Blend Bordeaux-style Red Blend
3        6          Champagne Blend          Champagne Blend
4       27                     Rosé                     Rosé
5        7               Chardonnay               Chardonnay
6       31                    Syrah                    Syrah
7       23                Red Blend                Red Blend
8       31                    Syrah                    Syrah
9       31                    Syrah                    Syrah
10      10                    Gamay                    Gamay
`geom_smooth()` using formula = 'y ~ x'
Compiling Stan program...
Start sampling

SAMPLING FOR MODEL 'anon_model' NOW (CHAIN 1).
Chain 1: 
Chain 1: Gradient evaluation took 3.9e-05 seconds
Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.39 seconds.
Chain 1: Adjust your expectations accordingly!
Chain 1: 
Chain 1: 
Chain 1: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 1: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 1: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 1: Iteration:  501 / 2000 [ 25%]  (Sampling)
Chain 1: Iteration:  700 / 2000 [ 35%]  (Sampling)
Chain 1: Iteration:  900 / 2000 [ 45%]  (Sampling)
Chain 1: Iteration: 1100 / 2000 [ 55%]  (Sampling)
Chain 1: Iteration: 1300 / 2000 [ 65%]  (Sampling)
Chain 1: Iteration: 1500 / 2000 [ 75%]  (Sampling)
Chain 1: Iteration: 1700 / 2000 [ 85%]  (Sampling)
Chain 1: Iteration: 1900 / 2000 [ 95%]  (Sampling)
Chain 1: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 1: 
Chain 1:  Elapsed Time: 0.465 seconds (Warm-up)
Chain 1:                0.626 seconds (Sampling)
Chain 1:                1.091 seconds (Total)
Chain 1: 

SAMPLING FOR MODEL 'anon_model' NOW (CHAIN 2).
Chain 2: 
Chain 2: Gradient evaluation took 1.4e-05 seconds
Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.14 seconds.
Chain 2: Adjust your expectations accordingly!
Chain 2: 
Chain 2: 
Chain 2: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 2: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 2: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 2: Iteration:  501 / 2000 [ 25%]  (Sampling)
Chain 2: Iteration:  700 / 2000 [ 35%]  (Sampling)
Chain 2: Iteration:  900 / 2000 [ 45%]  (Sampling)
Chain 2: Iteration: 1100 / 2000 [ 55%]  (Sampling)
Chain 2: Iteration: 1300 / 2000 [ 65%]  (Sampling)
Chain 2: Iteration: 1500 / 2000 [ 75%]  (Sampling)
Chain 2: Iteration: 1700 / 2000 [ 85%]  (Sampling)
Chain 2: Iteration: 1900 / 2000 [ 95%]  (Sampling)
Chain 2: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 2: 
Chain 2:  Elapsed Time: 0.513 seconds (Warm-up)
Chain 2:                0.612 seconds (Sampling)
Chain 2:                1.125 seconds (Total)
Chain 2: 

SAMPLING FOR MODEL 'anon_model' NOW (CHAIN 3).
Chain 3: 
Chain 3: Gradient evaluation took 1.3e-05 seconds
Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.13 seconds.
Chain 3: Adjust your expectations accordingly!
Chain 3: 
Chain 3: 
Chain 3: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 3: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 3: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 3: Iteration:  501 / 2000 [ 25%]  (Sampling)
Chain 3: Iteration:  700 / 2000 [ 35%]  (Sampling)
Chain 3: Iteration:  900 / 2000 [ 45%]  (Sampling)
Chain 3: Iteration: 1100 / 2000 [ 55%]  (Sampling)
Chain 3: Iteration: 1300 / 2000 [ 65%]  (Sampling)
Chain 3: Iteration: 1500 / 2000 [ 75%]  (Sampling)
Chain 3: Iteration: 1700 / 2000 [ 85%]  (Sampling)
Chain 3: Iteration: 1900 / 2000 [ 95%]  (Sampling)
Chain 3: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 3: 
Chain 3:  Elapsed Time: 0.486 seconds (Warm-up)
Chain 3:                0.62 seconds (Sampling)
Chain 3:                1.106 seconds (Total)
Chain 3: 

SAMPLING FOR MODEL 'anon_model' NOW (CHAIN 4).
Chain 4: 
Chain 4: Gradient evaluation took 2e-05 seconds
Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.2 seconds.
Chain 4: Adjust your expectations accordingly!
Chain 4: 
Chain 4: 
Chain 4: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 4: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 4: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 4: Iteration:  501 / 2000 [ 25%]  (Sampling)
Chain 4: Iteration:  700 / 2000 [ 35%]  (Sampling)
Chain 4: Iteration:  900 / 2000 [ 45%]  (Sampling)
Chain 4: Iteration: 1100 / 2000 [ 55%]  (Sampling)
Chain 4: Iteration: 1300 / 2000 [ 65%]  (Sampling)
Chain 4: Iteration: 1500 / 2000 [ 75%]  (Sampling)
Chain 4: Iteration: 1700 / 2000 [ 85%]  (Sampling)
Chain 4: Iteration: 1900 / 2000 [ 95%]  (Sampling)
Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 4: 
Chain 4:  Elapsed Time: 0.425 seconds (Warm-up)
Chain 4:                0.604 seconds (Sampling)
Chain 4:                1.029 seconds (Total)
Chain 4: 
 Family: gaussian 
  Links: mu = identity; sigma = identity 
Formula: points ~ price + variety + Crisp + Dry + Finish + Firm + Fresh + Fruit + Full + Rich + Round + Soft + Sweet 
   Data: wine_data (Number of observations: 2500) 
  Draws: 4 chains, each with iter = 2000; warmup = 500; thin = 1;
         total post-warmup draws = 6000

Regression Coefficients:
          Estimate Est.Error l-95% CI u-95% CI Rhat Bulk_ESS Tail_ESS
Intercept    87.09      0.15    86.79    87.38 1.00     9092     4396
price         0.02      0.00     0.02     0.02 1.00     6123     3751
variety       0.00      0.00    -0.01     0.01 1.00    13120     4344
Crisp        -0.24      0.14    -0.51     0.03 1.00     8895     4538
Dry           0.04      0.14    -0.23     0.31 1.00     8510     4316
Finish       -0.12      0.12    -0.35     0.11 1.00     8599     5125
Firm          0.48      0.16     0.18     0.78 1.00     6898     4683
Fresh        -0.10      0.11    -0.31     0.11 1.00     8105     4661
Fruit         0.20      0.11    -0.01     0.41 1.00     9562     4625
Full          0.52      0.12     0.28     0.76 1.00     8157     4407
Rich          1.65      0.11     1.43     1.88 1.00     7052     4792
Round         0.21      0.15    -0.08     0.50 1.00     8615     4911
Soft         -1.09      0.13    -1.34    -0.84 1.00     8208     4525
Sweet         0.13      0.17    -0.20     0.46 1.00    10375     4433

Further Distributional Parameters:
      Estimate Est.Error l-95% CI u-95% CI Rhat Bulk_ESS Tail_ESS
sigma     2.45      0.03     2.38     2.52 1.00     9998     4354

Draws were sampled using sampling(NUTS). For each parameter, Bulk_ESS
and Tail_ESS are effective sample size measures, and Rhat is the potential
scale reduction factor on split chains (at convergence, Rhat = 1).
[1] "Posterior Summary:"
                 Estimate    Est.Error          Q2.5         Q97.5
b_Intercept  8.708857e+01 0.1495520663  8.678774e+01  8.738163e+01
b_price      2.170271e-02 0.0007482304  2.023049e-02  2.313271e-02
b_variety    5.835604e-04 0.0049327766 -8.971180e-03  1.010166e-02
b_Crisp     -2.416553e-01 0.1365324541 -5.090054e-01  3.104442e-02
b_Dry        3.762408e-02 0.1388255641 -2.349387e-01  3.087636e-01
b_Finish    -1.166421e-01 0.1185963086 -3.506188e-01  1.135687e-01
b_Firm       4.818654e-01 0.1553618250  1.767805e-01  7.821892e-01
b_Fresh     -1.020457e-01 0.1076915174 -3.114917e-01  1.108928e-01
b_Fruit      1.985136e-01 0.1101168904 -1.422407e-02  4.117639e-01
b_Full       5.213394e-01 0.1226979612  2.822428e-01  7.640241e-01
b_Rich       1.651256e+00 0.1148295093  1.430715e+00  1.880969e+00
b_Round      2.119680e-01 0.1491738316 -8.141368e-02  5.012362e-01
b_Soft      -1.092978e+00 0.1289156927 -1.341173e+00 -8.420960e-01
b_Sweet      1.298533e-01 0.1668658327 -1.951293e-01  4.560870e-01
sigma        2.447088e+00 0.0345395321  2.380001e+00  2.517331e+00
Intercept    8.859922e+01 0.0483186822  8.850317e+01  8.869238e+01
lprior      -4.574849e+01 0.0110722186 -4.577122e+01 -4.572723e+01
lp__        -5.829295e+03 2.7014387890 -5.835437e+03 -5.824937e+03
[1] "Posterior Predictive Checks:"
NULL
[1] "Conditional Effects:"
[1] "Posterior Predictive Checks:"
[1] "Correlation Matrix:"
            b_Intercept     b_price   b_variety     b_Crisp
b_Intercept   1.0000000 -0.26303113 -0.54994196 -0.12536392
b_price      -0.2630311  1.00000000  0.09284982  0.02985180
b_variety    -0.5499420  0.09284982  1.00000000 -0.08328276
b_Crisp      -0.1253639  0.02985180 -0.08328276  1.00000000
[1] "Correlation between actual and predicted points:"
             Actual Predicted
Actual    1.0000000 0.6088149
Predicted 0.6088149 1.0000000
[1] "Actual vs Predicted Points:"
  Actual Predicted
1     91  89.80950
2     87  87.65720
3     87  89.03169
4     90  87.13250
5     87  86.73465
6     90  89.38864
[1] "Min-Max Accuracy:"
[1] 0.9784633
[1] "RMSE: 2.43961779251322"
[1] "MAE: 1.94212603834161"
Process finished with exit code: 0
```

