
## ---- demographics
X <- read.table(file = "results.csv", header = TRUE, sep = ";");
X$Gender <- sapply(X[,16], function(x) if(x=="weiblich") {"w"} else {"m"});
X$Alter <- as.factor(sapply(X$"Wie.alt.sind.Sie.", function(x) if(x<40){"unter 40"} else {"über 40"}));
X$Kontakt <- factor(as.factor(sapply(X[,18], function(x)
	if(x=="Ich bin selber Informatiker"){"selbst InformatikerIn"}
	else {if(x=="Ein nahes Familienmitglied (Eltern/Kinder/Partner) ist InformatikerIn") {"Familienmitglied"}
		else {if (x=="In meinem privaten Bekanntenkreis gibt es InformatikerInnen") {"im Bekanntenkreis"}
			else {if(x=="Ich habe direkten beruflichen Kontakt mit InformatikerInnen") {"Beruflicher Kontakt"}
				else {"kein Kontakt"} } } } ) ), levels = c ("selbst InformatikerIn","Familienmitglied","im Bekanntenkreis","Beruflicher Kontakt","kein Kontakt"), ordered = TRUE );
X$Games <- factor(as.factor(sapply(X[,9], function(x)
	if(x=="gelegentlich") {"gelegentlich"}
	else {if(x=="mehrere Stunden pro Woche") {"mehrere Stunden pro Woche"}
		else {"mehrere Stunden am Tag"} } ) ), levels = c("gelegentlich","mehrere Stunden pro Woche","mehrere Stunden am Tag"),ordered=TRUE);
X$Beziehung <- factor(as.factor(sapply(X[,12], function(x)
	if(x=="ledig") {"ledig"}
	else {if(x=="in einer Beziehung") {"in einer Beziehung"}
		else {"seit Jahren in Beziehung"} } ) ),levels = c("ledig","in einer Beziehung","seit Jahren in Beziehung"),ordered=TRUE);
X$Frauenquote <- X[,6];

total.participants = function() {
    dim(X)[1]
}

total.young = function() {
	age <- X[X$Alter=="unter 40",]
	dim(age)[1]
}

perc.young = function() {
	age <- X[X$Alter=="unter 40",]
	round(dim(age)[1]/dim(X)[1],2)*100
}

total.female = function() {
	length(X$Gender[X$Gender=="w"]);
}

total.male = function() {
    length(X$Gender[X$Gender=="m"]);
}

## ---- table_contact
Kontaktart <- levels(X$Kontakt)
Anzahl <- as.numeric(table(X$Kontakt))
matr = data.frame(Kontaktart, Anzahl)
kable(matr, digits=2, booktabs=TRUE)

## ---- chart_age-games
mat <- prop.table(table(cbind(X["Games"], X["Alter"])),margin=2)
library(lattice)
barchart(mat,stack = FALSE, horizontal = FALSE, groups = "Alter", scales = list(rot = 90), ylab = "Anteil")

## ---- chart_age-beziehung
mat <- prop.table(table(cbind(X["Beziehung"], X["Alter"])),margin=2)
library(lattice)
barchart(mat,stack = FALSE, horizontal = FALSE, groups = "Alter", scales = list(rot = 90), ylab = "Anteil")

## ---- chart_jobs
k <- c(rep("Programmieren",49),rep("Entwicklung",23),rep("Support",14),rep("Systeme einrichten/pflegen",12),rep("Kommunikation",11),rep("Probleme beseitigen",11),rep("Informationsverarbeitung",8),rep("Projektmanagement",8),rep("Analyse",7),rep("Optimierungen",7),rep("Admin",5),rep("Computerreparatur",5),rep("Debuggin",5),rep("sonst",34))
library(lattice)
barchart(sort(table(k)),xlab="Anzahl")

## ---- chart_quote
library(lattice)
bwplot(X$Kontakt ~ X$Frauenquote, xlab="Frauenquote in Prozent")