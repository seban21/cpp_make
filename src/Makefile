# 작성자 : 김병수
# compile and link ->        make MODE=all RELEASE=1 OSTYPE=1
#                            make MODE=all
# clean ->                   make MODE=clean


ifeq ($(MODE), clean)
MODE = clean

else
MODE = all

endif


all: utils1 \
lib2 \
root3 \
main4 \
bin5


utils1:
	@echo ""
	@echo ""
	@echo "========================================"
	@echo "utils"
	make -C ./utils -f utils.mk $(MODE) RELEASE=$(RELEASE) OSTYPE=$(OSTYPE)


lib2:
	@echo ""
	@echo ""
	@echo "========================================"
	@echo "lib"
	make -C ./lib -f lib.mk $(MODE) RELEASE=$(RELEASE) OSTYPE=$(OSTYPE)


root3:
	@echo ""
	@echo ""
	@echo "========================================"
	@echo "main"
	make -f root.mk $(MODE) RELEASE=$(RELEASE) OSTYPE=$(OSTYPE)


main4:
	@echo ""
	@echo ""
	@echo "========================================"
	@echo "main"
	make -C ./main -f main.mk $(MODE) RELEASE=$(RELEASE) OSTYPE=$(OSTYPE)


bin5:
	@echo ""
	@echo ""
	@echo "========================================"
	@echo "bin"
	rm -f ./../bin/*.o
	rm -f ./../bin/*.exe
ifeq ($(MODE), all)
	cp -R ./lib/*.o ./../bin
	cp -R ./utils/*.o ./../bin
	cp -R ./*.o ./../bin

endif
	make -C ./../bin -f bin.mk $(MODE) RELEASE=$(RELEASE) OSTYPE=$(OSTYPE)
	rm -f ./lib/*.o
	rm -f ./utils/*.o
	rm -f ./main/*.o
	rm -f ./../bin/*.o
	rm -f ./*.o
