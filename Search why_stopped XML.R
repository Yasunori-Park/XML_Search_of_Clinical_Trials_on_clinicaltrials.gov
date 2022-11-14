library(data.table)
library(XML)
library(methods)

#Function to search for element "url" under "required_header" element in xml files (get NCT url)
get_url <- function(x){
  xml_data <- xmlParse(x)
  if(length(xpathSApply(xml_data, '//required_header/url', xmlValue)) > 0) {
    url <- xpathSApply(xml_data, '//required_header/url', xmlValue)
  }else{
    url <- 'URL Missing'
  }
  return(url)
}

#Function to search for element "why_stopped" in xml files
get_reasons <- function(x){
  xml_data <- xmlParse(x)
  if(length(xpathSApply(xml_data, '//why_stopped', xmlValue, trim = T)) > 0) {
    why_stopped <- xpathSApply(xml_data, '//why_stopped', xmlValue, trim = T)
  }else{
    why_stopped <- 'No reason provided'
  }
  return(why_stopped)
}

#Function to search for element "//results_reference/citation" in xml files
publication_exist <- function(x){
  xml_data <- xmlParse(x)
  if(length(xpathSApply(xml_data, '//results_reference/citation', xmlValue, trim = T)) > 0) {
    why_stopped <- 'Citations are listed'
  }else{
    why_stopped <- 'No citations listed'
  }
  return(why_stopped)
}

#Function to search for element "//reference/citation" in xml files
publication_exist2 <- function(x){
  xml_data <- xmlParse(x)
  if(length(xpathSApply(xml_data, '//reference/citation', xmlValue, trim = T)) > 0) {
    why_stopped <- 'Documents are listed'
  }else{
    why_stopped <- 'No documents listed'
  }
  return(why_stopped)
}

#Create a list of ALL xml files in a working directory
mylist2 <- list.files(pattern = '.xml')
View(mylist2)

#No clue why I need it but I apparently need to convert xml list to another list format?
mylistR <- as.list(mylist2)

#Remove unnecessary first row of new list to avoid errors
mylistR <- mylistR[- 1]
View(mylistR)

#Run get_url function on list
K <- lapply(mylistR, get_url)

#Run get_reasons function on list
Z <- lapply(mylistR, get_reasons)

#Run publication_exist function on list
Q <- lapply(mylistR, publication_exist)

#Run publication_exist2 function on list 
R <- lapply(mylistR, publication_exist2)

#Merge both outputs into a single dataframe
A <-as.data.frame(cbind(url=K, reason=Z, publication=Q, other_publications = R))

#Outputs are currently two columns of lists, convert to character 
A$url = as.character(A$url)
A$reason = as.character(A$reason)
A$publication = as.character(A$publication)
A$other_publications = as.character(A$other_publications)

#Export output to a csv file for analysis
write.csv(A,"D:/TestingR\\Clin_Trial_Why_Terminated2.csv", row.names = FALSE)
print('Done')
