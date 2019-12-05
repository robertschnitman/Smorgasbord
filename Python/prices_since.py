# -*- coding: utf-8 -*-
"""
Created on Thu Dec  5 10:46:03 2019

@author: rgs
"""

import datetime as dt, quandl
import pandas as pd
import pandas_datareader.data as web

def prices_since(stock, src, year, month, day):
    start = dt.datetime(year, month, day)
    end = dt.datetime.now()
    
    stk = web.DataReader(stock, src, start, end)
    
    return stk

prices_since('SCHH', 'yahoo', 2019, 12, 1)