regr <-
function(lm.out){

ifelse (length(lm.out$call)>2, 
new.data<-eval(as.name(lm.out$call[[3]]),parent.frame()), new.data<-model.frame(lm.out$call[[2]]))

new.scale<-model.matrix(lm.out)
v<-as.numeric(row.names(new.scale))
new.data<-new.data[v,]

#### Get Variables
IV<-attr(lm.out$terms,"term.labels")
DV<-dimnames(attr(lm.out$terms,"factors"))[[1]][1]


#### Beta Weights and Structure Coefficients
new.scale[,1]<-lm.out$model[,1]
new.scale<-data.frame(new.scale)
colnames(new.scale)<-c(DV,IV)
beta.out<-coef(lm.out)[-1]*sapply(new.scale[IV],"sd")/sd(new.scale[DV])
structure.coef<-cor(na.omit(fitted.values(lm.out)),new.scale[IV])

#### Run Communality Coefficients
CCdata=commonalityCoefficients(new.data,DV, IV, "F")

#### Calculate effect sizes
es=effect.size(lm.out)

#### Return
return(list(LM_Output=summary(lm.out), Beta_Weights=beta.out, Structure_Coefficients=structure.coef, Commonality_Data=CCdata, Effect_Size=es, 
Comment="The Effect Size recommendations are based on Yin and Fan (2001). Your dataset may take on a different covariance structure, thus making another effect size estimate more appropriate."))
}


