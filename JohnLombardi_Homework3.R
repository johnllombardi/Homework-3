rm(list=ls())
graphics.off()
path_to_data          = ('/Users/JohnLombardi/Desktop')
setwd(path_to_data)

install.packages("ggplot2")
library(ggplot2)
install.packages('tidyverse')
library(tidyverse)
install.packages('dplyr')
library(dplyr)
install.packages('coronavirus')
library(coronavirus)


#1
#a)
install.packages('coronavirus')
library(coronavirus)
data("coronavirus")
#b)
head(coronavirus,100)
#c)
#date is the date at which the number of cases is counted. Province is the specific province being looked at. Lat and Long are the latitude and longitude of the center of the region. type is if the cases have been confirmed/death/recovered. Cases is the number of cases recorded on a given date.

#2)
#a)

confirmed_country <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)
top_n(confirmed_country,20)

#b)
conf_df=data.frame(top_n(confirmed_country,5))

ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
  geom_bar(stat = "identity") + geom_text(aes(label=total_cases))

#c)
ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
  geom_bar(stat = "identity") + geom_text(aes(label=total_cases)) +
  coord_flip()

#d)
ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
  geom_bar(stat = "identity") +  geom_text(aes(label=total_cases)) +
  coord_flip()+
  ggtitle("Top 5 countries by total cases")

#3)
#a)
recent_cases = data.frame(coronavirus %>% 
                            filter(type == "confirmed") %>%
                            group_by(date) %>% 
                            summarise(total_cases=sum(cases)) )
recent_cases

#b)
ggplot(recent_cases,aes(x=date,y=total_cases))+
  geom_line()


#extra credit

  #1 #changes the font to comic sans
   ggplot(data=conf_df,aes(x=country,y=total_cases)) +
      geom_bar(stat = "identity") + geom_text(aes(label=total_cases)) +
      theme(text=element_text(family="Comic Sans MS"))
      
   #2 #changes bars color to red
   ggplot(data=conf_df,aes(x=country,y=total_cases)) +
     geom_bar(stat = "identity",fill = "#FF6666") + geom_text(aes(label=total_cases)) 
   
  #3 #changes the font size
   ggplot(data=conf_df,aes(x=country,y=total_cases)) +
     geom_bar(stat = "identity") + geom_text(aes(label=total_cases)) +
     theme(text=element_text(size=20))

  #4 #changes the size of the line
   ggplot(recent_cases,aes(x=date,y=total_cases))+
     geom_line(size=25)
  
  #5 #makes the line more translucent
   ggplot(recent_cases,aes(x=date,y=total_cases))+
     geom_line(size=10,alpha=0.3)

  #6 #changes line to dotted line
   ggplot(recent_cases,aes(x=date,y=total_cases))+
     geom_line(linetype="dotted") 
   
  #7 #changes the title to bold
   ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
     geom_bar(stat = "identity") +  geom_text(aes(label=total_cases)) +
     coord_flip()+
     ggtitle("Top 5 countries by total cases")+ 
     theme(plot.title = element_text(face="bold"))
   
  #8 #moves the title to the right
   ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
     geom_bar(stat = "identity") +  geom_text(aes(label=total_cases)) +
     coord_flip()+
     ggtitle("Top 5 countries by total cases")+ 
     theme(plot.title = element_text(hjust=1))
   
  #9 #changes bar width
   ggplot(data=conf_df,aes(x=country,y=total_cases)) + 
     geom_bar(stat = "identity",width=.1) +
     ggtitle("Top 5 countries by total cases")
   
  #10 #changes bar border color to red
   ggplot(data=conf_df,aes(x=country,y=total_cases)) +
     geom_bar(stat = "identity",color = "#FF6666") + geom_text(aes(label=total_cases)) 
   


