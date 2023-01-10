#instalar pacote tydiverse
install.packages("tidyverse")

#carregar o pacote - é necessário sempre carregar para utilizar as funções
library(tidyverse)

#visualizacao de dados com ggplot2 - exercícios

#01 - Execute o dataframe mpg
ggplot(data = mpg)


#02 - Quantidade de linhas e colunas
nrow(mpg)
#> [1] 234
ncol(mpg)
#> [1] 11

# 234 linhas e 11 colunas

#03 - O que a variável drv descreve?
# o tipo de direção/tração do carro

#04 - Faça um gráfico de dispersão de hwy versus cyl.
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()

#quanto maior o número de cilindros, menor a eficiência do carro.
#paramêtro para eficiência: combustível.

#05 - O que acontece ao criar um gráfico de dispersão de class versus drv?
ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()

#não é eficiente pois as duas variáveis são categóricas.


#mapeamentos estéticos - exercícios