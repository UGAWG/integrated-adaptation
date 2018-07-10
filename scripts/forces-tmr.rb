#!/usr/bin/env ruby

things = `grep root_project case_specifics`.split(/[',"]/)
root = things[1]

File.open("#{root}-ws.dat","w") do |o|
  o.puts 'VARIABLES="N","h=N^(-1/3)","h^2=N^(-2/3)","CL","CD","CDp","CDv","CMy" "max_MUT"'
  o.puts "ZONE, t=\"Integrated Adaptation Proccess\""
  100.times do |i|
    fileroot=sprintf("%s%02d",root,i+1)
    break unless (File.exists?("Flow/#{fileroot}.forces"))
    break unless (File.exists?("Flow/#{fileroot}_flow_out"))
    nnodes=`grep nnodes Flow/#{fileroot}_flow_out`.split.last.to_i
    break unless (nnodes.to_f>0.1) # skip still running
    h1 = nnodes.to_f**(-1.0/3.0)
    h2 = nnodes.to_f**(-2.0/3.0)
    cl = `tail -n 3 Flow/#{fileroot}.forces | grep Cl`.split[2]
    cd = `tail -n 3 Flow/#{fileroot}.forces | grep Cd`.split[5]
    cdp = `tail -n 12 Flow/#{fileroot}.forces | head -4 | grep Cd`.split[5]
    cdv = `tail -n 8 Flow/#{fileroot}.forces | head -4 | grep Cd`.split[5]
    cmy = `tail -n 3 Flow/#{fileroot}.forces | grep Cmy`.split[5]
    o.puts [nnodes,h1,h2,cl,cd,cdp,cdv,cmy,0].join(" ")
    puts fileroot
  end
end
