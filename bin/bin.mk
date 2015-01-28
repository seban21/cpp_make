# 릴리즈 모드 선택
ifeq ($(RELEASE), 1)
DBG_FLAGS = -O2 -DNDEBUG
else
DBG_FLAGS = -g -O0 -DDEBUG
endif


# 컴파일 명령어
CC = g++


# 라이브러리 오브젝트
LIB_OBJS = 


# 오브젝트 제외 파일
OBJS_EXCEPT_FILE = ! -name 'hiredis.o' \
! -name 'sds.o' \
! -name 'async.o' \
! -name 'net.o'


# 오브젝트 대상 파일 찾기
OBJS_FILE_FIND = $(shell find . -name '*.o' $(OBJS_EXCEPT_FILE))


# 오브젝트 대상 파일 리스트
OBJS_FILE_LIST = $(OBJS_FILE_FIND:./%=% \)


TARGET_FILE_FIND = $(shell find ../src/main -name '*.o')
TARGET_FILE_LIST = $(TARGET_FILE_FIND:../src/main/%=% \)
TARGET_LIST = $(TARGET_FILE_LIST:%.o=%)
TARGET = $(shell echo $(TARGET_LIST) | rev | cut -c 2- | rev)


# 오브젝트 대상
OBJS_REPLACE = $(shell echo $(OBJS_FILE_LIST) | rev | cut -c 2- | rev)
OBJS = $(shell echo $(OBJS_REPLACE) | tr '  ' ' ')


.SUFFIXES : .o


all : $(TARGET)
$(TARGET) :
	@echo $(TARGET_FILE_FIND)
	cp -R ../src/main/$@.o ./
	$(CC) $(DBG_FLAGS) -o $@.exe $@.o $(OBJS) $(LIB_OBJS)
	rm -f $@.o

clean:
	rm -f *.o
	rm -f *.exe
