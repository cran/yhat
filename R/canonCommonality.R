canonCommonality<-function(A,B,nofns=1){
    CCdataR <- vector("list", 2)
    canon <- cca(A, B)
    Blist <- dimnames(B)[[2]]
    CCdata <- vector("list", nofns)
    for (i in 1:nofns) {
        CVA <- canon$canvarx[, i]
        data <- cbind(B, CVA)
        CCdata[[i]] <- commonalityCoefficients(data, "CVA", Blist, 
            "F")
    }
    CCdataR[[1]] <- CCdata 

    Blist <- dimnames(A)[[2]]
    CCdata <- vector("list", nofns)
    for (i in 1:nofns) {
        CVA <- canon$canvary[, i]
        data <- cbind(A, CVA)
        CCdata[[i]] <- commonalityCoefficients(data, "CVA", Blist, 
            "F")
    }
    CCdataR[[2]] <- CCdata
    return(CCdataR)
}