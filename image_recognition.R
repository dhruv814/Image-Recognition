
folder <- "C:/Users/admin/Documents/R_project/trainingSet/"      # path to folder that holds multiple .csv files
digit_list <- list.files(path=folder, pattern="*") # create list of all .csv files in folder


library('jpeg')
distance <- function(a,b) {
  return(sqrt(sum(a-b)^2))
}
a = c()
dist = c()
file_name <- file.choose()
b = c(readJPEG(file_name))
m=c()

for (i in 1:length(digit_list)){
  path1 = paste("C:/Users/admin/Documents/R_project/trainingSet/",digit_list[i],"/",sep="")
  file_list <- list.files(path=path1, pattern="*.jpg")
  for( j in 1:length(file_list)){
    img_path = paste(path1,file_list[j],sep="")
    a=c(readJPEG(img_path))
    my_dist = distance(a,b)
    dist = c(dist,my_dist)
  }
  m=c(m,min(dist))
  dist=c()
}

min_dist=min(m)
for (k in 1:length(m)){
  if (m[k]==min_dist){
    k=k-1;
    break;
  }
}
require(tcltk)
ans=paste("THE MACHINE RECOGNIZED IMAGE IS ",k,sep ="")

msgBox <- tkmessageBox(title = "RESULT",
                       message = ans,type = "ok")


