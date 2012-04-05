{exec} = require 'child_process'

task "run", "", ->
  exec "coffee -c -o js src", (err, stdout, stderr) ->
    if err 
      console.error err.stack
      return
    else if stdout || stderr
      console.log stdout + stderr 
    run "js/Main.js"
    
run = (file, cb) ->
  exec "node #{file}", (err, stdout, stderr) ->
    if err then console.error err.stack 
    else console.log stdout + stderr if stdout || stderr
    cb?()


