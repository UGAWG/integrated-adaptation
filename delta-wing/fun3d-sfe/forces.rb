#!/usr/bin/env ruby

cycs = Dir['Flow/delta*_flow_out'].sort
cycs.each do |cyc|
  forces = `grep Forces #{cyc} | tail -1`
  cx = forces.split[6].to_f
  cy = forces.split[7].to_f
  cz = forces.split[8].to_f
  alpha = 12.5
  rad = 12.5*Math::PI/180.0
  sref=0.133974596
  lift = -cx*Math.sin(rad) + cz*Math.cos(rad)
  drag =  cx*Math.cos(rad) + cz*Math.sin(rad)
  cl = lift/sref
  cd = drag/sref
  n = `grep nnodesg #{cyc}`.split[2].to_i
  puts "#{n} #{cl} #{cd}"
end
