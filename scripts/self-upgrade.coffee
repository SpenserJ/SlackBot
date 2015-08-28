# Description:
#   Allows hubot to upgrade himself and reload scripts.
#
# Commands:
#   hubot upgrade|reboot|restart|power up|level up|learn.

module.exports = (robot) ->
  robot.respond /(upgrade|reboot|restart|power up|level up|learn)$/i, (msg) ->
    @exec = require('child_process').exec
    path = require('path').resolve(__dirname, '..')
    command = 'cd ' + path + ' && git pull && npm install && forever restart 0'

    @exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr

    command = 'cd ' + path + ' && git pull origin master && forever restart 0'

    msg.send 'BRB, bathroom break...'
    @exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr
