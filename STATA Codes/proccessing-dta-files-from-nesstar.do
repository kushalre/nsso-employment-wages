*********************************************************************

* India's Employment & Wages Trends over the years
* Estimation with Data from MOSPI's NSSO 

**********************************************************************
*author: Kushal Kumar Reddy, kushal156@gmail.com
**********************************************************************



*/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/R-Scripts

clear
set more off
****************
****************
* NSSO 38
****************
****************
cd "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/" 

cd "./NSS_38/"


use "38-Block-41-Persons-Demogrphic-weelyActivity-records.dta",clear
drop if B41_q18==""
rename Person_key person_key
save data-all-4,replace

use "38-Block-5-Persons-DailyActivity-records.dta",replace
drop Hhold_key
gen Hhold_key = Sector+State+Region+FSU_Slno+Hhold_Slno
drop person_key
gen person_key = Sector+State+Region+FSU_Slno+Hhold_Slno+Person_slno
drop if B5_q14==.
save data-all-5,replace

merge m:m Hhold_key person_key using data-all-4
drop if _merge == 3
drop _merge
egen sum_weight= total(Wgt4_pooled)

gen wagescash = B5_q14*Wgt4_pooled
gen pooledweight = Wgt4_pooled
sort wagescash
gen nco=B41_q18
save data-all-5-processed, replace



drop if Sector=="1"
save urban-38, replace
export delimited using "urban-38.csv", replace
use data-all-5-processed, clear
drop if Sector=="2"
export delimited using "rural-38.csv", replace
save rural-38,replace

**** For CWAS only salaried and casual

cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_38/"

use data-all-5-processed, clear
keep if B41_q14 == "31" 
drop if Sector=="1"
save urban-38, replace
export delimited using "urban-38.csv", replace
use data-all-5-processed, clear
keep if B41_q14 == "31" | B41_q14 == "41" | B41_q14 == "51"
drop if Sector=="2"
export delimited using "rural-38.csv", replace
save rural-38,replace

**** For Age 18 - 55
cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_38/"

use data-all-5-processed, clear
keep if  B41_q6 <= 55 
keep if B41_q6 >= 18
drop if Sector=="1"
save urban-38, replace
export delimited using "urban-38.csv", replace
use data-all-5-processed, clear
keep if  B41_q6 <= 55 
keep if B41_q6 >= 18
drop if Sector=="2"
export delimited using "rural-38.csv", replace
save rural-38,replace


****************
****************
*NSSO 43
****************
****************
cd "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/"


cd "./NSS_43/"

use "43-Block-4-Persons-Demographic-current-weekly-activity- Records.dta", replace
save data-all-4,replace


use "43-Block-5-Persons-Daily- activity- time-disposion-Records.dta", replace
save data-all-5,replace
use data-all-5, clear


merge m:m Hhold_key Person_key using data-all-4
drop if _merge == 3
drop _merge
egen sum_weight= total(Wgt4_pooled)
gen pooledweight = Wgt4_pooled
gen wagescash = B5_q14*Wgt4_pooled 
sort wagescash
gen nco=B4_q15
save data-all-5-processed, replace


drop if nco==""
drop if wagescash==.

save data-all-5-processed, replace


drop if Sector=="1"
save urban-43, replace
export delimited using "urban-43.csv", replace
use data-all-5-processed, clear
drop if Sector=="2"
export delimited using "rural-43.csv", replace
save rural-43,replace


**** For CWAS only salaried and casual

cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_43/"

use data-all-5-processed, clear

keep if B4_q11 == "31" 

drop if Sector=="1"
save urban-43, replace
export delimited using "urban-43.csv", replace
use data-all-5-processed, clear
keep if B4_q11 == "31" | B4_q11 == "41" | B4_q11 == "51"

drop if Sector=="2"
export delimited using "rural-43.csv", replace
save rural-43,replace

**** For Age 18 - 55
cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_43/"

use data-all-5-processed, clear

keep if  B4_q5 <= 55 
keep if B4_q5 >= 18

drop if Sector=="1"
save urban-43, replace
export delimited using "urban-43.csv", replace
use data-all-5-processed, clear
keep if  B4_q5 <= 55 
keep if B4_q5 >= 18

drop if Sector=="2"
export delimited using "rural-43.csv", replace
save rural-43,replace


****************
*NSSO 50
****************
cd "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/"


cd "./NSS_50/"



use "Block-5-Persons-Activity-Records.dta",replace
save data-all-5,replace
use data-all-5
egen sum_weight= total(WGT_Pooled)

