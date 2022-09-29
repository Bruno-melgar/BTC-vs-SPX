library(tidyverse)

head(m)
ma<- drop_na(m)
n <- data.frame(ma$`close BTC`,ma$`Close SPX`,ma$`Close QQQ`)
d <- data.frame(ma$date)

nums <- scale(n)

markets <- cbind(d,nums)
markets <- setNames(markets, c("date","btc","spx","qqq"))

markets %>% 
ggplot(aes(date)) + 
  geom_line(aes(y= btc, color= "btc")) +
  geom_line(aes(y= spx, color= "spx")) +
  geom_line(aes(y= qqq, color= "qqq"))

cor(nums)