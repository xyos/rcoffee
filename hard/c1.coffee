tries = []

g = {}

guess = (h,l) ->
  g.h = h
  g.l = l
  g.m = parseInt (h + l)/2
  tries.push g.m unless g.m in tries
  console.log "Is it #{g.m}? (h)igher, (l)ower, (yes)"

console.log "think a number between 1-100"

guess 100, 1

process.stdin.setEncoding('utf8')
process.stdin.resume()
process.stdin.on "data", (c) =>
  c = c + ""
  switch c
    when "h" then guess g.h,g.m
    when "l" then guess g.m,g.l
    when "y"
      console.log "number was #{g.m}, took me #{tries.length} tries"
      console.log g
      process.exit()
    else guess g.h,g.l

require('tty').setRawMode true
