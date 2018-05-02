cd C:\Users\pku\Desktop\AB
use A.dta,clear
tostring id hhid pid ,replace
save A1.dta,replace

use "HHS2016_HEALTH_K2_clean.dta",clear
rename _merge merge1
duplicates report hhidpid
rename hhidpid id
merge 1:1 id using A1.dta 
rename _merge merge_K2_A
save 1.dta,replace

use B3B4.dta,replace
tostring id  ,replace
merge m:1 id using 2.dta
list id if _merge==1
list id if _merge==2
/*最后的结果和B3B4对/
