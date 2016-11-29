# -*- coding: utf-8 -*-
"""However, We found google API charges when there are more than 2500 elements per day. Therefore
we will use R to calculate to distance 
"""
import googlemaps
    
file=open("INFM600_0201_Fabulous_distance.txt")
result=open("IFNM600_result.txt","w")

google_api="AIzaSyDfkpkSBEkcJCk4mGTQ19feimIwm-wh5Vc"  

gmaps=googlemaps.Client(key=google_api)

x=gmaps.distance_matrix('New York City','Chicago')
  



for line in file:
    line=line.rstrip()
    llist=line.split()
    startLat=llist[2]
    startLong=llist[3]
    endLat=llist[5]
    endLong=llist[6]
    start=startLat+","+startLong
    end=endLat+","+endLong
    gmaps=googlemaps.Client(key=google_api)
    x=gmaps.distance_matrix(start,end)
    
    for each in x['rows']:
        a=each['elements'][0]
        b=a['distance']
        distance=b['value']
        distance=str(distance)
        result.write(llist[0]+" "+distance)
        result.write("\n")

        
result.close()
print('finish')
