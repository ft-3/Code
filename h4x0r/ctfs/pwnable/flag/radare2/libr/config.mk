ifeq ($(_INCLUDE_CONFIG_MK_),)
_INCLUDE_CONFIG_MK_=1

CFLAGS_APPEND=
GNULINUX=1
BSD=0
SOLARIS=0
WINDOWS=0
OSX=0

# config.mk.head
STATIC_ANAL_PLUGINS= p/6502.mk p/8051.mk p/arc.mk p/arm_cs.mk p/arm_gnu.mk p/avr.mk p/bf.mk p/chip8.mk p/cr16.mk p/cris.mk p/dalvik.mk p/ebc.mk p/gb.mk p/h8300.mk p/i4004.mk p/i8080.mk p/java.mk p/m68k_cs.mk p/malbolge.mk p/mips_cs.mk p/mips_gnu.mk p/msp430.mk p/nios2.mk p/null.mk p/pic18c.mk p/ppc_cs.mk p/ppc_gnu.mk p/riscv.mk p/rsp.mk p/sh.mk p/snes.mk p/sparc_cs.mk p/sparc_gnu.mk p/sysz.mk p/tms320.mk p/v810.mk p/v850.mk p/vax.mk p/ws.mk p/x86_cs.mk p/x86_udis.mk p/xap.mk p/xcore_cs.mk p/xtensa.mk p/z80.mk 
STATIC_ASM_PLUGINS= p/6502.mk p/8051.mk p/arc.mk p/arm_as.mk p/arm_cs.mk p/arm_gnu.mk p/arm_winedbg.mk p/avr.mk p/bf.mk p/chip8.mk p/cr16.mk p/cris_gnu.mk p/dalvik.mk p/dcpu16.mk p/ebc.mk p/gb.mk p/h8300.mk p/hexagon_gnu.mk p/hppa_gnu.mk p/i4004.mk p/i8080.mk p/java.mk p/lanai_gnu.mk p/lh5801.mk p/lm32.mk p/m68k_cs.mk p/malbolge.mk p/mcs96.mk p/mips_cs.mk p/mips_gnu.mk p/msp430.mk p/nios2.mk p/pic18c.mk p/ppc_cs.mk p/ppc_gnu.mk p/propeller.mk p/riscv.mk p/rsp.mk p/sh.mk p/snes.mk p/sparc_cs.mk p/sparc_gnu.mk p/spc700.mk p/sysz.mk p/tms320.mk p/tricore.mk p/v810.mk p/v850.mk p/vax.mk p/wasm.mk p/ws.mk p/x86_as.mk p/x86_cs.mk p/x86_nasm.mk p/x86_nz.mk p/x86_udis.mk p/xap.mk p/xcore_cs.mk p/xtensa.mk p/z80.mk 
STATIC_BIN_PLUGINS= p/any.mk p/art.mk p/avr.mk p/bf.mk p/bflt.mk p/bios.mk p/bootimg.mk p/cgc.mk p/coff.mk p/dex.mk p/dol.mk p/dyldcache.mk p/elf.mk p/elf64.mk p/fs.mk p/java.mk p/mach0.mk p/mach064.mk p/mbn.mk p/mdmp.mk p/menuet.mk p/mz.mk p/nes.mk p/nin3ds.mk p/ninds.mk p/ningb.mk p/ningba.mk p/nro.mk p/nso.mk p/omf.mk p/p9.mk p/pe.mk p/pe64.mk p/pebble.mk p/psxexe.mk p/sfc.mk p/smd.mk p/sms.mk p/spc700.mk p/te.mk p/vsf.mk p/wasm.mk p/xbe.mk p/zimg.mk 
STATIC_BIN_XTR_PLUGINS= p/fatmach0.mk p/xtr_dyldcache.mk 
STATIC_BP_PLUGINS= p/arm.mk p/bf.mk p/mips.mk p/ppc.mk p/x86.mk 
STATIC_CORE_PLUGINS= p/anal.mk p/java.mk 
STATIC_CRYPTO_PLUGINS= p/aes.mk p/aes_cbc.mk p/base64.mk p/base91.mk p/blowfish.mk p/cps2.mk p/des.mk p/punycode.mk p/rc2.mk p/rc4.mk p/rc6.mk p/rol.mk p/ror.mk p/rot.mk p/serpent.mk p/xor.mk 
STATIC_DEBUG_PLUGINS= p/bf.mk p/bochs.mk p/esil.mk p/gdb.mk p/io.mk p/native.mk p/null.mk p/qnx.mk p/rap.mk p/windbg.mk 
STATIC_EGG_PLUGINS= p/exec.mk p/xor.mk 
STATIC_FS_PLUGINS= p/ext2.mk p/fat.mk p/fb.mk p/hfs.mk p/hfsplus.mk p/io.mk p/iso9660.mk p/jfs.mk p/minix.mk p/ntfs.mk p/posix.mk p/r2.mk p/reiserfs.mk p/sfs.mk p/tar.mk p/udf.mk p/ufs.mk p/xfs.mk 
STATIC_IO_PLUGINS= p/ar.mk p/bfdbg.mk p/bochs.mk p/debug.mk p/default.mk p/gdb.mk p/gzip.mk p/http.mk p/ihex.mk p/mach.mk p/malloc.mk p/mmap.mk p/null.mk p/procpid.mk p/ptrace.mk p/qnx.mk p/r2k.mk p/r2pipe.mk p/r2web.mk p/rap.mk p/rbuf.mk p/self.mk p/shm.mk p/sparse.mk p/tcp.mk p/w32.mk p/w32dbg.mk p/windbg.mk p/winedbg.mk p/zip.mk 
STATIC_LANG_PLUGINS= p/vala.mk 
STATIC_PARSE_PLUGINS= p/6502_pseudo.mk p/arm_pseudo.mk p/att2intel.mk p/avr_pseudo.mk p/dalvik_pseudo.mk p/m68k_pseudo.mk p/mips_pseudo.mk p/mreplace.mk p/ppc_pseudo.mk p/sh_pseudo.mk p/x86_pseudo.mk p/z80_pseudo.mk 
# config.mk.tail

