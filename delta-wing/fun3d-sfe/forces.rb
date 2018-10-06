#!/usr/bin/env ruby

puts 'VARIABLES="Iter"     "DOF"     "C<sub>L</sub>"     "C<sub>D</sub>"     "C<sub>M</sub>"          "Estimate"         "Indicator"'
puts 'ZONE T="FUN3D-FE Multiscale Mach"'
cycs = Dir['Flow/delta*_flow_out'].sort
cycs.each do |cyc|
  i = cyc.gsub(/\D/,'').to_i
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
  puts "#{i-1} #{n} #{cl} #{cd} 0 0 0"
end
