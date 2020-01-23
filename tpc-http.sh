#!/bin/bash                                                                                                                                                                                            
i=$1
disk=$((1 + RANDOM % 1))
curl -X COPY \
-H "Overwrite: T" \
-H "X-Number-Of-Streams: 10" \
-H "Source: http://osg-kansas-city-stashcache.nrp.internet2.edu:9002//data/stash/test2.copy" \
http://stashcache.t2.ucsd.edu:9002//nvme$disk/testfile.zero.$i &
#-H "Source: http://stashcache.t2.ucsd.edu:9002//nvme$i/testfile.zero" \                                                                                                                               
#http://osg-kansas-city-stashcache.nrp.internet2.edu:9002//data/stash/test$i.copy                                                                                                                     
#http://stashcache.t2.ucsd.edu:9002//nvme$i/testfile.zero                                                                                                                                              
#https://osg-kansas-city-stashcache.nrp.internet2.edu:9002/dev/null                                                                                                                                    
#https://osg-kansas-city-stashcache.nrp.internet2.edu:9002//data/stash/test$i.copy   
