# Downloading the webbased data in to R

csv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1561/datasets/chickwts.csv"
tsv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_3026/datasets/tsv_data.tsv"

# Read a file in from the CSV URL and assign it to csv_data
csv_data <- read.csv(csv_url)

# Read a file in from the TSV URL and assign it to tsv_data
tsv_data <- read.delim(tsv_url)

# Examine the objects with head()
head(csv_data)
head(tsv_data)


# Reading the files from the web is enough,but some time you want to store it into 
# locally to refer back 
# R has the function for this task
# It's take 2 arguments URL ,indicating the URL to read and destfile,the destination location 
# in local
download.file(url = csv_url,destfile = 'data.csv')
read.csv('data.csv')

# Connecting to the API (Application programming Interface)
# API's are the server components to make it easy for code interact with a service and get the data.
#  A Simple API client is pageviews package.
# Which acts as a client to Wikipedia API of pageviwe data.
library(pageviews)
article_pageviews()

# But Connecting the API's required the Acces tokens.
# Because as client we don't need what the API is doing ,we just write a code .
# But maintainer of the API's, care about what client is doing.
# Because many pepole simultaneously try to acces the data.then it risk the system.
# So as a result some API's required the access tokes.
# As a personwise or sessionwise tokens.
# It is easy for operator to limit the client request.
# Example of using the "biednik" package.
# To access the wordnik website.
# For access the key -->Just follow the wordnik developr portal



# Web scrapping using the rvest package.
library(rvest)
#Specifying the url for desired website to be scrapped
url <- 'https://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)
# I want to select following 
# Rank: The rank of the film from 1 to 100 on the list of 100 most popular feature films released in 2016.
#Title: The title of the feature film.
# Description: The description of the feature film.
# Runtime: The duration of the feature film.
# Genre: The genre of the feature film,
# Rating: The IMDb rating of the feature film.
# Metascore: The metascore on IMDb website for the feature film.
# Votes: Votes cast in favor of the feature film.
# Gross_Earning_in_Mil: The gross earnings of the feature film in millions.
# Director: The main director of the feature film. Note, in case of multiple directors, I'll take only the first.
# Actor: The main actor of the feature film. Note, in case of multiple actors, I'll take only the first.

# Place the mouse on Rank number then right click select "inspect"

rank_data_html <- html_nodes(webpage,'.text-primary')

#Converting the ranking data to text
rank_data <- as.numeric(html_text(rank_data_html))


title_data_html <- html_nodes(webpage,'.lister-item-header a')
#Converting the title data to text
title_data <- html_text(title_data_html)



# the description section
description_data_html <- html_nodes(webpage,".ratings-bar+ .text-muted")
description_data <- html_text(description_data_html)
head(description_data)
#Data-Preprocessing: removing '\n'
description_data <- gsub("\n    ","" ,description_data)


# runtime scetion
runtime_data_html <- html_nodes(webpage,'.text-muted .runtime')
runtime_data <- as.numeric(gsub(" min","",html_text(runtime_data_html)))

#Genere Section
genre_data_html <- html_nodes(webpage,'.genre')
genre_data <- html_text(genre_data_html)


# Rating section
rating_data_html <- html_nodes(webpage,".ratings-imdb-rating strong")
rating_data <- as.numeric(html_text(rating_data_html))

# metascore scetion
metascore_data_html <- html_nodes(webpage,'.metascore')
metascore_data <- html_text(metascore_data_html)
metascore_data <- as.numeric(gsub("       ","",metascore_data))

# Votes section
votes_data_html <- html_nodes(webpage,'.sort-num_votes-visible span:nth-child(2)')
votes_data <- html_text(votes_data_html)
votes_data <- as.numeric(gsub(',',"",votes_data))

# Gross earning
groos_data_html <- html_nodes(webpage,'.sort-num_votes-visible span:nth-child(5)')
gross_data <- html_text(groos_data_html)
gross_data <- gsub("M","",gross_data)
gross_data <- as.numeric(substring(gross_data,2,))

# Director section
director_data_html <- html_nodes(webpage,'.text-muted+p a:nth-child(1)')
director_data <- html_text(director_data_html)

# Actor section
actor_data_html <- html_nodes(webpage,'.lister-item-content .ghost+ a')
actor_html <- html_text(actor_data_html)

# Zomota
url <- 'https://www.zomato.com/bangalore/double-decker-1-brigade-road/reviews'

#Reading the HTML code from the website
webpage <- read_html(url)
popular_html <- html_nodes(webpage,xpath = "//div[@id='tabtop']//div[@class='notifications-content']/div[3]/div[1]/div//div[@tabindex='0']") 

html_text(popular_html)
remove <- gsub("\n                ","",html_text(popular_html))
remove <- gsub("                ","",remove)
gsub("\n","",remove)


# Zomota
url <- 'https://www.zomato.com/bangalore/double-decker-1-brigade-road/reviews'

#Reading the HTML code from the website
webpage <- read_html(url)
popular_html <- html_nodes(webpage,xpath = "//div[@class='res-reviews-container res-reviews-area']//div[@tabindex='0']")

html_text(popular_html)
remove <- gsub("\n                ","",html_text(popular_html))
remove <- gsub("                ","",remove)
gsub("\n","",remove)



# analyticsvidhya
url <- 'https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/'

#Reading the HTML code from the website
webpage <- read_html(url)
popular_html <- html_nodes(webpage,xpath = "//div[@class='text-content']//p[@style='text-align: justify;']")

html_text(popular_html)


# For Single Paragraph
url <- 'https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/'
 
   #Reading the HTML code from the website
webpage <- read_html(url)
popular_html <- html_nodes(webpage,xpath = "//*[@id='post-34233']/div/p[1]")
 
html_text(popular_html)


# For Table of Content matter.
url <- 'https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/'

#Reading the HTML code from the website
webpage <- read_html(url)
popular_html <- html_nodes(webpage,xpath = "//*[@id='post-34233']/div/ol")

html_text(popular_html)



