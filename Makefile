TGT=cs
CC=gcc

PREFIX=/usr/local
BINDIR=${PREFIX}/bin

# these defines are for Linux
LIBS=
ARCH=linux

# for Mac OS X and BSD systems that have getifaddr(), uncomment the next line
#ARCH=bsd_with_getifaddrs

# for early BSD systems without getifaddrs(), uncomment the next line
#ARCH=bsd


# for solaris, uncomment the next two lines
# LIBS=-lsocket -lnsl
# ARCH=sun

${TGT}: Makefile ${TGT}.c 
		${CC} -Wall -g -D${ARCH} -DPREFIX=\"${PREFIX}\" ${TGT}.c -o ${TGT} ${LIBS}

install: ${TGT} 
		if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR};fi
		cp ${TGT} ${BINDIR}/${TGT}

clean: 
		rm -f *o
		rm -f binaries/*
		rm -f ${TGT}