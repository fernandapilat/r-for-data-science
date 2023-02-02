#Instalar pacote tydiverse
install.packages("tidyverse")


#Carregar o pacote - é necessário sempre carregar para utilizar as funções
library(tidyverse)

mpg

#Visualizacao de dados com ggplot2 - exercícios

#01 - Execute o dataframe mpg
ggplot(data = mpg)


#02 - Quantidade de linhas e colunas

nrow(mpg)
#> [1] 234
ncol(mpg)
#> [1] 11

#Também é possível utiliazar a função glimpse()

glimpse(mpg)

# Resposta: 234 linhas e 11 colunas.

#03 - O que a variável drv descreve? 

#R: O tipo de direção/tração do carro.

#04 - Faça um gráfico de dispersão de hwy versus cyl.
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()

#R: Quanto maior o número de cilindros, menor a eficiência do carro.
#Paramêtro para eficiência: combustível.

#05 - O que acontece ao criar um gráfico de dispersão de class versus drv?
ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()

#R: Não é eficiente pois as duas variáveis são categóricas.

---

#Esqueleto geom_point()

ggplot(data = df) + 
  geom_point(
    mapping = aes(
      x = x_col, 
      y = y_col, 
      color = color_col, 
      size = size_col, 
      shape = shape_col
    ),
    color = "default_color", 
    size = 3, 
    shape = 21, 
    alpha = 1, 
    stroke = 1, 
    fill = "default_fill", 
    linetype = "solid", 
    pch = 21, 
    cex = 1, 
    ...
  ) +
  ...


#Parâmetros do geom_point()

# - mapping: usado para mapear variáveis da fonte de dados para as propriedades do gráfico, como posição x e y, cor, tamanho, etc.
# - data: a fonte de dados a ser usada para traçar o gráfico.
# - alpha: transparência dos pontos.
# - color: cor dos pontos.
# - size: tamanho dos pontos.
# - shape: forma dos pontos.
# - fill: cor de preenchimento dos pontos.
# - stroke: cor do contorno dos pontos.


#Mapeamentos estéticos - exercícios/respostas

#01 - O que há de errado com este código? Por que os pontos não são azuis?

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y = hwy, color = "blue")
    )

#R: O código acima retornou os valores em vermelho.

#Isso pode ocorrer se o ggplot2 estiver usando uma escala de cores padrão 
#para plotar o gráfico.

#Uma outra forma de plotar os valores na cor azul é utilizando o color
#fora dos parâmetros definidos para x e y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
  

#02 - As variáveis quali são: manufacturer, model, trans, drv, fl e class.
# Enquanto as variáveis quanti são: displ, year, cyl, cty e hwy.

df <- mpg
df

#03 - Mapeie uma variável contínua para color, size e shape. 
#Como essas estéticas se comportam de maneira diferente para variáveis 
#categóricas e variáveis contínuas?

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl))

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = cyl))

#R: Variáveis contínuas só podem ser usadas para color e size, porém para
#o parâmetro shape que é uma forma não pode ser usado para variáveis contínuas
#uma vez que números não podem definir se uma forma deve ser de um jeito ou de outro.

#04 - O que acontece se você mapear a mesma variável para várias estéticas?

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty, size = cyl))

#R: O gráfico de pontos fica redundante e com a estética ruim.

#05 - O que a stroke estética faz? Com quais formas ele funciona?

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = 1))

#R: Aumenta e diminui o tamanho das variáveis.

#06 - O que acontece se você mapear uma estética para algo diferente de um 
#nome de variável, como aes(colour = displ < 5)? Observe que você também 
#precisará especificar x e y.

ggplot(data = df) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))

#R: Ele atribui verdadeiro e falso para a condição estabelecida.

#Facetas ou subgráficos

#Nesse gráfico foi adicionado uma categoria que é a variável ~ class.
#Importante lembrar de adicionar o operador: ~.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cyl)