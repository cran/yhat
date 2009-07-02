commonalityCoefficients <-
function (dataMatrix, dv, ivlist, imat=FALSE){
########################################################################################

##DESCRIPTION
##Returns a list of two tables.
##The first table (CC) contains the list of commonality coefficents and % of variance for each effect.
##The second table (CCTotalByVar) totals the unique and common effects for each independent variable.

##REQUIRED ARGUMENTS
##dataMatrix	dataset containing the dependent and independent variables
##dv			dependent variable named in the dataset
##iv			list of independent variables named in the dataset
 
##OPTIONAL ARGUMENTS
##imat		echo flag - default to FALSE

##PSEUDO CODE
## Determine the number of independent variables (n).
## Generate an ID for each independent variable to 2^(n-1). 
## For example, the ID of the 1st independent variable is 2^0  = 1.
## Determine the number of commonality coefficients (2^n-1).
## Generate a bitmap matrix containing the bit representation of each commonality coefficient.
## Use the bitmap matrix to compute the R2 value for each combination of independent variables.
## Store the R2 value based on an index that is computed by ORing the IDs of the related IV.
## Use the bitmap matrix to generate the list of R2 values needed for each commonality coefficient.
## Use the list of R2 values to compute each commonality coefficient.
## Calculate the % explained variance for each commonality coefficient.
## Use the bitmap matrix to generate row headings for the first output table.
## Use the bitmap matrix to total the commonality coefficient effects by variable.
## Return the list of two tables.


## Determine the number of independent variables.
ivlist <- unlist(ivlist)
nvar=length(ivlist)

## Generate an ID for each independent variable to 2^(n-1). 
ivID <- matrix(nrow=nvar,ncol=1)
for (i in 0: nvar-1){
	ivID[i+1]=2^i
}
if (imat) print (ivID)

## Determine the number of commonality coefficients.
numcc=2**nvar-1

## Generate a matrix containing the bit representation of each commonality coefficient
effectBitMap<-matrix(0, nvar, numcc)
for (i in 1:numcc){
	effectBitMap<-setBits(i, effectBitMap)
}
if (imat) print (effectBitMap)

## Use the bitmap matrix to compute the R2 value for each combination of independent variables
## Store the R2 value based on an index that is computing by ORing the ids of the related IVs.
commonalityMatrix <- matrix(nrow=numcc,ncol=3)
for (i in 1: numcc){
	formula=paste(dv,"~", sep="") 
	for (j in 1: nvar){
		bit = effectBitMap[j,i]
		if (bit == 1){
			formula=paste(formula,paste("+",ivlist[[j]], sep=""), sep="")
		} 
	}
	commonalityMatrix[i,2]<-summary(lm(formula,dataMatrix))$r.squared
}
if (imat) print (commonalityMatrix)

## Use the bitmap matrix to generate the list of R2 values needed.
commonalityList<-vector("list", numcc)
for (i in 1: numcc){
	bit = effectBitMap[1,i]
	if (bit == 1) ilist <-c(0,-ivID[1])
		else  ilist<-ivID[1]
	for (j in 2: nvar){
		bit = effectBitMap[j,i]
		if (bit == 1){	
			alist<-ilist
			blist<-genList(ilist,-ivID[j])
			ilist<-c(alist,blist)
		}
		else ilist<-genList(ilist,ivID[j])
	}
	ilist<-ilist*-1
 	commonalityList[[i]]<-ilist
}
if (imat) print (commonalityList)

## Use the list of R2 values to compute each commonality coefficient.
for (i in 1: numcc){
	r2list <- unlist(commonalityList[i])
	numlist = length(r2list)
	ccsum=0
	for (j in 1:numlist){
		indexs = r2list[[j]]
		indexu = abs (indexs)
		if (indexu !=0) {
			ccvalue = commonalityMatrix[indexu,2]
			if (indexs < 0)ccvalue = ccvalue*-1
			ccsum=ccsum+ccvalue
		}
	} 
	commonalityMatrix[i,3]=ccsum
}
if (imat) print (commonalityMatrix)
	
## Calculate the % explained variance for each commonality coefficient.
orderList<-vector("list", numcc)
index=0
for (i in 1:nvar){
	for (j in 1:numcc){
		nbits=sum(effectBitMap[,j])
		if (nbits == i){
			index=index+1
			commonalityMatrix[index,1]<-j
		}
	}
}
if (imat) print (commonalityMatrix)

## Prepare first output table.
outputCommonalityMatrix <- matrix(nrow=numcc+1,ncol=2)
totalRSquare <- sum(commonalityMatrix[,3])
for (i in 1:numcc){
	outputCommonalityMatrix[i,1]<-round(commonalityMatrix[commonalityMatrix[i,1],3], digit=4)
	outputCommonalityMatrix[i,2]<-round((commonalityMatrix[commonalityMatrix[i,1],3]/totalRSquare)*100, digit=2)
}
outputCommonalityMatrix[numcc+1,1]<-round(totalRSquare,digit=4)
outputCommonalityMatrix[numcc+1,2]<-round(100,digit=4)

## Use the bitmap matrix to generate row headings for the first output table.
rowNames=NULL
for (i in 1: numcc){
	ii=commonalityMatrix[i,1]
	nbits=sum(effectBitMap[,ii])
	cbits=0
	if (nbits==1) rowName="Unique to "
		else rowName = "Common to "
	for (j in 1:nvar){
		if (effectBitMap[j,ii]==1){
			if (nbits==1)rowName=paste(rowName,ivlist[[j]],sep="")
			else {
				cbits=cbits+1
				if (cbits==nbits){
					rowName=paste(rowName,"and ", sep="")
					rowName=paste(rowName,ivlist[[j]],sep="")
				}
				else{
					rowName=paste(rowName,ivlist[[j]],sep="")
					rowName=paste(rowName,", ", sep="")
				}
			}		
		}
	}
	rowNames=c(rowNames,rowName)
}
rowNames=c(rowNames,"Total")
rowNames<-format.default(rowNames,justify="left")
colNames<-format.default(c ("Coefficient", " % Total"), justify="right")
dimnames(outputCommonalityMatrix)<-list(rowNames,colNames)
if (imat) print (outputCommonalityMatrix)

## Use the bitmap matrix to total the commonality coefficient effects by variable.
outputCCbyVar<-matrix(nrow=nvar,ncol=3)
for (i in 1:nvar){
	outputCCbyVar[i,1]=outputCommonalityMatrix[i,1]
	outputCCbyVar[i,3]=round(sum(effectBitMap[i,]*commonalityMatrix[,3]), digit=4)
	outputCCbyVar[i,2]=outputCCbyVar[i,3]-outputCCbyVar[i,1]
}
dimnames(outputCCbyVar)<-list(ivlist,c("Unique", "Common", "Total"))

## Return the list of two output tables.
outputList<-list(CC=outputCommonalityMatrix, CCTotalbyVar=outputCCbyVar)
return (outputList)
}

