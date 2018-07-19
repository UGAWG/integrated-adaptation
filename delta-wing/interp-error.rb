#!/usr/bin/env ruby

t=29
root='Flow/delta'
norm=2

(1..(t-1)).each do |i|
  truth=sprintf("%s%02d",root,t)
  candidate=sprintf("%s%02d",root,i)
  comm = "ref_interp_test --error ${truth}.meshb ${truth}_volume.solb ${candidate}.meshb ${candidate}_volume.solb ${norm}"
  system comm
end
