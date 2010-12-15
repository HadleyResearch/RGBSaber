#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

OS_ORIGINAL="Darwin"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/microchip/mplabc18/v3.37/bin/mcc18
MP_AS=/Applications/microchip/mplabc18/v3.37/bin/../mpasm/MPASMWIN
MP_LD=/Applications/microchip/mplabc18/v3.37/bin/mplink
MP_AR=/Applications/microchip/mplabc18/v3.37/bin/mplib
MP_CC_DIR=/Applications/microchip/mplabc18/v3.37/bin
MP_AS_DIR=/Applications/microchip/mplabc18/v3.37/bin/../mpasm
MP_LD_DIR=/Applications/microchip/mplabc18/v3.37/bin
MP_AR_DIR=/Applications/microchip/mplabc18/v3.37/bin
# This makefile will use a C preprocessor to generate dependency files
MP_CPP=/Applications/microchip/mplab_ide.app/Contents/Resources/mplab_ide/mplab_ide/modules/../../bin/mplab-cpp
.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof

# ------------------------------------------------------------------------------------
# Rules for buildStep: createRevGrep
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
__revgrep__:   nbproject/Makefile-${CND_CONF}.mk
	@echo 'grep -q $$@' > __revgrep__
	@echo 'if [ "$$?" -ne "0" ]; then' >> __revgrep__
	@echo '  exit 0' >> __revgrep__
	@echo 'else' >> __revgrep__
	@echo '  exit 1' >> __revgrep__
	@echo 'fi' >> __revgrep__
	@chmod +x __revgrep__
else
__revgrep__:   nbproject/Makefile-${CND_CONF}.mk
	@echo 'grep -q $$@' > __revgrep__
	@echo 'if [ "$$?" -ne "0" ]; then' >> __revgrep__
	@echo '  exit 0' >> __revgrep__
	@echo 'else' >> __revgrep__
	@echo '  exit 1' >> __revgrep__
	@echo 'fi' >> __revgrep__
	@chmod +x __revgrep__
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${RM} ${OBJECTDIR}/main.o.d 
	${MKDIR} ${OBJECTDIR} 
	${MP_CC}  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p18F2221 -I"/Applications/microchip/mplabc18/v3.37/bin/LKR" -I"/Applications/microchip/mplabc18/v3.37/h" -I"/Applications/microchip/mplabc18/v3.37/lib" -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/main.o main.c 
	${MP_CPP}  -MMD ${OBJECTDIR}/main.o.temp main.c __temp_cpp_output__ -D __18F2221 -I /Applications/microchip/mplabc18/v3.37/bin/LKR -I /Applications/microchip/mplabc18/v3.37/h -I /Applications/microchip/mplabc18/v3.37/lib -I /Applications/microchip/mplabc18/v3.37/bin/../h  -D__18F2221
	printf "%s/" ${OBJECTDIR} > ${OBJECTDIR}/main.o.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT)))
	cat ${OBJECTDIR}/main.o.temp | sed -e 's/\\\ /__SPACES__/g' -e's/\\$$/__EOL__/g' -e 's/\\/\\\\/g' -e 's/__SPACES__/\\\ /g' -e 's/__EOL__/\\/g' >> ${OBJECTDIR}/main.o.d
else
	cat ${OBJECTDIR}/main.o.temp >> ${OBJECTDIR}/main.o.d
endif
	${RM} __temp_cpp_output__
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${RM} ${OBJECTDIR}/main.o.d 
	${MKDIR} ${OBJECTDIR} 
	${MP_CC}  -p18F2221 -I"/Applications/microchip/mplabc18/v3.37/bin/LKR" -I"/Applications/microchip/mplabc18/v3.37/h" -I"/Applications/microchip/mplabc18/v3.37/lib" -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/main.o main.c 
	${MP_CPP}  -MMD ${OBJECTDIR}/main.o.temp main.c __temp_cpp_output__ -D __18F2221 -I /Applications/microchip/mplabc18/v3.37/bin/LKR -I /Applications/microchip/mplabc18/v3.37/h -I /Applications/microchip/mplabc18/v3.37/lib -I /Applications/microchip/mplabc18/v3.37/bin/../h  -D__18F2221
	printf "%s/" ${OBJECTDIR} > ${OBJECTDIR}/main.o.d
ifneq (,$(findstring MINGW32,$(OS_CURRENT)))
	cat ${OBJECTDIR}/main.o.temp | sed -e 's/\\\ /__SPACES__/g' -e's/\\$$/__EOL__/g' -e 's/\\/\\\\/g' -e 's/__SPACES__/\\\ /g' -e 's/__EOL__/\\/g' >> ${OBJECTDIR}/main.o.d
else
	cat ${OBJECTDIR}/main.o.temp >> ${OBJECTDIR}/main.o.d
endif
	${RM} __temp_cpp_output__
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD}   -p18f2221  -w -x -l"/Applications/microchip/mplabc18/v3.37/lib" -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1  -u_DEBUGCODESTART=0xdc0 -u_DEBUGCODELEN=0x1dc1 -u_DEBUGDATASTART=0x1f4 -u_DEBUGDATALEN=0xc -l ${MP_CC_DIR}/../lib  -odist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof ${OBJECTFILES}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD}   -p18f2221  -w  -l"/Applications/microchip/mplabc18/v3.37/lib" -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}/../lib  -odist/${CND_CONF}/${IMAGE_TYPE}/RGBSaber_Firmware2.0.${IMAGE_TYPE}.cof ${OBJECTFILES}     
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist
# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
