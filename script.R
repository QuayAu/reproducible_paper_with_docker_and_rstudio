library(ggplot2)
library(dplyr)
df = iris %>% filter(Sepal.Length >= 5)
ggplot(df) + aes(x = Sepal.Length, y = Species) + geom_point()
