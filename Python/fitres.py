# -*- coding: utf-8 -*-
"""
Created on Wed Dec  4 17:43:09 2019

@author: rgs
"""
import pandas as pd
import statsmodels.api as sm

def fitres(model):
    fit     = model.fittedvalues
    res     = model.resid
    res_pct = fit + res
    
    output = pd.concat([fit, res, res_pct], axis = 1)
    
    output.columns = ['fit', 'residuals', 'residuals_pct']
    
    return output



def fitres_append(data, model):
    fr = fitres(model)
    
    output = pd.concat([data, fr], axis = 1)
    
    return output
    
    
