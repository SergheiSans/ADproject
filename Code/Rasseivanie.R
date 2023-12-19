# Выбор нужных стран
selected_countries <- c("Ukraine", "Australia", "Japan", "Brazil", "Zimbabwe", "India", "Швеция", "United Kingdom of Great Britain and Northern Ireland", "Russian Federation", "Germany")

# Фильтрация данных для выбранных стран в 1975 году
data_selected_2015 <- data[data$Year == 1975 & data$Country %in% selected_countries, ]

# Создание диаграммы рассеивания
ggplot(data_selected_1975, aes(x = factor(Sex), y = Obesity, color = Country)) +
  geom_point(position = position_jitter(width = 0.2, height = 0), size = 3) +
  labs(title = "Диаграмма рассеивания ожирения между женщинами и мужчинами в выбранных странах за 1975 год",
       x = "Пол",
       y = "Уровень ожирения",
       color = "Страна") +
  theme_minimal()

# Фильтрация данных для выбранных стран в 2015 году
data_selected_2015 <- data[data$Year == 2015 & data$Country %in% selected_countries, ]

# Создание диаграммы рассеивания
ggplot(data_selected_2015, aes(x = factor(Sex), y = Obesity, color = Country)) +
  geom_point(position = position_jitter(width = 0.2, height = 0), size = 3) +
  labs(title = "Диаграмма рассеивания ожирения между женщинами и мужчинами в выбранных странах за 2015 год",
       x = "Пол",
       y = "Уровень ожирения",
       color = "Страна") +
  theme_minimal()
