cd ../

testbank="tests/"
test_prefix="${testbank}cases/test"
stderr_prefix="${testbank}out_errs/test_errs_"
mips_prefix="${testbank}out_mips/test_mips_"
spim_prefix="${testbank}out_spim/test_spim_"
valgrind_prefix="${testbank}out_valgrind/val_"

# function mem_leak() {
#    valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt $*
# }

remake=false
pure_remake=false
Olocal=false
Oglobal=false
run_spim=false
valgrind=false

# [[ if_condition ]] && ( then; statements )

for var in "$@"
do
    [[ $var = "--remake" ]]         && remake=true
    [[ $var = "--pure_remake" ]]    && pure_remake=true
    [[ $var = "--Olocal" ]]         && Olocal=true
    [[ $var = "--Oglobal" ]]        && Oglobal=true
    [[ $var = "--run_spim" ]]       && run_spim=true
    [[ $var = "--valgrind" ]]       && valgrind=true

done

[[ $remake = true ]]        && ( echo "remaking -----"; make )
[[ $pure_remake = true ]]   && ( echo "cleaning and remaking -----"; make clean; make )

for i in {1..50} 
do
    echo "running test on ${test_prefix}${i}.c"
    [[ $Olocal = true  && $Oglobal = true ]] && ./compile -DDEBUG -Olocal -Oglobal < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $Olocal = true  && $Oglobal = false ]] && ./compile -DDEBUG -Olocal < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $Olocal = false  && $Oglobal = true ]] && ./compile -DDEBUG -Oglobal < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $Olocal = false  && $Oglobal = false ]] && ./compile -DDEBUG < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $valgrind = true ]] && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file="${valgrind_prefix}${i}.txt" ./compile -DDEBUG -Olocal < "${test_prefix}${i}" > "${mips_prefix}${i}.s" 2> "${stderr_prefix}${i}.txt"
    [[ $run_spim = true ]] && spim -file "${mips_prefix}${i}.s" > "${spim_prefix}${i}.txt"

done

cd tests/