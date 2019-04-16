pushconfig:
	-kubectl delete configmap xrootd-tpc -n osg  # delete if already exists, ignore errors
	kubectl create configmap  xrootd-tpc -n osg --from-file=xrootd-third-party-copy.cfg=xrootd-third-party-copy.cfg --from-file=auth_file=auth_file --from-file=lcmaps.cfg=lcmaps.cfg --from-file=grid-mapfile=grid-mapfile
pushsecretkey:
	-kubectl delete secret secretkey -n osg # delete if already exists, ignore errors                                                          
	kubectl create secret generic secretkey -n osg --from-file=secretkey

