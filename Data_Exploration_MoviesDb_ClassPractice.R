setwd("C:/Users/ashranja/Downloads/ml-100k")
#install.packages("ggplot2")
library(ggplot2)

## Analysis on Movielens datasets
# Movie Lens users database
users = read.csv("u.user",sep="|", header = F, encoding="latin-1")

## Set column names to the fields
names(users) = c('user_id','age','sex','occupation','zip_code')
colnames(users)
View(users)

## Movie Lens Ratings data file
ratings = read.csv("u.data",sep= "\t", header=F,encoding = "latin-1")
names(ratings) = c('user_id','movie_id','rating','unix_stamp')
colnames(ratings)

## movies information
movies = read.csv("u.item",sep="|",header = F, encoding = "latin-1")
movie_file_names = c('movie_id','title','release_date',
                     'video_release_date','imdb_url')
names(movies) = movie_file_names
# Extract first five fields and all rows from Movies table
movies = movies[ , 1:5]

# merge movies and ratings file using movie id
MY_RATINGS = merge(movies,ratings,by="movie_id")

# MERGE ALL THREES FILES (MOVIES WITH RATINGS AND USERS BY USER_ID)
MY_RATINGS_USR = merge(MY_RATINGS,users,by="user_id")

## If required delete the other fiels after merging all the files
#ls()
#rm("ratings","movies","users")

colnames(MY_RATINGS_USR)
head(MY_RATINGS_USR)
table(MY_RATINGS_USR$title)

# Create a field MY_RATINGS_URS$dummy with value 1 to accumalate and get frequency for each title 
MY_RATINGS_USR$dummy = 1

# Calculate Number of Times the Title has been rated (FREQ COUNT)
# MY_RATINGS_USR$title sum(My_RATINGS_USR$dUMMY)
tab = aggregate(MY_RATINGS_USR$rating, by=list(unique.values = MY_RATINGS_USR$title), FUN=mean)
head(tab)
names(tab)
tab = tab[order(tab$x,decreasing=TRUE),]
head(tab)
# Get AVERAGE ratings for each movie ttitle
View(MY_RATINGS_USR)
# MY_RATINGS_USR$title Mean(MY_RATINGS_USR$rating)
tab2 = aggregate(MY_RATINGS_USR$rating, by =
                   list(MY_RATINGS_USR$title),FUN=mean)                
tab2 = tab2[order(tab2$x,decreasing=TRUE),]
View(tab2)
head(tab2)

tab = aggregate(MY_RATINGS_USR$rating, by =
                   list(MY_RATINGS_USR$title),FUN=length)                
tab = tab[order(tab$x,decreasing=TRUE),]
View(tab2)
head(tab2)

# merge number of ratings with avg rating
# Merge Number of Times the Title has been rated with the Average Rating for Each Title into one single output table(movies_num_avg_rtng)
# MY_RATINGS_USR$title sum(My_RATINGS_USR$dUMMY) Mean(MY_RATINGS_USR$rating)
movies_num_avg_rtng = merge(tab,tab2,by="Group.1")
names(movies_num_avg_rtng) = c("movie_name","total_rating",
                               "avg_rating")

# Create a Scatter Plot for Total_Rating as Cause and avg_rating as effect
ggplot(movies_num_avg_rtng
       ,aes(total_rating,avg_rating)) + 
  geom_point()
head(MY_RATINGS_USR$release_date)
MY_RATINGS_USR$year = as.numeric(substr(MY_RATINGS_USR$release_date,
                                        8,11))
head(MY_RATINGS_USR)

year_avg = aggregate(MY_RATINGS_USR$rating, by=list(MY_RATINGS_USR$year), FUN=mean)

head(year_avg)
## deleting the first record to avoid 971(which is a typo)
year_avg = year_avg[-1,]
names(year_avg ) = c("Year", "avg_rating")
ggplot( year_avg, aes(Year, avg_rating)) + geom_point()

##What were the most popular movie genres year by year?
###

setwd("C:/Users/ashranja/Downloads/ml-20m")
movie_df=read.csv("movies.csv")
require(dplyr)
require(tidyr)
genres_df <- movie_df %>%
  separate_rows(genres, sep = "\\|") %>%
  group_by(genres) %>%
  summarise(number = n()) %>%
  arrange(desc(number))

genres_df=data.frame(genres_df)

