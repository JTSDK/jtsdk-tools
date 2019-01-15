# Makefile for Linux
# 
# Prerequsists : Microsoft Net Core SDK

PROGRAM	:=	JTSDK.NetCore
VERSION	:=	3.0.3
AUTHOR	:=	Greg Beam, KI7MT
LICENSE	:=	GPLv3
BUGS	:=	https://github.com/KI7MT/jtsdk-tools/issues
WEB	:=	https://groups.io/g/JTSDK

# application list
APPLIST	:=	JTEnv JTConfig
OUTLIST	:=	jtenv jtconfig
COMMAND	:=	dotnet tool install --global --add-source

# targets
all: restore pack

clean:
	@clear ||:
	@echo '---------------------------------------------'
	@echo "Cleaning $(PROGRAM) v$(VERSION)"
	@echo '---------------------------------------------'
	dotnet clean src/${PROGRAM}

restore:
	@echo ''
	@echo '---------------------------------------------'
	@echo "Restoring $(PROGRAM) v$(VERSION)"
	@echo '---------------------------------------------'
	dotnet restore src/${PROGRAM}

pack:
	@echo ''
	@echo '---------------------------------------------'
	@echo "Building $(PROGRAM) v$(VERSION)"
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
	@echo "Installing $(PROGRAM) v$(VERSION)"
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
	@echo "Uninstalling $(PROGRAM) v$(VERSION)"
	@echo '---------------------------------------------'
	@echo ''
	@for a in $(APPLIST) ; do \
	echo "Removing package $$a" ; \
	dotnet tool uninstall -g $$a ; \
	echo '' ; \
	done
