# Makefile for Liunux
# 
# Prerequsists : Microsoft Net Core SDK

PROGRAM		:=	JTSDK.NetCore
VERSION		:=	3.0.2.1
AUTHOR		:=	Greg Beam, KI7MT
LICENSE		:=	GPLv3
BUGS		:=	https://github.com/KI7MT/jtsdk-dotnet-core/issues
WEB			:=	https://groups.io/g/JTSDK

# application list
APPLIST	:=	JTEnv JTConfig
OUTLIST	:=	jtenv jtconfig
COMMAND	:=	dotnet tool install --global --add-source

# foreground colors
C_R		:=	'\033[01;31m'	# red
C_G		:=	'\033[01;32m'	# green
C_Y		:=	'\033[01;33m'	# yellow
C_C		:=	'\033[01;36m'	# cyan
C_NC	:=	'\033[01;37m'	# no color

# targets
all: restore pack

clean:
	@clear ||:
	@echo '---------------------------------------------'
	@echo $(C_Y)"Cleaning $(PROGRAM) v$(VERSION)"$(C_NC)
	@echo '---------------------------------------------'
	dotnet clean src/${PROGRAM}

restore:
	@echo ''
	@echo '---------------------------------------------'
	@echo $(C_Y)"Restoring $(PROGRAM) v$(VERSION)"$(C_NC)
	@echo '---------------------------------------------'
	dotnet restore src/${PROGRAM}

pack:
	@echo ''
	@echo '---------------------------------------------'
	@echo $(C_Y)"Building $(PROGRAM) v$(VERSION)"$(C_NC)
	@echo '---------------------------------------------'
	@echo ''
	@for a in $(APPLIST) ; do \
	echo "Creating Nuget Package for $$a" ; \
	dotnet pack src/${PROGRAM}/$$a ; \
	echo '' ; \
	done

install:
	@echo ''
	@echo '---------------------------------------------'
	@echo $(C_Y)"Installing $(PROGRAM) v$(VERSION)"$(C_NC)
	@echo '---------------------------------------------'
	@echo ''
	@echo 'Installing JTEnv'
	$(COMMAND) src/${PROGRAM}/JTEnv/nupkg jtenv
	@echo ''
	@echo 'Installing JTConfig'
	$(COMMAND) src/${PROGRAM}/JTConfig/nupkg jtconfig
	@echo

uninstall:
	@echo ''
	@echo '---------------------------------------------'
	@echo $(C_Y)"Uninstalling $(PROGRAM) v$(VERSION)"$(C_NC)
	@echo '---------------------------------------------'
	@echo ''
	@for a in $(APPLIST) ; do \
	echo "Removing package $$a" ; \
	dotnet tool uninstall -g $$a ; \
	echo '' ; \
	done