mv_ratings_genre=merge(MY_RATINGS,movie_df,by="title")
mv_ratings_genre$year = as.numeric(substr(mv_ratings_genre$release_date,8,11))
# Genres popularity per year

#What were the best movies of every decade (based on users' ratings)?
 # What were the best years for a genre (based on users' ratings)?
genres_popularity <- mv_ratings_genre %>%
  #na.omit() %>% # omit missing values
  select(movie_id, year, genres) %>% # select columns we are interested in
  separate_rows(genres, sep = "\\|") %>% # separate genres into rows
  mutate(genres = as.factor(genres)) %>% # turn genres in factors
  group_by(year, genres) %>% # group data by year and genre
  summarise(number = n()) %>% # count
  complete(year = full_seq(year, 1), genres, fill = list(number = 0)) # add missing years/genres
genres_popularity=data.frame(genres_popularity)
genres_popularity=genres_popularity[order(genres_popularity$number,
                                          decreasing = T),]
genres_popularity %>%
  filter(year > 1930) %>%
  filter(genres %in% c("War", "Sci-Fi", "Animation", "Western")) %>%
  ggplot(aes(x = year, y = number)) +
  geom_line(aes(color=genres)) +
  scale_fill_brewer(palette = "Paired") 


# average rating for a movie
avg_rating <- mv_ratings_genre %>%
  select(movie_id, title, rating, year) %>%
  group_by(movie_id, title, year) %>%
  summarise(count = n(), mean = mean(rating), min = min(rating), max = max(rating)) %>%
  ungroup() %>%
  arrange(desc(mean))

#What were the best years for a genre (based on users' ratings)?
genres_rating <- mv_ratings_genre %>%
select(movie_id, year, genres,rating) %>%
  mutate(decade = year  %/% 10 * 10) %>%
  separate_rows(genres, sep = "\\|") %>%
  group_by(year, genres) %>%
  summarise(count = n(), avg_rating = mean(rating)) %>%
  ungroup() %>%
  arrange(year)


genres_rating %>%
  #filter(genres %in% genres_top$genres) %>%
  filter(genres %in% c("Action", "Romance", "Sci-Fi", "Western")) %>%
  ggplot(aes(x = year, y = avg_rating)) +
  geom_line(aes(group=genres, color=genres)) +
  geom_smooth(aes(group=genres, color=genres)) +
  facet_wrap(~genres)
### distribution of age 
ggplot(aes(x=age), data=users) + geom_histogram(aes(fill=..count..), binwidth = 5) + 
  ggtitle("Distribution of users' ages") + xlab('age') +ylab('count of users') + 
  scale_x_continuous(breaks = seq(0,81,5)) + 
  scale_fill_gradient("Count", low = "#66CCFF", high = "#003366")

## distribution of age v/s sex 

ggplot(aes(x=age), data=users) + geom_histogram(aes(fill=..count..), binwidth = 5) + 
  ggtitle("Distribution of users' ages") + xlab('age') +ylab('count of users') + 
  scale_x_continuous(breaks = seq(0,81,5)) + 
  scale_fill_gradient("Count", low = "#66CCFF", high = "#003366") + 
  facet_wrap(~sex, ncol=2)

## Ratings by Age Group
#I am interested in comparing ratings by different ages. To easily analyze the data, I put data into eight age groups.

agelabel <- c('0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79')
MY_RATINGS_USR$age_group <- cut(MY_RATINGS_USR$age,
                                seq(0,81,10),
                                include.lowest=TRUE, 
                                right=FALSE, 
                                labels=agelabel)

rating_by_age_group <- MY_RATINGS_USR %>% group_by(age_group) %>% summarise(mean=mean(rating))

ggplot(data=rating_by_age_group, aes(x=age_group, y=mean)) +
  geom_bar(stat="identity", fill="#FF6666") + 
  scale_y_continuous(limits = c(0, 5)) + 
  ggtitle("Ratings by Age Group") + 
  ylab("Movie Ratings") + 
  xlab("Age Groups")

## ratings with age and gender
rating_by_age_group_sex <- MY_RATINGS_USR %>% group_by(sex, age_group) %>% summarise(mean=mean(rating))
ggplot(data=rating_by_age_group_sex, aes(x=age_group, y=mean, fill=sex)) +
  geom_bar(stat="identity", position=position_dodge()) + 
  scale_y_continuous(limits = c(0, 5))+ 
  ggtitle("Ratings by Age Group and Sex") + 
  ylab("Movie Ratings") + 
  xlab("Age Groups")





