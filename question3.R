load("C:/Users/Fuchsg/Documents/GitHub/Stat/RentJAPDOWA.RData");

##Fits an 2 states gaussian model
#ResFit <- HMMFit(RentJ$Rt, nStates=2)
#VitPath <- viterbi(ResFit, RentJ$Rt)
## Graphic diagnostic
#HMMGraphicDiag(VitPath, ResFit, RentJ$Rt)

#Call:
#----
#HMMFit(obs = RentJ$Rt, nStates = 2)#

#Model:
#------
#2 states HMM with univariate gaussian distribution#

#Baum-Welch algorithm status:
#----------------------------
#Number of iterations : 29
#Last relative variation of LLH function: 0.000001#

#Estimation:
#-----------#

#Initial probabilities:
#          Pi 1 Pi 2
#  3.729613e-13    1#

#Transition matrix:
#           State 1   State 2
#State 1 0.98804510 0.0119549
#State 2 0.04270291 0.9572971#

#Conditionnal distribution parameters:#

#Distribution parameters:
#                 mean          var
#State 1  0.0002789481 0.0001307037
#State 2 -0.0013605076 0.0005949427#

#Log-likelihood: 16191.22
#BIC criterium: -32321.93
#AIC criterium: -32368.44



#Fits an 3 states gaussian model
ResFit <- HMMFit(RentJ$Rt, nStates=3)
VitPath <- viterbi(ResFit, RentJ$Rt)
# Graphic diagnostic
HMMGraphicDiag(VitPath, ResFit, RentJ$Rt)

#Call:
#----
#HMMFit(obs = RentJ$Rt, nStates = 3)#

#Model:
#------
#3 states HMM with univariate gaussian distribution#

#Baum-Welch algorithm status:
#----------------------------
#Number of iterations : 141
#Last relative variation of LLH function: 0.000001#

#Estimation:
#-----------#

#Initial probabilities:
#           Pi 1          Pi 2 Pi 3
#  3.247828e-107 2.260537e-103    1#

#Transition matrix:
#          State 1      State 2      State 3
#State 1 0.4700086 0.5133855756 1.660581e-02
#State 2 0.6447333 0.3552006006 6.607094e-05
#State 3 0.0364519 0.0004607448 9.630874e-01#

#Conditionnal distribution parameters:#

#Distribution parameters:
#                 mean          var
#State 1  0.0001701321 1.901878e-04
#State 2  0.0004148097 6.967014e-05
#State 3 -0.0014981798 6.102786e-04#

#Log-likelihood: 16208.44
#BIC criterium: -32295.86
#AIC criterium: -32388.88