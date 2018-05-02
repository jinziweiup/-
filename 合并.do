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
/*35��û��ƥ���ϣ�����142216104 ������󣬸���û�д��˵���Ϣ��
 312221-1��A���е���K��û�С�
 452117110 ��A��û�д��ˡ�
 452119109��A��û�д���
 452221110��A��û�д���
 631205109��A��û�д��ˣ���108ֱ������110��û��109
 642114106 ��A��û�д��ˣ���106�ĳ�109
 642119106 ��A��û�д���
 642209-1/-2һ����A���е���K��û�С�*/
rename _merge merge_K2_A  
save 1.dta,replace
/*��k2���A���*/

use B1B2.dta,replace
tostring id hhid pid ,replace
merge 1:1 id using 1.dta
rename _merge merge_B1B2_K2_A
save 2.dta,replace
/*����������B1B2��*/

use B3B4.dta,replace
tostring id  ,replace
merge m:1 id using 2.dta
list id if _merge==1

/*���Ľ����B3B4�ԡ�ֻ��142108105û�ж���
142108105��2012�������ȥ��*/
