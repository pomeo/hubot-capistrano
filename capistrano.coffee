spawn = require('child_process').spawn
carrier = require('carrier')

module.exports = (robot) ->
  robot.respond /\bcap\b\s\b(\w*)\b\s((?:\-[a-zA-Z]{1,10})|(?:\w*\:\w*\:\w*)|(?:\w*\:\w*)|(?:\w*))\b/i,
(msg)->
    conf = msg.match[1]
    comm = msg.match[2]
    dir = process.env.HUBOT_CAP+'/'+conf+'.rb'
    cap = spawn 'cap', ['-f',dir,comm]
    capout = carrier.carry cap.stdout
    caperr = carrier.carry cap.stderr
    capout.on 'line', (line) ->
      msg.send line
    caperr.on 'line', (line) ->
      msg.send line