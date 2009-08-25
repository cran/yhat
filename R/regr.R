regr<-function(lm.out){

ifelse (length(lm.out$call)==3, 
new.data<-eval(as.name(lm.out$call[[3]]),parent.frame()), new.data<-model.frame(lm.out$call[[2]]))


#j<-ncol(new.data) 
#for (i in 1:j){ 
#if (is.factor(new.data[,i]) == TRUE)
#new.data[,i]<-as.numeric(new.data[,i])
#} 

#### Get Variables
IV<-attr(lm.out$terms,"term.labels")
DV<-dimnames(attr(lm.out$terms,"factors"))[[1]][1]


#### Beta Weights and Structure Coefficients
new.scale<-model.matrix(lm.out)
new.scale[,1]<-lm.out$model[,1]
new.scale<-data.frame(new.scale)
colnames(new.scale)<-c(DV,IV)
cor.scale<-cor(new.scale)
beta.out<-mat.regress(cor.scale, c(2:ncol(cor.scale)), 1)$beta

y.hat.data<-cbind(fitted.values(lm.out), model.matrix(lm.out)[,2:ncol(cor.scale)])
structure.coef<-cor(y.hat.data)[1,2:ncol(cor.scale)]

#### Run Communality Coefficients
CCdata=commonalityCoefficients(new.data,DV, IV, "F")

#### Calculate effect sizes
es=effect.size(lm.out)

#### Return
return(list(LM_Output=summary(lm.out), Beta_Weights=beta.out, Structure_Coefficients=structure.coef, Commonality_Data=CCdata, Effect_Size=es, 
Comment="The Effect Size recommendations are based on Yin and Fan (2001). Your dataset may take on a different covariance structure, thus making another effect size estimate more appropriate."))
}
