# Фильтрация данных для самой низкой и самой высокой страны по уровню ожирения в 2015 году
extreme_obesity_2015 <- data %>%
  filter(Year == 2015) %>%
  arrange(Obesity)

# Построение диаграммы
ggplot(extreme_obesity_2015, aes(x = reorder(Country, Obesity), y = Obesity, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Самая низкая и самая высокая страна по уровню ожирения в 2015 году",
       x = "Страна",
       y = "Уровень ожирения") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
