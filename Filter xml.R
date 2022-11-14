library(XML)
library(methods)

xml_1 <- xmlParse('EXAMPLE_TRIAL_1.xml')
xml_2 <- xmlParse('EXAMPLE_TRIAL_2.xml')
xml_3 <- xmlParse('EXAMPLE_TRIAL_3.xml')
xml_result <- xmlParse('EXAMPLE_TRIAL_4.xml')

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


#Create a list of ALL xml files in a working directory
mylist2 <- list.files(pattern = '.xml')
View(mylist2)

#No clue why I need it but I apparently need to convert xml list to another list format?
mylistR <- as.list(mylist2)

#Remove unnecessary first row of new list to avoid errors
mylistR <- mylistR[- 1]
View(mylistR)

#Run get_reasons function on list
Q <- lapply(mylistR, publication_exist)
View(Q)


a <- xpathSApply(xml_1, "//why_stopped", xmlValue)
b <- xpathSApply(xml_1, "//url", xmlValue)

print(a)                 
print(b)

d <- data.frame(a, b)
d


mylist <- as.list(c('NCT00000105.xml', 'NCT00000723.xml', 'NCT00001219.xml'))

get_reasons <- function(x){
  xml_data <- xmlParse(x)
  why_stopped <- xpathSApply(xml_data, '//why_stopped', xmlValue)
  why_stopped
}

get_url <- function(x){
  xml_data <- xmlParse(x)
  all_your_url_are_mine <- xpathSApply(xml_data, '//url', xmlValue)
  all_your_url_are_mine
}

get_reasons('NCT00000105.xml')
get_reasons('NCT00000723.xml')
get_reasons('NCT00001219.xml')

data_list <- lapply(mylist2, get_reasons)
data_list2 <- lapply(mylist2, get_url)

get_reason_three <- as.data.frame(do.call("rbind", data_list), stringsAsFactors = FALSE)
get_reason_three <- as.data.frame(do.call("rbind", data_list2), stringsAsFactors = F)
get_reason_three


mylist2 <- list.files(pattern = '.xml')
mylist2

testing <- xpathSApply(xml_2, '//why_stopped', xmlValue)

<required_header>
  <download_date>ClinicalTrials.gov processed this data on November 01, 2021</download_date>
  <link_text>Link to the current ClinicalTrials.gov record.</link_text>
  <url>

reason_and_url_df <- function(x){
  url <- xpathSApply(xml_2, paste('//required_header/url'), xmlValue)
  if(length(xpathSApply(xml_2, paste('//why_stopped'), xmlValue)) > 0) {
    reason <- xpathSApply(xml_2, paste('//why_stopped'), xmlValue)
  }else{
    reason <- 'NO TERMINATION REASON PROVIDED'
  }
  as.data.frame(cbind(clinical_trial_link=url, why_stopped=reason))
}


xml_3, paste('//PubmedArticle/MedlineCitation[PMID=',pmid.value,']/PMID'), xmlValue)


data.list3 <- lapply(testing, reason_and_url_df)
testing3 <- as.data.frame(do.call("rbind", data.list3), stringsAsFactors = F)
tail(testing3)


reason_and_url_df <- function(x){
     url <- xpathSApply(xml_2, paste('//required_header/url'), xmlValue)
     if(length(xpathSApply(xml_2, paste('//why_stopped'), xmlValue)) > 0) {
         reason <- xpathSApply(xml_2, paste('//why_stopped'), xmlValue)
       }else{
           reason <- 'NO TERMINATION REASON PROVIDED'
         }
     as.data.frame(cbind(clintrial.govlink=url, why_stopped=reason))
   }
data.list3 <- lapply(testing, reason_and_url_df)
testing3 <- as.data.frame(do.call("rbind", data.list3), stringsAsFactors = F)
tail(testing3)


