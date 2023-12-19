# Установка библиотек ggplot2 и tidyverse
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Загрузка библиотек
library(ggplot2)
library(tidyverse)


# Создание прямоугольной диаграммы (барплот)
bar_plot <- ggplot(selected_countries_data_2015, aes(x = Country, y = Obesity, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  labs(title = "Уровень ожирения в выбранных странах по полу за 2015 год",
       x = "Страна",
       y = "Уровень ожирения") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Поворачиваем подписи по оси x

# Вывод прямоугольной диаграммы
print(bar_plot)

# Установим цвета для каждого пола
colors <- c("Male" = "blue", "Female" = "pink", "Both sexes" = "gray")

# Построим прямоугольную диаграмму рассеивания
ggplot(selected_countries_data_1975, aes(x = Country, y = Obesity, fill = Sex)) +
  geom_col(position = "dodge", color = "black") +
  scale_fill_manual(values = colors) +
  labs(title = "Распределение ожирения по полу в выбранных странах за 1975 год",
       x = "Страна",
       y = "Уровень ожирения") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



