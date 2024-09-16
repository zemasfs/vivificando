# Instale os pacotes necessários, caso ainda não os tenha
# install.packages("ggplot2")
# install.packages("plotly")

library(ggplot2)
library(plotly)

# Função para gerar os dados e o gráfico com base em taxa.dissociação.produto
generate_plot_data <- function(taxa.dissociação.produto) {
  y.max <- 1
  x <- seq(0.1, 10, length.out = 100)
  y <- y.max * x / (taxa.dissociação.produto + x)
  data.frame(x, y)
}

# Inicialize o gráfico com taxa.dissociação.produto = 1
initial_taxa.dissociação.produto <- 1
plot_data <- generate_plot_data(initial_taxa.dissociação.produto)

# Crie o gráfico inicial usando ggplot2
p <- ggplot(plot_data, aes(x = x, y = y)) +
  geom_line() +
  labs(title = paste("Formação de Produtos com Alteração da Taxa de Desligamento do Reagente:: P = P.max * R/ (", initial_taxa.dissociação.produto, " + R)"),
       x = "Reagente",
       y = "Produto") +
  theme_minimal() +
  ylim(0, 1)

# Converta para um objeto plotly
fig <- ggplotly(p)

# Adicione um slider para taxa.dissociação.produto utilizando plotly
steps <- lapply(seq(0.1, 10, by = 0.1), function(taxa.dissociação.produto) {
  list(
    label = as.character(taxa.dissociação.produto),
    method = "restyle",
    args = list(
      list(
        x = list(generate_plot_data(taxa.dissociação.produto)$x),
        y = list(generate_plot_data(taxa.dissociação.produto)$y)
      ),
      list(title = paste("Formação de Produtos com Alteração da Taxa de Desligamento do Reagente: y = y.max * x / (", taxa.dissociação.produto, " + x)"))
    )
  )
})

fig <- fig %>%
  layout(
    sliders = list(
      list(
        active = 0,
        currentvalue = list(prefix = "taxa.dissociação.produto: "),
        steps = steps
      )
    )
  )

# Visualize o gráfico
fig