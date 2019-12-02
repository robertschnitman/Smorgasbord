program define histres_pct
	
	hist res_pct, percent normal kdensity kdenopts(lcolor(red))
	
end

/* example (assumes fr.ado).
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

histres_pct
*/
