# Загрузка библиотеки
library(ggplot2)
        
# Фильтрация данных для Австралии и Японии за 1975 год
australia_data_1975 <- data[data$Country == "Australia" & data$Year == 1975, ]
japan_data_1975 <- data[data$Country == "Japan" & data$Year == 1975, ]

# Создание графика
ggplot() +
  geom_bar(mapping = aes(x = factor("Australia"), y = mean(australia_data_1975$Obesity, na.rm = TRUE)), stat = "identity", fill = "blue") +
  geom_bar(mapping = aes(x = factor("Japan"), y = mean(japan_data_1975$Obesity, na.rm = TRUE)), stat = "identity", fill = "green") +
  labs(title = "Уровень ожирения в Австралии и Японии за 1975 год", y = "Уровень ожирения") +
  theme_minimal()


# Установка библиотеки ggplot2, если еще не установлена
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Фильтрация данных для Австралии и Японии за 2015 год
australia_data <- data[data$Country == "Australia" & data$Year == 2015, ]
japan_data <- data[data$Country == "Japan" & data$Year == 2015, ]

# Создание графика
ggplot() +
  geom_bar(mapping = aes(x = factor("Australia"), y = australia_data$Obesity), stat = "identity", fill = "blue") +
  geom_bar(mapping = aes(x = factor("Japan"), y = japan_data$Obesity), stat = "identity", fill = "green") +
  labs(title = "Уровень ожирения в Австралии и Японии за 2015 год", y = "Уровень ожирения") +
  theme_minimal()
