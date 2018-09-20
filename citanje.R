# sample code for paper titled "Otvoreni nastavni materijali: Interna iskustva" or
# in English "Open educational resources: In-house experiences"

#install.packages("readODS")
#install.packages("ggplot2")
library(readODS)
library(ggplot2)

# read the first sheet and show scatter plot --------------------------------
dat <- read_ods("textbooksETFeng.ods", sheet = 1, col_names = TRUE, col_types = NULL,
        na = "", skip = 0, formula_as_formula = FALSE, range = NULL)
head(dat)
View(dat)

ggplot(dat, aes(x = year, y = `number of textbooks`)) +
  geom_point(size = 3) +
  geom_line(linetype = "dashed")


# read the second sheet and show simple plots ------------------------------
dat1 <- read_ods("textbooksETFeng.ods", sheet = 2, col_names = TRUE, col_types = NULL,
                na = "", skip = 0, formula_as_formula = FALSE, range = NULL) 
head(dat1)

ggplot(dat1, aes(x = num, y = `number of author(s)`, col = licence)) +
  geom_point(size = 3)

ggplot(dat1, aes(x = num, y = `number of author(s)`, col = letter)) +
  geom_point(size = 3)

ggplot(dat1, aes(x = num, y = `number of author(s)`, col = `publisher(s)`)) +
  geom_point(size = 3)
