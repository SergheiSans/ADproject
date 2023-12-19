# Установка библиотеки stringr, если еще не установлена
if (!requireNamespace("stringr", quietly = TRUE)) {
  install.packages("stringr")
}

# Загрузка библиотек
library(stringr)

# Загрузка данных
file_path <- "E:/Uroki/Tretiikurs/AD/proectTest/obesity-cleaned.csv"
data <- read.csv(file_path)

# Удаление строк с "No data" в столбце "Obesity..."
data <- data[data$Obesity... != "No data", ]

# Использование stringr для извлечения числовых значений из строки
data$Obesity <- as.numeric(str_extract(data$Obesity..., "\\d+\\.\\d+"))

# Проверка наличия NA значений в столбце Obesity
na_indices <- which(is.na(data$Obesity))
if (length(na_indices) > 0) {
  print("Некоторые значения не могут быть преобразованы в числа. Пожалуйста, проверьте эти строки:")
  print(data[na_indices, ])
} else {
  # Линейная регрессия
  model <- lm(Obesity ~ Year, data = data)
  
  # Вывод результатов
  summary(model)
}

# Сортировка данных по убыванию процента ожирения
sorted_data <- data[order(-data$Obesity), ]

# Выбор топ 20 стран
top_20_countries <- head(sorted_data, 20)

# Вывод результатов
print(top_20_countries)


# Фильтрация данных для 2002 года
data_2002 <- data[data$Year == 2002, ]

# Сортировка данных по убыванию процента ожирения
sorted_data_2002 <- data_2002[order(-data_2002$Obesity), ]

# Выбор топ 20 стран
top_20_countries_2002 <- head(sorted_data_2002, 20)

# Вывод результатов
print(top_20_countries_2002)

# График точечного облака и линейной регрессии
plot(data$Year, data$Obesity, main = "Линейная регрессия",
     xlab = "Год", ylab = "Процент ожирения")
abline(model, col = "red")  # Добавление линии регрессии

# Вывод графика