LIBR:=$(abspath $(dir $(lastword $(MAKEFILE_LIST))))
ifeq ($(LIBR),)
ifeq ($(R2DIR),)
$(error ERROR: Cannot find R2DIR. Please define this variable)
else
LIBR=$(R2DIR)/libr
MSVC=$(R2DIR)/msvc
endif
endif
SHLR:=$(LIBR)/../shlr

#include $(LIBR)/../config-user.mk
include $(LIBR)/../global.mk
include $(LIBR)/../mk/${COMPILER}.mk

CFLAGS+=${CFLAGS_APPEND}
CFLAGS+=${CPPFLAGS}

ifeq ($(WITHPIC),1)
LINK+=$(subst r_,-L$(LIBR)/,$(DEPS))
LINK+=$(subst r_,-lr_,$(DEPS))
LINK+=$(subst r_,-L$(LIBR)/,$(BINDEPS))
LINK+=$(subst r_,-lr_,$(BINDEPS))
CFLAGS+=${PIC_CFLAGS}
LINK+=${PIC_CFLAGS}
else
ifneq ($(DEPS),)
LINK+=$(shell echo ${DEPS} | sed -e 's:r_\([^ ]\+\):$(LIBR)/\1/libr_\1.${EXT_AR}:g')
endif
ifneq ($(BINDEPS),)
LDLIBS+=$(shell echo "${BINDEPS} " | sed -e 's:r_\([^ ]*\):$(LIBR)/\1/libr_\1.${EXT_AR}:g')
endif

#link dependencies of individual r_ libs
#TODO: move them inside libr/*/subdeps.mk
ifneq (,$(findstring r_db,$(BINDEPS)))
LDLIBS+=$(LIBR)/db/sdb/src/libsdb.a
endif
ifneq (,$(findstring r_fs,$(BINDEPS)))
LDLIBS+=$(LIBR)/fs/p/grub/libgrubfs.a
endif
ifneq (,$(findstring r_hash,$(BINDEPS)))
ifneq (${OSTYPE},haiku)
LDLIBS+=-lm
endif
endif
ifneq (,$(findstring r_socket,$(BINDEPS)))
ifeq (${HAVE_LIB_SSL},1)
LDLIBS+=${SSL_LDFLAGS}
endif
endif
ifneq (,$(findstring r_th,$(BINDEPS)))
LDLIBS+=${TH_LIBS}
endif
ifneq (,$(findstring r_util,$(BINDEPS)))
LDLIBS+=${DL_LIBS}
ifeq (${HAVE_LIB_GMP},1)
LDLIBS+=-lgmp
endif
endif
ifneq (,$(findstring r_magic,$(BINDEPS)))
ifeq (${USE_LIB_MAGIC},1)
LDLIBS+=-lmagic
endif
endif

