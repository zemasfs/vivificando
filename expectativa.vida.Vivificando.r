## Mostrar evolução de pontos a partir de uma variável categórica (years)
library(ggplot2)
library(gganimate)
library(gapminder)
p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "PIB/capita", y = "Expectativa de vida",
       title = "PIB & Expectativa de vida",
       color = "Continent")+
  theme(axis.title = element_text(), 
        text = element_text(family = "serif"), 
        legend.text = element_text(size = 10))+
  theme_minimal()
p+ transition_time(year) +
  labs(title = "Year: {frame_time}")