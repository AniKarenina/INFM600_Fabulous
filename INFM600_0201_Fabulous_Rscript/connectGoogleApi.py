# -*- coding: utf-8 -*-
"""
Created on Mon Nov 28 11:04:14 2016

@author: Administrator
"""
file=open("D:\Documents\GitHub\INFM600_Fabulous\123.txt")
google_api="AIzaSyDfkpkSBEkcJCk4mGTQ19feimIwm-wh5Vc"


for line in file:
    line=line.rstrip()
    llist=line.split()
    startLat=llist[2]
    startLong=llist[3]
    endLat=llist[5]
    endLong=llist[6]
    x=distance(startLat,startLong,endLat,endLong)
    print(x)
    

def distance(sLat,sLong,eLat,eLong):
    url="https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s，%s&destinations=%s,%s&mode=bicycling&key=" %(sLat,sLong,eLat,eLong)
    final_url=url+google_api
    
    return final_url