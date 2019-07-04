library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/dra-immap-microdata1")
data <- read_excel("resource1.xlsx", sheet = "Sheet1", skip = 2)

#Xchange Bangladesh microdata
selectedKeyVars <- c('Q104',	'Q11', 'Q13',	'Q14',	
                     'Q15',	'Q16',	'Q17',	'Q18',
                     'Q19',	'Q20',	'Q21',	'Q22',
                     'Q23',	'Q24',	'Q25',	'Q26',
                     'Q27','Q252'
                     )
#weightVar <- c('weight')

#Convert variables into factors
cols =  c('Q104',	'Q11', 'Q13',	'Q14',	
          'Q15',	'Q16',	'Q17',	'Q18',
          'Q19',	'Q20',	'Q21',	'Q22',
          'Q23',	'Q24',	'Q25',	'Q26',	
          'Q27', 'Q252')
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)

#Assess the disclosure risk
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)
print(objSDC, "risk")
report(objSDC, filename ="index",internal = T) 
