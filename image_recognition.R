
folder <- "C:/Users/admin/Documents/R_project/training/"      # path to folder that holds multiple .csv files
file_list <- list.files(path=folder, pattern="*.jpg") # create list of all .csv files in folder


library('jpeg')
distance <- function(a,b) {
  return(sqrt(sum(a-b)^2))
}
a = c()
dist = c()
b = c(readJPEG("C:/Users/admin/Documents/R_project/trainingSet/6/img_270.jpg"))
for (i in 1:length(file_list)){
  path = paste("C:/Users/admin/Documents/R_project/training/",file_list[i],sep="")
  a=c(readJPEG(path))
  my_dist = distance(a,b)
  dist = c(dist,my_dist)
}
m=min(dist)

for (i in 1:length(file_list)){
  if (m==dist[i]){
    print(file_list[i])
  }
}

