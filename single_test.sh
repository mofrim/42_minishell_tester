#!/usr/bin/env bash

## enter *single* line from test file here
line='/usr/bin/env echo $"42$"'

## enter multiline tests here
read -r -d '' line << 'EOF'
export test="arg1	arg2"
echo 'echo $1' > tmp_test_sh
bash tmp_test_sh $test
echo 'echo $2' > tmp_test_sh
bash tmp_test_sh $test
rm -f tmp_test_sh
EOF

## actual script starting here...

## Don't touch this!
NL=$'\n'
INPUT=""
INPUT+="$line$NL"

echo ">>> Running test:"
IFS=$'\n'
for i in $line; do
	echo "> $i"
done
echo

## bash:
echo -e ">>> Bash's Output:\n"
# echo -n "enable -n .$NL$INPUT" | bash 2>tmp_err_bash >tmp_out_bash
echo -n "enable -n .$NL$INPUT" | bash
exit_code_bash=$?
echo

## minishell:
echo -e ">>> Minish's Output:\n"
# echo -n "$INPUT" | ../minishell 2>tmp_err_minishell >tmp_out_minishell
echo -n "$INPUT" | ../minishell
exit_code_minish=$?

## the reesulting exit codes:
echo
echo ">>> exit_code_bash: $exit_code_bash, exit_code_minish: $exit_code_minish"
