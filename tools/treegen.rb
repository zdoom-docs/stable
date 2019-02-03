#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## By Alison Sanderson. Attribution is encouraged, though not required.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## TreeGen: Generates the glossary files for classes.

require "./tools/zsclasstree.rb"

DIR = ARGV.shift
VER = ARGV.shift

si = ClassSiphon.new DIR

f = open "glossary-classes.md", "wb"
f.puts <<_end_
# Classes

Here is a full tree of all classes in ZScript as of GZDoom #{VER}. There are
#{si.classes.count + 1} classes total.

```
Object
_end_

si.print_classes f

f.puts <<_end_
```

<!-- EOF -->
_end_

f = open "glossary-structures.md", "wb"
f.puts <<_end_
# Structures

Here is a full list of all structures in ZScript as of GZDoom #{VER}. There are
#{si.structs.count} structures total. Note that some of these are merely
implementation details and should not be used in code.

```
Struct
_end_

si.print_structs f

f.puts <<_end_
```

<!-- EOF -->
_end_

## EOF
