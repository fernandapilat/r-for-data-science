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

#R: 234 linhas e 11 colunas.

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


#Mapeamentos estéticos - exercícios

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

#Adicionando duas variáveis utilizando o comando facet_grid()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

---

#Facetas - exercícios

#01 - O que acontece se você facetar uma variável contínua?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap (~ cty)

#R: Nesse caso a variável é convertida em categórica e em cada faceta é possível
#visualizar a dispersão dos dados para y = hwy e x = displ.

#02 - O que significam as células vazias no gráfico facet_grid(drv ~ cyl)? 
#Como eles se relacionam com esse enredo?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl)

#R: Significa que não existem observações coexistentes entre cyl e drv para as
#categoria vazia, no caso, 5 e 4.

#03 - Quais gráficos o código a seguir faz? O que .faz?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#R: Gráfico 1: é possível visualizar a relação entre as variáveis hwy e displ em
#três categorias diferentes, sendo, 4, f e r. Quando utilizo '. ~' depois da
#variável drv a visualização é plotada na horizontal, enquanto para '. ~' 
#antes da variável plota a visualização na vertical.

#04 - Quais são as vantagens de usar o facetamento em vez da estética da cor? 
#R: Quais são as desvantagens? Como o equilíbrio poderia mudar se você tivesse 
#um conjunto de dados maior?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap (~ class)

#R: As duas visualizações tem as mesma variável (class) para fins de classificação.
#Na visualização com cor existe um problema para avaliar a dispersão dos dados
#separadamente e comparar entre as variáveis, além das cores minivan e midsize
#serem parecidas e não ser possível distinguir no gráfico.
#Enquanto nas facetas é possível verificar separadamente cada uma das performances.
#Porém quando existem muitos dados é quase impossível ter uma escala de cores para
#cada variável, sendo necessário muitas vezes criar clusters das mesmas.

#05 - Leia ?facet_wrap. O que nrow faz? O que ncol faz? Que outras opções controlam
#R: O layout dos painéis individuais? Por que não facet_grid() tem nrow e 
#ncolargumentos?

??facet_wrap.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~class)

#Necessário dois ??
#R: nrow e ncol contam os números de linhas e colunas para as facetas.
#A função facet_grid() tem como parâmetros os eixos que definem as dimensões do 
#grid (linhas e colunas), os quais são especificados por meio de uma fórmula 
#(uma string) com a seguinte estrutura: linhas ~ colunas. Por padrão, o número 
#de linhas e colunas é determinado automaticamente com base no número de facets
#a serem exibidos. No entanto, é possível especificar explicitamente o número 
#de linhas e colunas usando os argumentos nrow e ncol. Em geral, é mais 
#conveniente usar facet_grid() quando o número de facets é pequeno e conhecido. 
#Já em casos em que há muitos facets, é recomendável usar facet_wrap().


#06 - Ao usar facet_grid(), você geralmente deve colocar a variável 
#R: Com níveis mais exclusivos nas colunas. Por que?

#Haverá mais espaço para plotar os gráficos.

---

#Objetos Geométricos

# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))  

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#Características geoms

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) 

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

#Exibir vários gráficos

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#Aqui é possível ver um gráfico de dispersão juntamente com uma linha de tendência.