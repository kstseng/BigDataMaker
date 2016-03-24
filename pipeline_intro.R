#--- pipe line introduction
data(iris)
tail(head(iris), 3)
iris %>% head() %>% tail(3)