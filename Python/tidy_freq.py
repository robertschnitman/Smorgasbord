# -*- coding: utf-8 -*-
"""
Created on Mon Dec  2 18:31:27 2019

@author: rgs
"""

import numpy as np
import pandas as pd

def tidy_freq(x): # univariate for now
    freq = x.value_counts()
    pct = freq/sum(freq)
    
    freq_pct = pd.concat([freq, pct], axis = 1)
    
    return np.transpose(freq_pct)
