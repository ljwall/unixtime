# unixtime

Command line utility to to convert Unix timestamps to date/time strings.

Reads from standard input, expecting an integer on each line, and prints human
readable date/time strings to standard output.

Use here-strings to pass in a value directly, like so:

```
% unixtime <<<1555426800
2019-04-16 15:00:00 UTC
```
