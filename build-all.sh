#!/bin/zsh
#
# Simple script to build all my machines in the order needed
#
# Alternatively, https://hub.docker.com/r/v4tech
#
#    stewart@vifortech.com

#DEBUG=1
# Change this if you want to build under a different user - AND - remember to change the Dockerfiles
USER=v4tech

if [ ! -z "${DEBUG}" ]; then
	_E=echo
fi

for f in $(ls **/Dockerfile | grep -v 'NOBUILD'); do
    # Note, this is all in a (...), so I don't need to remember to cd back to where I started
    (
	WKDIR=$(dirname $f)
	D_TAG=$(echo ${WKDIR} | \
		       sed 's=^[0-9]*-==' | \
		       sed 's=_=:=g')
	cd ${WKDIR}
	if [ -z ${DEBUG} ]; then
	    echo "\n\n\n-----"
	fi
	echo "--- ${WKDIR}    TAG: ${D_TAG}"
	${_E} docker build -t ${USER}/${D_TAG} .
    )
done


# Clean up dangling images
DANGLING=$(docker images -q --filter "dangling=true")
if [ ! -z "${DANGLING}" ]; then
    ${_E} docker rmi ${DANGLING}
fi
