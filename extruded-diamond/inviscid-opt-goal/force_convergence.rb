#!/usr/bin/env ruby

$:.push '~/fun3d/Ruby/misc'

require 'forces_parser'

projects=Dir['Flow/*.forces'].sort

projects.each do |project|
  forces =  Forces.new(project)
  all_boundaries=forces[0]
  cd = all_boundaries['total']['cd']
  line=`grep nnodes #{project.gsub(/.forces/,"_flow_out")}`
  nnodes = line.split(" ").last.to_i
  puts "#{nnodes} #{cd}"
end
