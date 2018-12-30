#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## Originally by Alison Sanderson.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## TOCGen: Generates inter-file TOCs.

$d = Dir["*.md"]

def filter_emit r
   res = []
   for m in $d.map{|p| p.match r}.compact
      res << "* [#{m[1]}](#{m[0]})"
   end
   res.join ?\n
end

def find_toc_areas f
   f.to_enum(:scan, /^(<!-- toc (.+) -->)(?:.|\n)*?(<!-- toc end -->)/i).map{$~}
end

def filter_toc_areas f
   o = String.new
   lof = 0
   for area in find_toc_areas f
      of = area.offset 0
      o << f[lof...of[0]]
      o << area[1]
      o << "\n\n"
      o << filter_emit(yield area[2])
      o << "\n\n"
      o << area[3]
      lof = of[1]
   end
   o << f[lof..-1]
   o
end

def rewrite fnam
   f = File.read fnam
   o = yield f
   File.write fnam, o
end

rewrite "2-api.md" do |f| filter_toc_areas f do |a| /api-#{a}-(\w+).md/ end end

## EOF
