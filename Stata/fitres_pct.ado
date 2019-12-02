program define fitres_pct, eclass byable(onecall)

	predict fit, xb
	predict res, resid

	gen res_pct = res/`1'
	label var res_pct "Residuals, %"

	sc res_pct fit, yline(0, lpattern(dash)) msize(small)

end

/* example
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

fitres_pct price

*/
