data {
    // Number of results
    int<lower=1> N_results;

    // Number of Athletes
    int<lower=1> N_athletes;

    // Number of Races
    int<lower=1> N_races;

    // Result
    int<lower=0,upper=1> y[N_results];

    // Race Index
    int<lower=1,upper=N_races> race_idx[N_results];

    // Athlete Index
    int<lower=1,upper=N_athletes> athlete_idx[N_results];
}

parameters {
    // Parameter for each athlete
    vector[N_athletes] athlete_stregnth;

    // Parameter for each race
    vector[N_races] race_stregnth;

    // Model intercept
    real intercept;

    // Hierarchical Parameters
    real<lower=0> althete_sigma;
    real<lower=0> race_sigma;
}

model {

    athlete_stregnth ~ normal(0, althete_sigma);
    race_stregnth ~ normal(0, race_sigma);
    
    y ~ bernoulli_logit(intercept + athlete_stregnth[athlete_idx] + race_stregnth[race_idx]);
}