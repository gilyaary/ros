#! /usr/bin/env python

import numpy as np
from plotter import Plotter

t = np.linspace(0, np.pi, 2000)
#t = np.linspace(-np.pi, np.pi, 201)
lv = 1
av = 5

#Higher angular velocity relative to linear velocity reaches closer points
#To adjust speed calc the ratio needed to reach a point and then limit the combined speed

#These become arrays because the np.linespace creates an array of time t
x_locations = (2*lv*np.sin(av*t) - av*t*np.cos(av*t))/(av*av)
y_locations = (2*lv*np.cos(av*t) + av*t*np.sin(av*t))/(av*av)
   

to_plot = [{
    "title": "Trajectory",
    "type": "plot",
    #"data": [t,  (2*a*np.sin(b*t) - b*t*np.cos(b*t))/(b*b)   ]
    "data": [x_locations, y_locations]
}]

pl = Plotter(to_plot)
pl.show()