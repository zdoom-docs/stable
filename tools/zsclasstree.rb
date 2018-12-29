#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## Originally by Alison Sanderson.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## ZSClassTree: Generates a class tree from ZScript files.

require 'set'

$c = {}
$s = Set[]
$st = Set[]
$cap = {}

def procm m
   k = (m[1] or "Object").strip
   v = m[0].strip

   $cap[k.upcase] = k; k = k.upcase
   $cap[v.upcase] = v; v = v.upcase

   return if k == v
   $c[k] ? $c[k] << v : $c[k] = [v]
   raise "duplicate class #{v}" if $s === v
   $s << v
end

def procs m
   cl = m[0]
   $cap[cl.upcase] = cl
   $st << [cl.upcase]
end

def procf fp
   t = fp.read
   t.gsub! /\/\*(?!\*\/)+\*\//m, ''
   t.gsub! /\/\/.+/, ''
   sc = t.scan /^class\s*(\w*)[\s\w]+(?::\s+(\w*))?/
   sc.each do |cl| procm cl end unless sc.empty?
   sc = t.scan /^struct\s*(\w*)/
   sc.each do |cl| procs cl end unless sc.empty?
end

dir = ARGV.shift

Dir.glob dir do |item|
   procf open item, "rt"
end

$s1 = Set[]

def procc bcl, t
   raise "duplicate class #{bcl}" if $s1 === bcl
   $s1 << bcl
   return nil unless t
   m = {}
   for cl in t do m[cl] = procc cl, $c[cl] end
   m
end

ft = procc("OBJECT", $c["OBJECT"])

def printc bcl, t, tab = ""
   return unless t
   return if ARGV.include? bcl

   t = t.map do |k, v| [k, v] end
   t.sort!

   for k, v in t
      l = k == t[-1][0]

      s = tab.clone
      s << (l ? "└" : "├")
      s << " "
      s << $cap[k]

      puts s

      printc k, v, l ? tab + "  " : tab + "│ "
   end
end

raise "missing classes: #{($s - $s1).to_a}" unless ($s - $s1).empty?

puts "Object"
printc "OBJECT", ft

puts "Struct"
printc "STRUCT", $st
