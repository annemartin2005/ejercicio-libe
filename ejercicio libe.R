setwd("C://Users//Anne//Desktop//BDATA1//ejercicio libe//ejercicio-libe//datos")
library(readxl)
library(lubridate)
library(dplyr)
datos <- read_xlsx("online_retail_II.xlsx")

datos$InvoiceDate <- ymd_hms(datos$InvoiceDate)
datos$Invoice <- as.factor(datos$Invoice)

summary(datos)
head(datos)
str(datos)
class(datos)
length(datos)
dim(datos)

perdidos_diferentes <- length(unique(datos$Invoice))

precio_medio <- datos %>% group_by(Invoice) %>% summarise(media = mean(n()))
media_producto <- datos %>% group_by(Invoice) %>% summarise(total = sum(Quantity))
