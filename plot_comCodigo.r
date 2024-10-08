############## OPÇÃO A - DIRETO NO PLOT

library(plotly)

# Dados para o gráfico
x <- 1:10
y <- x^2

# Código do gráfico a ser exibido
codigo_usado <- "plot_ly(x = ~x, y = ~y)"

# Gerar o gráfico e adicionar anotação com o código
fig <- plot_ly(x = ~x, y = ~y) %>%
  layout(
    annotations = list(
      x = 1, y = 1, xref = 'paper', yref = 'paper',
      text = paste("<b>Código usado:</b><br>", codigo_usado),
      showarrow = FALSE,
      xanchor = 'right',
      yanchor = 'top',
      font = list(size = 12)
    )
  )

fig

############### OPÇÃO B - CLIQUE EM NOTA

library(plotly)

# Dados para o gráfico
x <- 1:10
y <- x^2

# Código a ser exibido
codigo_usado <- "
library(plotly)
x <- 1:10
y <- x^2
plot_ly(x = ~x, y = ~y)
"

# Gerar o gráfico e adicionar hovertext para o código
fig <- plot_ly(x = ~x, y = ~y) %>%
  layout(
    annotations = list(
      list(
        x = 1, y = 1, xref = 'paper', yref = 'paper',
        text = "Clique aqui para o código",  # Anotação visível
        showarrow = TRUE,
        font = list(size = 14, color = 'blue'),
        hovertext = paste("<b>Código usado:</b><br>", codigo_usado),  # Texto ao passar o mouse
        hoverinfo = 'text'
      )
    )
  )

fig

################ OPÇÃO C - COPIAR O CÓDIGO NA NOTA QUE SE ABRE


##### NÃO FUNCIONOU !!!!!
library(plotly)
library(htmlwidgets)

# Criar os dados para o gráfico
x <- 1:10
y <- x^2

# Criar o gráfico
fig <- plot_ly(x = ~x, y = ~y, type = 'scatter', mode = 'lines+markers')

# HTML para copiar o código
html_content <- '
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Gráfico com Código</title>
    <script>
    function copiarCodigo() {
        const codigo = document.getElementById("codigoR");
        codigo.select();
        document.execCommand("copy");
        alert("Código copiado!");
    }
    </script>
</head>
<body>
    <h2>Gráfico Interativo</h2>
    <div id="grafico"></div>
    <h3>Código utilizado:</h3>
    <textarea id="codigoR" rows="6" cols="80" readonly>
library(plotly)
x <- 1:10
y <- x^2
plot_ly(x = ~x, y = ~y, type = 'scatter', mode = 'lines+markers')
    </textarea>
    <br>
    <button onclick="copiarCodigo()">Copiar Código</button>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script>
    const graficoDiv = document.getElementById("grafico");
    const trace1 = {
        x: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        y: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100],
        mode: "lines+markers",
        type: "scatter"
    };
    const data = [trace1];
    Plotly.newPlot(graficoDiv, data);
    </script>
</body>
</html>
'

# Salvar o gráfico como HTML
htmlwidgets::saveWidget(fig, "grafico.html", selfcontained = TRUE)

# Combinar o gráfico com o HTML do código
cat(html_content, file = "grafico_com_codigo.html")

# O gráfico e o código estarão no arquivo "grafico_com_codigo.html".

######## OPÇÃO SIMPLES

library(plotly)

# Dados
x <- 1:10
y <- x^2

# Gráfico com texto
plot_ly(x = ~x, y = ~y, type = 'scatter', mode = 'lines+markers') %>%
  layout(
    title = "Gráfico com Texto",
    annotations = list(
      x = 0,  # Posição no eixo X
      y = 0, # Posição no eixo Y
      text = "plot_ly(x = ~x, y = ~y, 
                 type = 'scatter', mode = 'lines+markers')", # Texto a ser exibido
      font = list(size = 8, color = "blue"),  # Tamanho e cor do texto
      showarrow = FALSE, # Mostra a seta
      arrowhead = 2,
      ax = 0, # Offset do eixo X
      ay = -40 # Offset do eixo Y
    )
  )

######################## O SIMPLES, MAS CONTROLANDO O TAMANHO, COR E POSIÇÃO DO TEXTO

library(plotly)

# Dados
x <- 1:10
y <- x^2

# Criar o gráfico
p <- plot_ly(x = ~x, y = ~y, type = 'scatter', mode = 'lines+markers')

# Definir limites dos eixos
x_limits <- range(x)
y_limits <- range(y)

# Calcular posições em porcentagens
x_pos <- x_limits[1] + 0.2 * (x_limits[2] - x_limits[1])  # 20% do eixo x
y_pos <- y_limits[1] + 0.8 * (y_limits[2] - y_limits[1])  # 80% do eixo y

# Adicionar anotações
p <- p %>%
  layout(
    title = "Gráfico com Texto em Proporções",
    annotations = list(
      list(
        x = x_pos,  # Posição no eixo X (20%)
        y = y_pos,  # Posição no eixo Y (80%)
        text = "plot_ly(x = ~x, y = ~y, 
                 type = 'scatter', mode = 'lines+markers')",
        showarrow = FALSE,
        font = list(size = 8, color = "blue"),
        ax = 0,
        ay = -40
      )
    )
  )

# Exibir gráfico
p



