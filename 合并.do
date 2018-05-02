cd C:\Users\pku\Desktop\CleanData\AB
use A.dta,clear
tostring id hhid pid ,replace
save A1.dta,replace

use "HHS2016_HEALTH_K2_clean.dta",clear
rename _merge merge1
duplicates report hhidpid
rename hhidpid id
merge 1:1 id using A1.dta 
list id if _merge==1
/*35个没有匹配上，其中142216104 编码错误，根本没有此人的信息。
 312221-1在A中有但是K中没有。
 452117110 在A中没有此人。
 452119109在A中没有此人
 452221110在A中没有此人
 631205109在A中没有此人，从108直接跳到110，没有109
 642114106 在A中没有此人，将106改成109
 642119106 在A中没有此人
 642209-1/-2一家在A中有但在K中没有。*/
rename _merge merge_K2_A  
save 1.dta,replace
/*用k2表和A表对*/

use B1B2.dta,replace
tostring id hhid pid ,replace
merge 1:1 id using 1.dta
rename _merge merge_B1B2_K2_A
save 2.dta,replace
/*用上面结果和B1B2对*/

use B3B4.dta,replace
tostring id  ,replace
merge m:1 id using 2.dta
list id if _merge==1

/*最后的结果和B3B4对。只有142108105没有对上
142108105在2012年调查中去世*/
