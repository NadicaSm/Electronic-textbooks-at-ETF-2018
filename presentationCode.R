# Code for presentation held during PSSOH 2018 and titled "Otvoreni nastavni materijali:
# Interna iskustva" or in English "Open educational resources: In-house experiences"

# version:
# platform       x86_64-w64-mingw32          
# arch           x86_64                      
# os             mingw32                     
# system         x86_64, mingw32             
# status                                     
# major          3                           
# minor          4.3                         
# year           2017                        
# month          11                          
# day            30                          
# svn rev        73796                       
# language       R                           
# version.string R version 3.4.3 (2017-11-30)

# Plotting timeline graphs ------------------------------------------------

# install.packages("timevis")
library(timevis)

# with ETF
dat <- data.frame(
  id      = 1:11,
  content = c("Internet", "MIT announcement",
              "UNESCO forum: OER definition", "MIT OpenCourseWare",
              "MIT report", "Wikiversity",
              "Coursera", "edX",
              "Regulations", "First ETF OER", "Open Science Platform"),
  start   = c("1995", "2001",
              "2002", "2002",
              "2006", "2006",
              "2012", "2012",
              "2007", "2010", "2018"),
  end     = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
  group = c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2),
  style = c(NA, NA, NA, NA, NA, NA, NA, NA,
            "background-color: gold; border: gold;",
            "background-color: gold; border: gold;",
            "background-color: gold; border: gold;"))

timevis(dat, groups = data.frame(id = 1:2, content = c("World", "ETF"), 
                                 style = c("color: steelblue; font-weight: bold;",
                                           "color: orange; font-weight: bold;")))

# without ETF
dat1 <- data.frame(
  id      = 1:8,
  content = c("Internet", "MIT announcement",
              "UNESCO forum: OER definition", "MIT OpenCourseWare",
              "MIT report", "Wikiversity",
              "Coursera", "edX"),
  start   = c("1995", "2001",
              "2002", "2002",
              "2006", "2006",
              "2012", "2012"),
  end     = c(NA, NA, NA, NA, NA, NA, NA, NA),
  group = c(1, 1, 1, 1, 1, 1, 1, 1),
  style = c(NA, NA, NA, NA, NA, NA, NA, NA))

timevis(dat1)


# Plotting other open textbooks graphs ------------------------------------

#install.packages("readODS")
#install.packages("ggplot2")
library(readODS)
library(ggplot2)

dat2 <- read_ods("textbooksETFeng.ods", sheet = 2, col_names = TRUE, col_types = NULL,
                 na = "", skip = 0, formula_as_formula = FALSE, range = NULL) 
head(dat2)

ggplot(dat2, aes(year)) +
  geom_bar() +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name = "count", 
                   limits = c("1", "2", "3", "4", "5",
                              "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits = c(2010, 2011, 2012, 2013,
                              2014, 2015, 2016, 2017,
                              2018))
ggsave("OERgrowth.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)

ggplot(dat2, aes(year, fill = `application of free software`)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top")  +
  scale_y_discrete(name = "count", 
                   limits = c("1", "2", "3", "4", "5",
                              "6", "7", "8", "9", "10")) +
  scale_x_discrete(name = "year", 
                   limits = c(2010, 2011, 2012, 2013,
                              2014, 2015, 2016, 2017,
                              2018)) +
  scale_fill_brewer(palette = "Accent")
ggsave("fsf.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)


ggplot(dat2, aes(year, fill = licence)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name ="count", 
                   limits=c("1", "2", "3", "4", "5",
                            "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits=c(2010, 2011, 2012, 2013,
                            2014, 2015, 2016, 2017,
                            2018)) +
  scale_fill_brewer(palette = "BrBG")
ggsave("licence.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)


ggplot(dat2, aes(year, fill = hyperlinks)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name ="count", 
                   limits=c("1", "2", "3", "4", "5",
                            "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits=c(2010, 2011, 2012, 2013,
                            2014, 2015, 2016, 2017,
                            2018)) +
  scale_fill_brewer(palette = "Accent")
ggsave("hyperlinks.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)


ggplot(dat2, aes(year, fill = `publisher(s)`)) +
  geom_bar(width = 0.9) +
  ggtitle("Number of textbooks per year") +
  coord_flip() +
  theme(legend.position = "top") +
  scale_y_discrete(name ="count", 
                   limits=c("1", "2", "3", "4", "5",
                            "6", "7", "8", "9", "10")) +
  scale_x_discrete(name ="year", 
                   limits=c(2010, 2011, 2012, 2013,
                            2014, 2015, 2016, 2017,
                            2018)) +
  scale_fill_brewer(palette = "Paired")
ggsave("publisher2.tiff", units = "in", width = 6, height = 4, 
       dpi = 400)