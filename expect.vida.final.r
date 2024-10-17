library(plotly)

# Obtendo os dados na internet
url <- read.csv("https://raw.githubusercontent.com/kirenz/datasets/refs/heads/master/gapminder.csv")

dadosExpVida <- url  # atribuindo os dados a um objeto do `R`

# Criando o gráfico interativo com animação
plot_ly(
  dadosExpVida, # dados convertidos da internet
  x = ~gdpPercap, # renda per capita
  y = ~lifeExp, # expectativa de vida
  size = ~pop, # tamanho dos pontos em função da população
  color = ~country, # cor dos pontos em função do país
  frame = ~year,    # Frame para a animação por ano de coleta dos dados
  text = ~continent,  # País como informação ao passar o mouse
  hoverinfo = "text",
  type = 'scatter', # tipo de gráfico
  mode = 'markers',
  marker = list(sizemode = 'diameter', opacity = 0.7)
) %>%
  layout(  # atribuição de título e etiquetas dos eixos
    title = "Produto interno bruto X Expectativa de vida",
    xaxis = list(title = "PIB (log), US$", type = "log"),
    yaxis = list(title = "Expectativa de Vida, anos"),
    showlegend = TRUE # possibilidade ou não de aparecer a legenda
  ) %>%
  animation_opts(
    frame = 1000,           # Velocidade da animação
    transition = 0,
    redraw = TRUE
  )