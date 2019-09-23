library(ggplot2)
library(magrittr)
library(tidyr)
library(dplyr)
library(readxl)
library(viridis)
library(plotly)

Dataset_percent <- read_xlsx("Dataset_percent.xlsx")
Dataset_percent$year <- as.numeric(Dataset_percent$year)

plot <- ggplot(data = Dataset_percent,
               aes(x = year,
                   y = percent,
                   group = Region,
                   color = Region)) + theme_bw() + labs(title = "Share of Urban Population of the World by Geographic Region, 1950 - 2050",
                                                        x = "Year",
                                                        y = "Share of Urban Population (Percentage)")

plotwithgeom <- plot + geom_line(size = 1) + geom_point() + scale_color_manual(values=cividis(6)) + scale_x_continuous(expand = c(0,0), breaks = seq(from = 1950, to = 2050, by = 10), limits = c(1950, 2050)) + scale_y_continuous(expand = c(0,0), limits = c(0,100))

r<-ggplotly(plotwithgeom, tooltip = c("year","percent")) %>% layout(xaxis = list(showspikes = T), yaxis = list(showspikes = T), hovermode = "x", legend = list(x = 0, y = 1), margin = list(r = 15))

r
