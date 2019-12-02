program define fitres

	sc res fit, yline(0, lpattern(dash)) msize(small)

end

/* example (assumes fr.ado)
use "C:\Program Files (x86)\Stata12\ado\base\a\auto.dta", clear

reg price mpg

fitres

*/
