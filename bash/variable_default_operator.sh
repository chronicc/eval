#!/bin/bash


check_var_without_colon () {
	echo "Without colon: "
	if [ "${TESTVAR-}" ];
	then
		echo "true"
	else
		echo "false"
	fi
	echo "${TESTVAR-substitute}"
	echo "---"
}

check_var_with_colon () {
	echo "With colon: "
	if [ "${TESTVAR:-}" ];
	then
		echo "true"
	else
		echo "false"
	fi
	echo "${TESTVAR:-substitute}"
	echo "---"
}

echo "TESTVAR: 1"
TESTVAR="1"
check_var_without_colon
check_var_with_colon

echo "TESTVAR: empty"
TESTVAR=""
check_var_without_colon
check_var_with_colon

echo "TESTVAR: unset"
unset TESTVAR
check_var_without_colon
check_var_with_colon

