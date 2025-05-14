# load libraries 
library(readxl) 
library(dplyr) 
library(ggplot2)    

# File path 
file_path <- "C:/Users/atifa/OneDrive/Documents/GitHub/Manhattan-Zoo/manhattan_zoo_meal_schedule.xlsx"
zoo_data <- read_excel(file_path)

# calculate how many times each animal needs to eat 
zoo_data <- zoo_data %>%
  mutate(FeedingCount = sapply(strsplit(Times, ","), length))

# Bar Chart
zoo_plot <- ggplot(zoo_data, aes(x = reorder(Animal, -FeedingCount), y = FeedingCount, fill = Animal)) +
  geom_bar(stat = "identity") +
  labs(title = "no of times animal needs to be feed",
       x = "animal",
       y = "no of meals") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
  guides(fill = FALSE)


ggsave("C:/Users/atifa/OneDrive/Documents/GitHub/Manhattan-Zoo/zoo_feeding_plot.png", plot = zoo_plot, width = 10, height = 6, dpi = 300)
