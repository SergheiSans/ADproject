# Загрузка библиотек
library(tidyverse)
library(caret)

# Загрузка данных
file_path <- "E:/Uroki/Tretiikurs/AD/proectTest/obesity-cleaned.csv"
data <- read.csv(file_path)

# Предварительная обработка данных
# Заполнение пропущенных значений (замените "Obesity (%)" на соответствующее имя столбца)
data$`Obesity (%)`[is.na(data$`Obesity (%)`)] <- mean(data$`Obesity (%)`, na.rm = TRUE)

# Убедимся, что столбец "Obesity (%)" имеет числовой тип данных
data$`Obesity (%)` <- as.numeric(data$`Obesity (%)`)

# Проверим пропущенные значения и заменим их на среднее
data$`Obesity (%)`[is.na(data$`Obesity (%)`)] <- mean(data$`Obesity (%)`, na.rm = TRUE)

# Посмотрим на уникальные типы данных в столбце "Obesity (%)"
unique_types <- unique(sapply(data$`Obesity (%)`, class))
print(unique_types)

# Преобразование столбца "Obesity (%)" в числовой тип данных
data$`Obesity (%)` <- as.numeric(as.character(data$`Obesity (%)`))

# Проверим пропущенные значения и заменим их на среднее
data$`Obesity (%)`[is.na(data$`Obesity (%)`)] <- mean(data$`Obesity (%)`, na.rm = TRUE)


# Кодирование категориальных переменных (если "Sex" - категориальная переменная)
# data$Sex <- as.factor(data$Sex)

# Разделение данных на обучающий и тестовый наборы
set.seed(123)  # для воспроизводимости результатов
train_index <- createDataPartition(data$`Obesity (%)`, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Обучение модели линейной регрессии
model <- lm(`Obesity (%)` ~ Year + Sex, data = train_data)

# Предсказание на тестовом наборе
predictions <- predict(model, newdata = test_data)

# Оценка качества модели
accuracy <- sqrt(mean((predictions - test_data$`Obesity (%)`)^2))
print(paste("Root Mean Squared Error (RMSE):", accuracy))

# Предсказание для 2017 года (замените "YourCountry" на конкретное название страны)
new_data <- data.frame(Country = "YourCountry", Year = 2017, Sex = "YourSex")
prediction_2017 <- predict(model, newdata = new_data)
print(paste("Predicted Obesity (%) in 2017 for YourCountry:", prediction_2017))
