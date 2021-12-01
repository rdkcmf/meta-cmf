# Fix problems with "Fatal error: can't create src/processor/stackwalk_common.o: No such file or directory"
do_compile_prepend () {
    mkdir -p ${B}/src/processor
}
