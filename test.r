# trees planted
family <- c(rep('apple', 3), rep('kiwi', 3))
site <- c(rep('USA', 2), rep('IND', 2), rep('UK', 2))
var <- c('aa', 'bb', 'cc', 'ff', 'gg', 'nn')
planted <- c(20, 30, 25, 40, 45, 50)

plant_stock <- data.frame(family, site, var, planted)

# plant stock after one year
family <- c(rep('apple', 2), rep('kiwi', 2))
site <- c(rep('USA', 2), rep('UK', 2))
var <- c('aa', 'cc', 'ff', 'nn')
dead <- c(10, 5, 10, 20)

plant_dead <- data.frame(family, site ,var, dead)

# summary table
one <- left_join(plant_stock, plant_dead)
two <- left_join(plant_dead, plant_stock)
three <- full_join(plant_stock, plant_dead)

survival <- three %>% group_by(family, site, var, planted, dead) %>% 
  mutate(survival= planted- dead)

