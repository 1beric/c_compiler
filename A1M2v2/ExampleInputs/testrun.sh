cd ../

testbank="ExampleInputs/"
test_prefix="${testbank}test"
stderr_prefix="${testbank}OutputErrors/test"
mips_prefix="${testbank}OutputMIPS/test"
spim_prefix="${testbank}OutputSPIM/test"
valgrind_prefix="${testbank}OutputValgrind/val_out"

# function mem_leak() {
#    valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt $*
# }

remake=false
pure_remake=false
gen_mips=false
run_spim=false
valgrind=false

# [[ if_condition ]] && ( then; statements )

for var in "$@"
do
    [[ $var = "--remake" ]]         && remake=true
    [[ $var = "--pure_remake" ]]    && pure_remake=true
    [[ $var = "--gen_mips" ]]       && gen_mips=true
    [[ $var = "--run_spim" ]]       && run_spim=true
    [[ $var = "--valgrind" ]]       && valgrind=true

done

[[ $remake = true ]]        && ( echo "remaking -----"; make )
[[ $pure_remake = true ]]   && ( echo "cleaning and remaking -----"; make clean; make )


for i in {1..50} 
do
    echo "running test on ${test_prefix}${i}.c"
    [[ $gen_mips = true ]] && ./compile -DDEBUG < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $valgrind = true ]] && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file="${valgrind_prefix}${i}.txt" ./compile -DDEBUG < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $run_spim = true ]] && spim -file "${mips_prefix}${i}.s" > "${spim_prefix}${i}.txt"

done



cd ExampleInputs/