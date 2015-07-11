# Description
#   A Hubot script for creating memes from templates using memegen.link.
#
# Configuration:
#   None
#
# Commands:
#   hubot list - Returns available meme templates from Memegen.link and their respective URLs (keys)
#   hubot <template> --top <text> --bottom <text> - Creates a <template> meme using <text> and returns links to it
#
# Notes:
#   None
#
# Author:
#   MrSaints

MEMEGEN_API_URL = "http://memegen.link"

module.exports = (robot) ->
    _templateCache = null

    robot.respond /meme list/i, (res) ->
        return res.send(_templateCache) if _templateCache?
        GetMGResult res, "/templates/", null, (obj) ->
            _templateCache = ""
            for template, url of obj
                key = url.split "/"
                key = key[key.length - 1]
                _templateCache += "#{template} | Key: #{key} | Example: http://memegen.link/#{key}/hello/world.jpg\n"
            # TODO: Paste results?
            res.send _templateCache

    robot.respond /meme (.+) --top (.+) --bottom (.+)/i, (res) ->
        template = res.match[1]
        topText = _spaceToHyphen(res.match[2])
        bottomText = _spaceToHyphen(res.match[3])

        GetMGResult res, "/#{template}/#{topText}/#{bottomText}", null, (obj) ->
            links = "Visible: #{obj.direct.visible}\n"
            links += "Masked: #{obj.direct.masked}"
            res.send links

_spaceToHyphen = (str) ->
    str.replace(/\s+/g, '-').toLowerCase()

GetMGResult = (res, api, params = {}, handler) ->
    res.http("#{MEMEGEN_API_URL}#{api}")
        .query(params)
        .get() (err, httpRes, body) ->
            # TODO: Improve error handling
            if err or (httpRes.statusCode isnt 200 and httpRes.statusCode isnt 302)
                res.reply "I'm unable to process your request at this time due to a server error. Please try again later."
                return res.robot.logger.error "hubot-memegen: #{body} (#{err})"

            handler JSON.parse(body)