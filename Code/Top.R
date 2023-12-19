# Фильтрация данных для топ-6 стран по уровню ожирения в 1975 году
top10_obesity_1975 <- data %>%
  filter(Year == 1975) %>%
  arrange(desc(Obesity)) %>%
  head(10)

# Построение прямоугольной диаграммы
ggplot(top10_obesity_1975, aes(x = reorder(Country, -Obesity), y = Obesity, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Топ-6 стран по уровню ожирения в 1975 году",
       x = "Страна",
       y = "Уровень ожирения") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Фильтрация данных для топ-6 стран по уровню ожирения в 2015 году
top10_obesity_2015 <- data %>%
  filter(Year == 2015) %>%
  arrange(desc(Obesity)) %>%
  head(10)

# Построение прямоугольной диаграммы
ggplot(top10_obesity_2015, aes(x = reorder(Country, -Obesity), y = Obesity, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Топ-6 стран по уровню ожирения в 2015 году",
       x = "Страна",
       y = "Уровень ожирения") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
