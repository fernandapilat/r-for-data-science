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

# Resposta: 234 linhas e 11 colunas.

#03 - O que a variável drv descreve? (O tipo de direção/tração do carro)

#04 - Faça um gráfico de dispersão de hwy versus cyl.
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()

#Quanto maior o número de cilindros, menor a eficiência do carro.
#Paramêtro para eficiência: combustível.

#05 - O que acontece ao criar um gráfico de dispersão de class versus drv?
ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()

#Não é eficiente pois as duas variáveis são categóricas.

---

#Configurar as propriedades do gráfico de dispersão
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#Para modificar a cor dos dados é necessário informar a cor no parâmetro color, ex:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

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