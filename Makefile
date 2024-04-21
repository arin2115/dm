# User settings
DEBUG ?= yes
UNICODE ?= yes
MSYS_PATH ?= C:/MinGW/msys/1.0
OPENSSL_INC_DIR ?= C:/crpa/openssl/include
OPENSSL_LIB_DIR ?= C:/crpa/openssl

USER_INC_DIRS =
USER_DEFINES  =

# WINVER definitions
WINVER  ?= 0x0501
WIN32IE ?= 0x0400

# == Don't change below unless you know what you are doing! ==
BUILD_DIR = build
BIN_DIR = bin
SRC_DIR = src

INC_DIRS = \
	$(USER_INC_DIRS) \
	-I$(OPENSSL_INC_DIR)         \
	-Ideps/iprogsthreads/include \
	-Ideps/mwas/include          \
	-Ideps/asio                  \
	-Ideps/boost                 \
	-Ideps/websocketpp           \
	-Ideps/httplib               \
	-Ideps/json                  \
	-Ideps/stb

LIB_DIRS = \
	-L$(OPENSSL_LIB_DIR)

DEFINES = \
	-DWINVER=$(WINVER)            \
	-D_WIN32_WINNT=$(WINVER)      \
	-D_WIN32_IE=$(WIN32IE)        \
	-DASIO_STANDALONE             \
	-DASIO_HAS_THREADS            \
	-DASIO_DISABLE_STD_FUTURE     \
	-DASIO_DISABLE_GETADDRINFO    \
	-DASIO_SEPARATE_COMPILATION   \
	-DASIO_IPROGS_THREADS         \
	-D_WEBSOCKETPP_IPROGS_THREAD_ \
	-DMINGW_SPECIFIC_HACKS        \
	-DASIO_DISABLE_WINDOWS_OBJECT_HANDLE

ifeq ($(UNICODE), no)
	UNICODE_DEF =
else
	UNICODE_DEF = -DUNICODE -D_UNICODE
endif

ifeq ($(DEBUG), yes)
	DEBUG_DEF = -D_DEBUG -g -O0
else
	DEBUG_DEF = -DNDEBUG -O2
endif

CXXFLAGS = \
	$(INC_DIRS)    \
	$(DEFINES)     \
	-MMD           \
	-std=c++11     \
	-mwindows      \
	$(UNICODE_DEF) \
	$(DEBUG_DEF)

LDFLAGS = \
	$(LIB_DIRS) \
	-mwindows   \
	-lmswsock   \
	-lws2_32    \
	-lcomctl32  \
	-lgdi32     \
	-luser32    \
	-lole32     \
	-lcrypto    \
	-lssl
