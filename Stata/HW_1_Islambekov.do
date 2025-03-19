use ".dta", clear
recode homeowner (2=1) (else=0), gen(homeowner_binary)  
recode a218b (1/2=1) (3/5=0), gen(a218b_binary) 
recode a219b (1/2=1) (3/5=0), gen(a219b_binary) 
recode a218e (1/2=1) (3/5=0), gen(a218e_binary)  


corr income totalchildren homeowner_binary a217 a218b_binary a219b_binary a218e_binary
ranksum a217, by(homeowner_binary)

gen a217_high = .
replace a217_high = 1 if a217 >= 8  
replace a217_high = 0 if a217 < 8  
tab a217_high homeowner_binary, chi2



regress a217 income homeowner_binary totalchildren
regress a217 a218b_binary a219b_binary
regress a217 a218e_binary
regress a217 income totalchildren homeowner_binary a218b_binary a219b_binary a218e_binary


logit a217 income homeowner_binary totalchildren
logit a217 income totalchildren homeowner_binary a218b_binary a219b_binary a218e_binary



