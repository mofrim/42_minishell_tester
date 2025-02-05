# Mofrim's version of the 42_minishell_tester

This is my fork / version of [zstenger93's](https://github.com/zstenger93)
[42_minishell_tester](https://github.com/zstenger93/42_minishell_tester).
Huuuuge Thx to him and his collaborators for putting together this helpful piece
of software!!!

My workflow using this tester was a bit different from the authors and i also
just wanted it to live inside my minishell-repo so i decided to tweak it a
little bit.

## HOWTO aka *The way i modified & used this tester*

### Installation & basic usage

- Clone this repo into your minishell repo (or even add as a submodule):
`git clone https://github.com/mofrim/42_minishell_tester.git`
- `cd 42_minishell_tester`
- `./tester_stop.sh m` or `./tester_quick.sh m` ...

### Explanation

For command line options and usage explanation just run `./tester_quick.sh`
without any args.

There are 3 scripts in my repo: `tester_quick.sh`, `single_test.sh` and
`tester_stop.sh`:

- `tester_stop.sh` Runs all tests but stops after each test waiting for user to
  press enter. Used this at the beginning when there were still a lot of tests
  failing or even ending in infinite loops.
- `tester_quick.sh`: Runs all tests without stopping after each test. After we
  got our failing tests number down to approx 200 and there were no more
  infinite loops i used this. Also later after refactoring for regression
  testing.
- `single_test.sh` Use this script to run individual tests. Workflow:

  1) run one of the main tester scripts to a fail
  2) open the corresponding test-file from `cmds` dir in your editor
  3) copy the test that has failed to `single_test.sh`
  4) if it is a multi-line test paste it at the heredoc, else at the single line
     between the quotes
  5) run the test, watch the output, debug, fix...
