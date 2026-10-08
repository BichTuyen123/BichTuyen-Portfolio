******************************************************** DATA-CLEANING********************************************************

*EXP
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("EXP") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR EXP
destring EXP, replace force
save EXP.dta


*FDI
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("FDI") firstrow clear
drop SeriesName SeriesCode CountryName 
destring YR1993, replace force
destring YR1994, replace force
destring YR1995, replace force
destring YR1996, replace force
destring YR1997, replace force
destring YR1998, replace force
destring YR1999, replace force
destring YR2000, replace force
destring YR2001, replace force
destring YR2002, replace force
destring YR2004, replace force
destring YR2012, replace force
destring YR2013, replace force
destring YR2014, replace force
destring YR2015, replace force
destring YR2016, replace force
destring YR2017, replace force
destring YR2018, replace force
destring YR2019, replace force
destring YR2020, replace force
destring YR2021, replace force
destring YR2022, replace force
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR FDI
save FDI.dta

*GDP
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("GDP") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR GDP
destring GDP, replace force
save GDP.dta

*GOV_EX
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("GOV_EX") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A) 
rename A YEAR
rename YR GOV_EX
destring GOV_EX, replace force
save GOV_EX.dta

*EX_RATE
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("EX_RATE") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR EX_RATE
destring EX_RATE, replace force
save EX_RATE.dta

*POP
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("POP") firstrow clear
drop SeriesName SeriesCode CountryName YR2023
reshape long YR, i(CountryCode) j(A) 
rename A YEAR
rename YR POP
destring POP, replace force
save POP.dta

*INF
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("INF") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR INF
destring INF, replace force 
save INF.dta

*TRADE
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("TRADE") firstrow clear
drop SeriesName SeriesCode CountryName 
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR TRADE
destring TRADE, replace force 
save TRADE.dta

*HDI
import excel "/Users/bichtuyen/Downloads/DATA-KLTN/FILE EXCEL/HDR23-24_Composite_indices_complete_time_series.xlsx", sheet("HDI") firstrow clear
drop country hdicode region
rename iso3 CountryCode
reshape long YR, i(CountryCode) j(A)
rename A YEAR
rename YR HDI
save HDI.dta

*Merge data
use "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/EXP.dta", clear  
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/FDI.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/GDP.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/GOV_EX.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/EX_RATE.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/INF.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/POP.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/TRADE.dta"    
drop _merge
merge 1:1 CountryCode YEAR using "/Users/bichtuyen/Downloads/DATA-KLTN/FILE DTA/HDI.dta"    
drop _merge

* Create sample group
gen UMI=.
replace UMI = 1 if CountryCode == "ARM" | CountryCode == "AZE"|CountryCode == "BHR" | CountryCode == "BRN"| CountryCode == "CHN"|CountryCode == "CYP" | CountryCode == "GEO"| CountryCode == "IDN"|CountryCode == "ISR" | CountryCode == "JPN"| CountryCode == "JOR"|CountryCode == "KAZ" | CountryCode == "KWT"| CountryCode == "KOR"|CountryCode == "MYS" | CountryCode == "MDV"| CountryCode == "MNG"|CountryCode == "OMN" | CountryCode == "QAT"| CountryCode == "RUS"|CountryCode == "SAU" | CountryCode == "SGP"| CountryCode == "THA"|CountryCode == "TKM" | CountryCode == "ARE"
gen LMI=1
replace LMI=. if CountryCode == "ARM" | CountryCode == "AZE"|CountryCode == "BHR" | CountryCode == "BRN"| CountryCode == "CHN"|CountryCode == "CYP" | CountryCode == "GEO"| CountryCode == "IDN"|CountryCode == "ISR" | CountryCode == "JPN"| CountryCode == "JOR"|CountryCode == "KAZ" | CountryCode == "KWT"| CountryCode == "KOR"|CountryCode == "MYS" | CountryCode == "MDV"| CountryCode == "MNG"|CountryCode == "OMN" | CountryCode == "QAT"| CountryCode == "RUS"|CountryCode == "SAU" | CountryCode == "SGP"| CountryCode == "THA"|CountryCode == "TKM" | CountryCode == "ARE"
gen OECD=.
replace OECD=1 if inlist(CountryCode, "ISR","JPN","KOR")
gen EI=.
replace EI=1 if inlist(CountryCode, "CHN","IND","IDN", "MYS","THA","PHL")
encode CountryCode, gen(COUNTRY_ID)  
save DATA_KLTN.dta

******************************************************** MODEL ****************************************************************


* Whole sample
xtset COUNTRY_ID YEAR
* Correlation
pwcorr ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
* VIF
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
vif
* Breusch-Pagan test
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
estat hettest
* Wooldridge test
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
xtserial ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE

* REG model
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
est sto reg
* FEM model
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE, fe
est sto fe
* REM model
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE, re
est sto re
* Hausman test
hausman fe re
* Breusch-Pagan test
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
xttest3
* Wooldridge test
reg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
xtserial ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE
* Summary result
esttab reg fe re, r2 star(* 0.1 ** 0.05 *** 0.01) nogap compress

****************************FEM result of UMI, LMI, OECD, EI ****************************
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE UMI==1, fe
est sto fe1
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE LMI==1, fe
est sto fe2
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE OECD==1, fe
est sto fe3
xtreg ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE EI==1, fe
est sto fe4
esttab fe1 fe2 fe3 fe4, r2 star(* 0.1 ** 0.05 *** 0.01) nogap compress


****************************SGMM model****************************

*Whole sample:
xtabond2 ln_EXP l.ln_EXP ln_FDI GDP GOV_EX ln_EX_RATE ln_POP ln_INF HDI ln_TRADE, gmm(L3.ln_EXP L.ln_FDI , lag(1 2) collapse) iv(GDP L2.GOV_EX ln_EX_RATE ln_POP ln_INF HDI ln_TRADE) robust two
est sto xta
*UMI: 
xtabond2 ln_EXP l.ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE if UMI==1, gmm(L3.ln_EXP L.ln_FDI , lag(6 6) collapse) iv(GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE) robust two
est sto xta1
*LMI:
xtabond2 ln_EXP l.ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE if LMI==1, gmm(L3.ln_EXP L.ln_FDI , lag(3 3) collapse) iv(GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE) robust two
est sto xta2
*OECD:
xtabond2 ln_EXP l.ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE if OECD==1, gmm(L3.ln_EXP L4.ln_FDI , lag(4 6) collapse) iv(GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE) robust
est sto xta3
*EI:
xtabond2 ln_EXP l.ln_EXP ln_FDI GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE if EI==1, gmm(L3.ln_EXP L2.ln_FDI , lag(2 4) collapse) iv(GDP1 GOV_EX1 ln_EX_RATE ln_POP1 ln_INF HDI ln_TRADE) robust
est sto xta4
esttab xta xta1 xta2 xta3 xta4, r2 star(* 0.1 ** 0.05 *** 0.01) nogap compress




