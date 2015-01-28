# 릴리즈 모드 선택
ifeq ($(RELEASE), 1)
DBG_FLAGS = -g -O0 -DDEBUG
else
DBG_FLAGS = -O3 -DNDEBUG
endif


# OS타입 선택
ifeq ($(OSTYPE), 1)
OS_FLAGS = -fPIC
else
OS_FLAGS = 
endif


# 컴파일 명령어
CC = g++


# 기본 해더 파일
LIB_HEADER = -I/Library/Developer/CommandLineTools/usr/include/c++/v1 \
-I/usr/include/c++/4.2.1 \
-I/usr/include


# 컴파일 제외 파일
TARGET_EXCEPT_FILE = ! -name 'Example.cpp' \
! -name 'Sample.cpp'


# 컴파일 제외 디렉터리
TARGET_EXCEPT_FILE_FIND = ! \( \( -type d -path './lib' -o -path './main' -o -path './utils' \) -prune \)


# 컴파일 대상 파일 찾기
TARGET_FILE_FIND = $(shell find . $(TARGET_EXCEPT_FILE_FIND) -name '*.cpp' $(TARGET_EXCEPT_FILE))


# 컴파일 대상 파일 리스트
TARGET_FILE_LIST = $(TARGET_FILE_FIND:./%=% \)


# 컴파일 대상
TARGET_LIST = $(TARGET_FILE_LIST:%.cpp=%)
TARGET = $(shell echo $(TARGET_LIST) | rev | cut -c 2- | rev)


# 오브젝트 제외 파일
OBJS_EXCEPT_FILE = ! -name 'hiredis.o' \
! -name 'sds.o' \
! -name 'async.o' \
! -name 'net.o'


# 오브젝트 대상 파일 찾기
OBJS_FILE_FIND = $(shell find . -name '*.o' $(OBJS_EXCEPT_FILE))


# 오브젝트 대상
OBJS_REPLACE = $(shell echo $(OBJS_FILE_LIST) | rev | cut -c 2- | rev)
OBJS = $(shell echo $(OBJS_REPLACE) | tr '  ' ' ')


.SUFFIXES : .cpp .o


all : $(TARGET)
$(TARGET) :
	$(CC) $(OS_FLAGS) -Wall $(DBG_FLAGS) $(LIB_HEADER) -c $@.cpp


clean : 
	rm -f $(OBJS)