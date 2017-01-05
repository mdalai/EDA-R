getwd()
setwd('C:/Users/minga/Downloads/WI-PS data')

#rawData.temp <- read.csv("attendance_certified_2005-06/dropouts_certified_2005-06.csv")
#names(rawData.temp)
#rawData.MWK <- subset(rawData.temp, COUNTY=='Milwaukee')
#rawData.MPS <- subset(rawData.MWK, rawData.MWK$AGENCY_TYPE=='Public school')
#rawData.MPS1 <- subset(rawData.MPS, rawData.MPS$GROUP_BY=='All Students')

for (year in c('2005-06','2006-07','2007-08','2008-09','2009-10',
               '2010-11','2011-12','2012-13','2013-14','2014-15')){
  if (year == '2005-06') {
    rawData.temp <- read.csv(paste("attendance_certified_",year,"/dropouts_certified_",year,".csv",sep = ""))
    rawData.MPS <- subset(rawData.temp, (COUNTY=='Milwaukee' & AGENCY_TYPE=='Public school' 
                                                           & GROUP_BY=='All Students'))
  } else {
    rawData.temp <- read.csv(paste("attendance_certified_",year,"/dropouts_certified_",year,".csv",sep = ""))
    rawData.MPS <- rbind(rawData.MPS,subset(rawData.temp, (COUNTY=='Milwaukee' & AGENCY_TYPE=='Public school' 
                                                           & GROUP_BY=='All Students')))
  }
  
}


## for the history data, it is little complicated and different
for (year in c('2000-01','2001-02','2002-03','2003-04','2004-05')) {
  if (year == '2000-01') {
    rawData.temp <- read.csv(paste("all_topics_winss_",year,"/dropout_rate_",year,".csv",sep = ""))
    rawData.MPS1 <- subset(rawData.temp, (county=='40' & agency_type=='04'
                                         & grade=='Grades 7-12 Combined' 
                                         & race_ethnicity=='All Groups Combined'
                                         & gender=='Both Groups Combined'
                                         & disability_status=='Both Groups Combined'
                                         & economic_status=='Both Groups Combined'
                                         & english_proficiency_status=='Both Groups Combined'
                                         & enrollment != 0))
  } else {
    rawData.temp <- read.csv(paste("all_topics_winss_",year,"/dropout_rate_",year,".csv",sep = ""))
    rawData.MPS1 <- rbind(rawData.MPS1,subset(rawData.temp, (county=='40' & agency_type=='04' 
                                                           & grade=='Grades 7-12 Combined' 
                                                           & race_ethnicity=='All Groups Combined'
                                                           & gender=='Both Groups Combined'
                                                           & disability_status=='Both Groups Combined'
                                                           & economic_status=='Both Groups Combined'
                                                           & english_proficiency_status=='Both Groups Combined'
                                                           & enrollment != 0)))
  }
  
}

# export two group data

write.csv(rawData.MPS1,'MPS_data_2000_2004.csv',row.names=FALSE)
write.csv(rawData.MPS,'MPS_data_2005_2014.csv',row.names=FALSE)
df.MPS <- read.csv("MPS_data_2000_2014.csv")

