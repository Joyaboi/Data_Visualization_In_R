####0) Set up and initialize####

install.packages("palmerpenguins")
library(ggplot2)
penguins
library(dplyr)

install.packages("beepr")
library("beepr")
beep_on_error("wilhelm")

install.packages("emojifont")
library("emojifont")


####6.1) Histogram ####

ggplot(penguins, aes(x=flipper_len)) +
  geom_histogram(binwidth = 2)

####6.2) Customization####
beep_on_error(1 + "a", sound = "wilhelm")
hello(me)

#####Labels#####

ggplot(penguins, aes(x=flipper_len)) +
  geom_histogram(binwidth = 2)+
  labs(x= "Flipper Length (mm)",
       y = "Frequency",
       title = "Histogram of Flipper Length")

#####Colors#####

ggplot(penguins, aes(x=flipper_len)) +
  geom_histogram(colour = "blue", fill = "lightblue", binwidth = 2)+
  labs(x= "Flipper Length (mm)",
       y = "Frequency",
       title = "Histogram of Flipper Length")

#####Color by categorical variable#####

ggplot(penguins, aes(x=flipper_len, fill = species)) +
  geom_histogram(color = "black")

#####Density Plot#####

ggplot(penguins, aes(x=flipper_len, fill = species)) +
  geom_density(alpha = 0.5)

#####Faceting#####

ggplot(penguins, aes(x=flipper_len, fill = species)) +
  geom_density(alpha = 0.5) +
  facet_wrap(~species,ncol=1)

####6.3) Finished Graph####
ggplot(penguins, aes(x=flipper_len, fill = species)) +
  geom_density(alpha = 0.9) +
  facet_wrap(~species,ncol=1) +
  labs(x = "Flipper Length (mm)",
       y= "Density",
       title = "Density Plots of Flipper Length in Palmer Penguins",
       fill = "Penguin Species"
  )

#####Ex.1.1#####

ggplot(penguins, aes(bill_dep, fill = species)) +
  geom_histogram(color = "black") +
  facet_grid(species~sex)+
  labs(x= "Bill Depth (mm)",
       y= "Count",
       title = "Histogram of Bill Depth",
       fill = "Penguin Species"
  )

#####Ex.1.2#####

penguins_subset <- subset(penguins, !is.na(sex))

ggplot(penguins_subset, aes(x=bill_dep, fill = sex)) +
  geom_density(alpha = 0.9) +
  facet_wrap(~species,ncol=3) +
  labs(x = "Bill Depth (mm)",
       y= "Density",
       title = "Density Plots of Bill Depth in Palmer Penguins",
       fill = "Sex"
  )

#####Ex.1.Adv#####

ggplot(penguins, aes(x=species, fill = sex)) +
  geom_bar() +
  facet_wrap(~sex,ncol=3) +
  labs(x = "Bill Depth (mm)",
       y= "Density",
       title = "Density Plots of Bill Depth in Palmer Penguins",
       fill = "Sex"
  )

####7) Scatterplot####

ggplot(penguins, aes(x=bill_len, y = bill_dep)) +
  geom_point()
  
####7.1) Add a statistical test####

ggplot(penguins, aes(x=bill_len, y = bill_dep)) +
  geom_point() +
  stat_smooth() #this makes a fitted line, pretty useless


ggplot(penguins, aes(x=bill_len, y = bill_dep)) +
  geom_point() +
  stat_smooth(method = "lm") #this makes a linear regression, quite useful

ggplot(penguins, aes(x=bill_len, y = bill_dep, color = species)) +
  geom_point() +
  stat_smooth(method = "lm") + #this makes a linear regression for each species, which is awesome
  labs(x = "Bill Length (mm)",
       y= "Bill Depth (mm)",
       title = "Scatter Plots of Bill Depth & Length in Palmer Penguins",
       fill = "Penguin Species"
  )
ggsave("bill_dimensions_reg.png")

#####Ex.2#####

ggplot(penguins, aes(x=bill_dep, y = flipper_len, color = bill_len)) +
  geom_point(binwidth = 20)+ 
  stat_smooth(method = "lm")+
  scale_color_gradient(low ="blue", high = "red")+
  scale_y_continuous(breaks = seq(170,240,20))+
  labs(x="Bill Depth (mm)",
       y= "Flipper Length",
       title = "Scatterplot of Bill Depth and Flipper Length",
       color = "Bill Length (mm)"
         )

#####Ex. 2. Adv #####

ggplot(penguins)+
  geom_point(aes(x = bill_len, y = flipper_len, color = "species"))

ggplot(penguins, aes(x = bill_len, y = flipper_len, color = "species"))+
  geom_point()

ggplot(penguins, aes(x = bill_len, y = flipper_len))+
  geom_point(aes(color = species))

ggplot()+
  geom_point(data = penguins, aes(x = bill_len, y = flipper_len, color = "species"))

####8) Boxplot####

ggplot(penguins, aes(x = species, y = flipper_len))+
  geom_boxplot(notch = T)

#####8.1) Violin#####

ggplot(penguins, aes(x = species, y = flipper_len))+
  geom_violin()


#####8.2) Jitter#####

ggplot(penguins, aes(x = species, y = flipper_len))+
  geom_boxplot()+
  geom_jitter(width=0.1, alpha = 0.3)

#####8.3) Theme#####

ggplot(penguins, aes(x = species, y = flipper_len))+
  geom_boxplot()+
  geom_jitter(width=0.1, alpha = 0.3)+
  theme_classic()

#### Challenges ####

#####B.1#####

ggplot(penguins, aes(x=species, y = flipper_len, color = island)) +
  geom_point() +
  scale_colour_manual(values = c("Red", "Blue", "Yellow"))+
  labs(x = "Penguin Species",
       y= "Flipper Length (mm)",
       title = "Effect of Island & species on Flipper Length (mm)",
       color = "Island"
  )

#####B.2#####



#####Final Challenge: make something awful#####

ggplot(penguins, aes(x=species, y = flipper_len, color = island)) +
  geom_point(alpha = 0.05) +
  geom_emoji("man", color='cyan', alpha = 0.12)+
  scale_colour_manual(values = c("Cyan", "Chartreuse", "Chartreuse"))+
  labs(x = "Penguin Species",
       y= "Flipper Length (mm)",
       title = "Effect of Island & species on Flipper Length (mm)",
       color = "Island"
  )