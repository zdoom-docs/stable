#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## Originally by Alison Sanderson.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## ZSClassTree: Generates a class tree from ZScript files.

require 'set'

class ClassSiphon
   attr_reader :structs, :classes, :clstree, :strtree, :caps

   def initialize dirs
      @subcls  = {}
      @classes = Set[]
      @structs = Set[]
      @caps    = {}

      Dir.glob dirs do |f| proc_file File.read f end

      @clstree = make_tree "OBJECT", @subcls["OBJECT"]
      @strtree = @structs.map {|type| [type, nil]}

      @classes.freeze
      @structs.freeze
      @clstree.freeze
      @strtree.freeze
      @caps.freeze
   end

   def print_classes out, filter = []
      print_tree out, filter, "OBJECT", clstree
   end

   def print_structs out, filter = []
      print_tree out, filter, "STRUCT", strtree
   end

   private
   def add_class m
      ctype =  m[0]             .strip
      cbase = (m[1] or "Object").strip
      type = ctype.upcase
      base = cbase.upcase
      @caps[type] = ctype
      @caps[base] = cbase

      if base != type
         if @subcls[base]
            @subcls[base] << type
         else
            @subcls[base] = [type]
         end
         raise "duplicate class #{type}" if @classes === type
         @classes << type
      end
   end

   def add_struct m
      ctype = m[0]
      type = ctype.upcase
      @caps[type] = ctype
      @structs << type
   end

   def proc_file f
      f.gsub! /\/\*(?!\*\/)+\*\//m, ""
      f.gsub! /\/\/.+/, ""
      f.scan(/^class\s*(\w*)[\s\w]+(?::\s+(\w*))?/).each {|m| add_class  m}
      f.scan(/^struct\s*(\w*)/)                    .each {|m| add_struct m}
   end

   # work our way down the subclasses recursively, making them into a tree structure
   def make_tree bcl, subs
      return nil unless subs
      node = {}
      subs.each do |cl| node[cl] = make_tree cl, @subcls[cl] end
      node
   end

   def print_tree out, filter, base, tree, tab = ""
      return if !tree or filter.include? base

      tree = tree.map do |type, base| [type, base] end
      tree.sort!

      for type, base in tree
         last = type == tree[-1][0]
         sep = last ? "└ " : "├ "
         nxt = last ? "  " : "│ "

         out.puts tab + sep + @caps[type]

         print_tree out, filter, type, base, tab + nxt
      end
   end
end

if __FILE__ == $0
   in_dirs = ARGV.shift
   filters = ARGV

   si = ClassSiphon.new in_dirs
   puts "Object"; si.print_classes STDOUT, filters
   puts "Struct"; si.print_structs STDOUT, filters
end

## EOF
