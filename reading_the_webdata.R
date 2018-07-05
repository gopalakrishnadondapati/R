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
