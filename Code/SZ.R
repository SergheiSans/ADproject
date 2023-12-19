# Установка необходимых пакетов
if (!require("tidyverse")) install.packages("tidyverse")

# Загрузка библиотек
library(tidyverse)

# Указание пути к вашему датасету
file_path <- "E:/Uroki/Tretiikurs/AD/proectTest/obesity-cleaned.csv"

# Загрузка данных
data <- read.csv(file_path)

# Очистка пробелов в названиях столбцов
names(data) <- make.names(names(data))

# Выбор уникальных стран и последнего доступного года
latest_data <- data %>%
  group_by(Country) %>%
  filter(Year == max(Year))

# Вывод результатов
print(latest_data)
