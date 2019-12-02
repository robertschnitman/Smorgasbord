program define histres

	predict res, resid
	
	hist res, percent normal kdensity kdenopts(lcolor(red))
	
end

/* example
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

histres

*/
