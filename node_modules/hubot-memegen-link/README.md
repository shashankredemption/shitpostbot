# hubot-memegen-link

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-memegen.svg)](https://travis-ci.org/ClaudeBot/hubot-memegen)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-memegen/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-memegen#info=devDependencies)

A Hubot script for creating memes from templates using memegen.link.

See [`src/hubot-memegen.coffee`](src/hubot-memegen.coffee) for full documentation.


## Installation via NPM

1. Install the __hubot-memegen-link__ module as a Hubot dependency by running:

    ```
    npm install --save hubot-memegen-link
    ```

2. Enable the module by adding the __hubot-memegen-link__ entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-memegen-link"
    ]
    ```

3. Run your bot and see below for available config / commands


## Commands

Command | Description
--- | ---
hubot list | Returns available meme templates from Memegen.link and their respective URLs (keys)
hubot <template> --top <text> --bottom <text> | Creates a <template> meme using <text> and returns links to it


## Sample Interaction

```
user1>> hubot meme chosen --top Hello World! --bottom Ayy Lmao!
hubot>> Visible: http://memegen.link/chosen/hello-world%21/ayy-lmao%21.jpg
hubot>> Masked: http://memegen.link/_Y2hvc2VuCWhlbGxvLXdvcmxkIS9heXktbG1hbyEJ.jpg
```