gen wagescash = B5_q15 * WGT_Pooled 
gen pooledweight = WGT_Pooled
drop if wagescash ==.
gen nco=B5_q21
drop if nco==""
save data-all-5-processed, replace
drop if Sector=="1"
save urban-50, replace
export delimited using "urban-50.csv", replace
use data-all-5-processed, clear
drop if Sector=="2"
export delimited using "rural-50.csv", replace
save rural-50, replace


**** For CWAS only salaried and casual


cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_50/"

use data-all-5-processed, clear

keep if B5_q4 == "31"

drop if Sector=="1"
save urban-50, replace
export delimited using "urban-50.csv", replace
use data-all-5-processed, clear
keep if B5_q4 == "31" | B5_q4 == "41" | B5_q4 == "51"
drop if Sector=="2"
export delimited using "rural-50.csv", replace
save rural-50, replace

**** For Age 18 - 55


cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_50/"

use data-all-5-processed, clear
keep if  B5_q2 <= 55 
keep if B5_q2 >= 18

drop if Sector=="1"
save urban-50, replace
export delimited using "urban-50.csv", replace
use data-all-5-processed, clear
keep if  B5_q2 <= 55 
keep if B5_q2 >= 18

drop if Sector=="2"
export delimited using "rural-50.csv", replace
save rural-50, replace


****************
*NSSO 55
****************
cd "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/"


cd "./NSS_55/"



*use "Block51-sch10-Persons-usual-principal-activity-Records.dta",replace


use "Block53-sch10-Persons-daily-activity-time-disposition-Records.dta", replace

save data-all-5,replace
use data-all-5
egen sum_weight= total(Wgt_SR_comb)

gen wagescash = B53_q15 * Wgt_SR_comb 
gen pooledweight = Wgt_SR_comb
drop if wagescash ==.
gen nco=B53_q22
drop if nco==""
save data-all-5-processed, replace
drop if Sector=="1"
save urban-55, replace
export delimited using "urban-55.csv", replace
use data-all-5-processed, clear
drop if Sector=="2"
export delimited using "rural-55.csv", replace
save rural-55, replace


**** For CWAS only salaried and casual

cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_55/"

use data-all-5-processed, clear

keep if B53_q4 == "31"

drop if Sector=="1"
save urban-55, replace
export delimited using "urban-55.csv", replace

use data-all-5-processed, clear
keep if B53_q4 == "31" | B53_q4 == "41" | B53_q4 == "51"
drop if Sector=="2"
export delimited using "rural-55.csv", replace
save rural-55, replace

**** For Age 18 - 55

cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_55/"

use data-all-5-processed, clear
keep if  B53_q2 <= 55 
keep if B53_q2 >= 18

drop if Sector=="1"
save urban-55, replace
export delimited using "urban-55.csv", replace

use data-all-5-processed, clear
keep if  B53_q2 <= 55 
keep if B53_q2 >= 18
drop if Sector=="2"
export delimited using "rural-55.csv", replace
save rural-55, replace


****************
*NSSO 61
****************
cd "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/"


cd "./NSS_61/"



*use "Block51-sch10-Persons-usual-principal-activity-Records.dta",replace


use "Block_5pt3_level_06.dta", replace

save data-all-5,replace
use data-all-5
egen sum_weight= total(WEIGHT_COMBINED)
gen pooledweight = WEIGHT_COMBINED

gen wagescash = Wage_salary_cash_during_the_week * WEIGHT_COMBINED 
drop if wagescash ==.
gen nco=Current_weekly_activity_NCO_1968
drop if nco==""
save data-all-5-processed, replace
drop if Sector=="1"
save urban-61, replace
export delimited using "urban-61.csv", replace
use data-all-5-processed, clear
drop if Sector=="2"
export delimited using "rural-61.csv", replace
save rural-61, replace


**** For CWAS only salaried and casual


cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_61/"

use data-all-5-processed, clear

keep if Current_day_activity_Status == "31"
drop if Sector=="1"
save urban-61, replace
export delimited using "urban-61.csv", replace

use data-all-5-processed, clear

keep if Current_day_activity_Status == "31" | Current_day_activity_Status == "41" | Current_day_activity_Status == "51"
drop if Sector=="2"
export delimited using "rural-61.csv", replace
save rural-61, replace

**** For Age 18 - 55

cd "/home/kushal/Downloads/Dta files_220421"
cd "./NSS_61/"

use data-all-5-processed, clear

keep if  Age <= 55 
keep if Age >= 18
drop if Sector=="1"
save urban-61, replace
export delimited using "urban-61.csv", replace

use data-all-5-processed, clear

keep if  Age <= 55 
keep if Age >= 18

drop if Sector=="2"
export delimited using "rural-61.csv", replace
save rural-61, replace

