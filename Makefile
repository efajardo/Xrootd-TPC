pushconfig:
	-kubectl delete configmap xrootd_tpc -n osg  # delete if already exists, ignore errors
	kubectl create configmap  xrootd_tpc -n osg --from-file=xrootd-third-party-copy.cfg=xrootd-third-party-copy.cfg --from-file=auth_file=auth_file --from-file=lcmaps.cfg=lcmaps.cfg --from-file=grid-mapfile=grid-mapfile

