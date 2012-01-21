# run capistrano in console and send back output
#
# Currently all todos are added to the Inbox.
#
# Environment variables:
#   HUBOT_CAP - directory where the config files, example https://github.com/pomeo/hubot-capistrano/example.rb
#
# cap example deploy:setup
# cap example deploy:update
# cap example -T
#
# where 'example' HUBOT_CAP/example.rb  
#
# need https://github.com/pgte/carrier for line by line output
# npm install carrier
#
    
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