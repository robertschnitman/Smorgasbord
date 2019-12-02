program define fitres

	predict fit, xb
	predict res, resid

	sc res fit, yline(0, lpattern(dash)) msize(small)

end

/* example
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

fitres

*/
