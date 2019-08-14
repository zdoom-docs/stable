#!/usr/bin/env ruby
## Distributed under the CC0 public domain license.
## By Alison Watson. Attribution is encouraged, though not required.
## <https://creativecommons.org/publicdomain/zero/1.0/legalcode>
## TOCGen: Generates inter-file TOCs.
## Example usage:
## tools/tocgen.rb

def emit_filtered_file_toc file_matcher
	links = []
	files = ALL_MD_FILES.map do |p| p.match file_matcher end.compact

	for md_file in files
		links << "* [#{md_file[1]}](#{md_file[0]})"
	end

	links.sort.join ?\n
end

TOC_REGEX = /^(<!-- inter-toc\s*([^\s]+)?\s*-->)(?:.|\n)*?(<!-- end -->)/i
def find_inter_toc_areas file
	file.to_enum(:scan, TOC_REGEX).map do $~ end
end

def filter_toc_areas file
	content = ""
	last_offset = 0

	for area in find_inter_toc_areas file
		offset = area.offset 0
		content << file[last_offset...offset[0]]
		content << area[1]
		content << "\n\n"
		content << emit_filtered_file_toc(yield area[2])
		content << "\n\n"
		content << area[3]
		last_offset = offset[1]
	end

	content << file[last_offset..-1]
	content
end

def rewrite filename
	file = File.read filename
	output = yield file
	File.write filename, output
end

ALL_MD_FILES = Dir["{api,glossary,language}/**/*.md"]

rewrite "api.md" do |file|
	filter_toc_areas file do |folder| /api\/#{folder}\/(\w+).md/ end
end

rewrite "glossary.md" do |file|
	filter_toc_areas file do |_| /glossary\/(\w+).md/ end
end

rewrite "language.md" do |file|
	filter_toc_areas file do |_| /language\/(\w+).md/ end
end

## EOF
