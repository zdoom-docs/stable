#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## By Alison Sanderson. Attribution is encouraged, though not required.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## TreeGen: Generates the glossary files for classes.
## Example usage:
## tools/treegen.rb \
## '/mnt/g/Archive/gzdoom-g4.1.0/wadsrc/static/zscript/**/*.zs' \
## 4.1.0

require "./tools/zsclasstree.rb"

FILES = ARGV.shift
VERSION = ARGV.shift

siphon = ClassSiphon.new FILES

file = open "glossary-Classes.md", "wb"
file.puts <<_end_
# Classes

Here is a full tree of all classes in ZScript as of GZDoom #{VERSION}. There
are #{siphon.classes.count + 1} classes total.

```
Object
_end_

siphon.print_classes file

file.puts <<_end_
```

<!-- EOF -->
_end_

file = open "glossary-Structures.md", "wb"
file.puts <<_end_
# Structures

Here is a full list of all structures in ZScript as of GZDoom #{VERSION}.
There are #{siphon.structs.count} structures total. Note that some of these
are merely implementation details and should not be used in code.

```
Struct
_end_

siphon.print_structs file

file.puts <<_end_
```

<!-- EOF -->
_end_

## EOF
