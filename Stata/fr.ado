program define fr

	predict fit, xb
	predict res, resid
	
	gen res_pct = res/(fit + res)
	label var res_pct "Residuals, %"
	
end
