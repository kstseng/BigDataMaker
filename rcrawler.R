install.packages("rvest")
library(rvest)

#---
newsurl <- "http://www.appledaily.com.tw/realtimenews/section/new/" 
apple <- read_html(newsurl, encoding="UTF-8") # 讀取原始碼(不乾淨)
apple %>% iconv(from='UTF-8', to='UTF-8')     # 資料剖析(去標籤)

#---
apple %>% html_nodes('title') %>% html_text()  %>% iconv('UTF-8', 'UTF-8') 
apple %>% html_nodes('li.rtddt') %>% iconv('UTF-8', 'UTF-8')

rtddt <- apple %>% html_nodes('.rtddt')# %>% iconv(from='UTF-8', to='UTF-8')
rtddt[1]

#---
time <- rtddt %>% html_nodes('time') %>% html_text()
title <- rtddt %>% html_node('h1')  %>% html_text() %>% iconv('UTF-8', 'UTF-8')
category <- rtddt %>% html_node('h2')  %>% html_text() %>% iconv('UTF-8', 'UTF-8')

applenews <- data.frame(time=time, title = title, category = category)






