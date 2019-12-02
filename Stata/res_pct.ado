program define res_pct, eclass byable(onecall)

	gen res_pct = res/`1'
	label var res_pct "Residuals, %"

end

/* example
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

res_pct price

*/
