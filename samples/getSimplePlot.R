source("./R/ggplot_Piper.R")
library("hydrogeo")

library(ggpiper)


# very simple version ##########################################################

df_ions <- read.csv2("samples/ions.csv")
data <- toPercent(df_ions)

piper_data <- transform_piper_data(Ca   = data$Ca,
                                   Mg   = data$Mg,
                                   Cl   = data$Cl,
                                   SO4  = data$SO4,
                                   name = data$IDs)

ggplot_piper() + geom_point(aes(x,y, colour=factor(observation)), data=piper_data)


################################################################################

milliequivalents <- list(Ca   = c(11, 10, 73, 26, 32),
                         Mg   = c(30, 50, 83, 14, 62),
                         Na   = c(54, 76, 3, 14, 12),
                         K    = c(31, 22, 32, 22, 11),
                         Cl   = c(24, 10, 12, 30, 43),
                         SO4  = c(24, 10, 12, 30, 43),
                         CO3  = c(24, 10, 12, 30, 43),
                         HCO3 = c(42, 110, 12, 3, 4),
                      #   "WaterType" = c(2, 2, 1, 2, 3),
                      #   "SecondFactor" = c("low", "low", "high", "high", "high"),
                         IDs = c("A","B","C","D","E") )
percents <- toPercent(milliequivalents)

data <- as.data.frame(percents)

data


piper_data <- transform_piper_data(Ca   = data$Ca,
                                   Mg   = data$Mg,
                                   Cl   = data$Cl,
                                   SO4  = data$SO4,
                                   name = data$IDs)
piper_data <- merge(piper_data,
                    data[, c("WaterType", "SecondFactor", "IDs")],
                    by.y = "IDs",
                    by.x = "observation")

piper_data




ggplot_piper()
ggplot_piper() + geom_point(aes(x,y), data=piper_data)
ggplot_piper() + geom_point(aes(x,y, colour=factor(observation)), data=piper_data)
ggplot_piper() + geom_point(aes(x,y, colour=factor(observation)), size=4, data=piper_data)

ggplot_piper() + geom_point(aes(x,y,
                                color = factor(WaterType),
                                shape = SecondFactor),
                            size = 4, stroke = 2, data = piper_data) +
    scale_shape_manual(values = c(21:26)) +
    theme(legend.position = "top", legend.text = element_text(color = "red", size = 20))

