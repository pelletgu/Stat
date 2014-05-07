load("C:/Users/Fuchsg/Documents/GitHub/Stat/RentJAPDOWA.RData")

####Etude des rentabilités journalières####
par(mfrow=c(3,2));

#On affiche les différentes valeurs des valeurs journalières
plot(RentJ$Dates,RentJ$Rt)

#Calcul de la moyenne et de la variance
m<- mean(RentJ$Rt)
s<-sqrt(var(RentJ$Rt)) 

#z est le densité
z<-density(RentJ$Rt)
plot(z, type="l", main="Densite empirique des rentabilites journalieres")


#y est la densité empirique calculée au même point -> calcul par la méthode du noyau ( on donne la fonction en des points)
y<-dnorm(z$x,m,s)

#On la trace
lines(z$x,y,col='red')

####Etude des rentabilités hebdomadaires####

#On affiche les différentes valeurs des valeurs hebdomadaires
plot(RentH$Dates,RentH$Rt)

#Calcul de la moyenne et de la variance
m<- mean(RentH$Rt)
s<-sqrt(var(RentH$Rt))

#z est le densité
z<-density(RentH$Rt)
plot(z, type="l", main="Densite empirique des rentabilites hebdomadaires")

#y est la densité empirique calculée au même point -> calcul par la méthode du noyau ( on donne la fonction en des points)
y<-dnorm(z$x,m,s)

#On la trace concrètement
lines(z$x,y,col='red')

####Etude des rentabilités mensuelles####

#On affiche les différentes valeurs des valeurs mensuelles
plot(RentM$Dates,RentM$Rt)

#Calcul de la moyenne et de la variance
m<- mean(RentM$Rt)
s<-sqrt(var(RentM$Rt))#

#z est le densité
z<-density(RentM$Rt)
plot(z, type="l", main="Densite empirique des rentabilites mensuelles")

##y est la densité empirique calculée au même point -> calcul par la méthode du noyau ( on donne la fonction en des points)
y<-dnorm(z$x,m,s)

#//On la trace concrètement
lines(z$x,y,col='red')