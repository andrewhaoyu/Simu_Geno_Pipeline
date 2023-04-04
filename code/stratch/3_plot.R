load("./result/herit/h2_estimate")
library(ggplot2)
ggplot(result, aes(x = h2_reml, y = h2_ldscore))+
  geom_point()+
  theme_Publication()+
  geom_smooth(method = "lm")