endif

# Compiler: see mk/gcc.mk
# CC CFLAGS CC_LIB CC_AR LINK

# Debug
ifneq ($(OSTYPE),mingw32)
CFLAGS+=-g
endif
CFLAGS+=-Wall

# libgmp
ifeq (${HAVE_LIB_GMP},1)
CFLAGS+=-DHAVE_LIB_GMP=1
BN_LIBS=-lgmp
endif

#both of these need ssl includes
ifneq (,$(filter r_socket r_util,$(BINDEPS)))
ifeq (${HAVE_LIB_SSL},1)
CFLAGS+=${SSL_CFLAGS}
endif
endif

# XXX do it in configure stage
OSTYPE?=gnulinux
ifeq (${OSTYPE},auto)
_UNAME=$(shell uname)
ifeq ($(_UNAME),Darwin)
OSTYPE=darwin
else
OSTYPE=gnulinux
endif
endif
ifeq (${OSTYPE},openbsd)
OSTYPE=bsd
endif
ifeq (${OSTYPE},netbsd)
OSTYPE=bsd
endif
ifeq (${OSTYPE},freebsd)
OSTYPE=bsd
endif
ifeq (${OSTYPE},dragonfly)
OSTYPE=bsd
endif
ifeq (${OSTYPE},bitrig)
OSTYPE=bsd
endif
# Output
ifeq (${OSTYPE},windows)
CFLAGS+=-D__WINDOWS__=1
EXT_AR=lib
EXT_SO=dll
EXT_EXE=.exe
TH_LIBS=
endif
ifneq (,$(findstring cygwin,${OSTYPE}))
CFLAGS+=-D__CYGWIN__=1
EXT_AR=lib
EXT_SO=dll
EXT_EXE=.exe
TH_LIBS=
endif
ifneq (,$(findstring mingw32,${OSTYPE})$(findstring mingw64,${OSTYPE})$(findstring msys,${OSTYPE}))
CFLAGS+=-DMINGW32=1
EXT_AR=lib
EXT_SO=dll
EXT_EXE=.exe
TH_LIBS=
endif
ifeq (${OSTYPE},bsd)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=-lpthread
endif
ifeq (${OSTYPE},qnx)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=
endif
ifeq (${OSTYPE},gnulinux)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=-lpthread
endif
ifeq (${OSTYPE},haiku)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=
endif
ifeq (${OSTYPE},darwin)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=dylib
EXT_EXE=
ifeq ($(shell uname -p),arm)
# iOS
TH_LIBS=
else
# OSX
TH_LIBS=-lpthread
endif
endif
ifeq (${OSTYPE},android)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=
endif
ifeq (${OSTYPE},solaris)
CFLAGS+=-D__UNIX__=1
EXT_AR=a
EXT_SO=so
EXT_EXE=
TH_LIBS=
endif

ifeq (${EXT_SO},)
main:
	@echo
	@echo "OSTYPE: ${OSTYPE}"
	@echo ERROR: Unknown platform
	@echo
	@exit 1
endif

LIB=lib${NAME}
LIBAR=${LIB}.${EXT_AR}
LIBSO=${LIB}.${EXT_SO}
ifeq (${OSTYPE},android)
libname=-shared -o $1.${EXT_SO}
else
ifeq (${OSTYPE},windows)
libname=-shared -o $1.${EXT_SO}
else
ifeq (${OSTYPE},darwin)
ifeq (${HAVE_LIBVERSION},1)
libname=-dynamiclib -o $1.${EXT_SO} ${LDFLAGS_SONAME}$1.${LIBVERSION}.${EXT_SO}
else
libname=-dynamiclib -o $1.${EXT_SO}
endif
else
ifeq (${HAVE_LIBVERSION},1)
libname=-shared -o $1.${EXT_SO} ${LDFLAGS_SONAME}$1.${EXT_SO}.${LIBVERSION}
else
libname=-shared -o $1.${EXT_SO}
endif
endif
endif
endif

ifeq ($(OSTYPE),darwin)
libname-version = $(subst ${EXT_SO},$(2).${EXT_SO},$(1))
else
libname-version = $(1).$(2)
endif

libpath-to-name = $(word 2,$(subst /, ,$(1)))
libpath-to-name-version = $(call libname-version,$(call libpath-to-name,$(1)),$(2))

# -- singleton
endif
