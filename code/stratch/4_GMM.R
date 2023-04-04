herit_reml = 0.01477762
herit_ldscore = 0.10945020
cor_est = 0.1582879
cov_est = sqrt(herit_reml*herit_ldscore)*cor_est
V = matrix(c(herit_reml,cov_est,cov_est,herit_ldscore),2,2)
sum(solve(V))^-1
