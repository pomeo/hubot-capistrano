## Hubot-Capistrano

run capistrano in console and send back output

## Need

[Carrier](https://github.com/pgte/carrier) for line by line output
    
    npm install carrier

HUBOT_CAP - directory where the config files, [example.rb](https://github.com/pomeo/hubot-capistrano/blob/master/example.rb)
    
## Usage

    cap example deploy:setup
    cap example deploy:update
    cap example -T

where 'example' HUBOT_CAP/example.rb

## Screenshot

![screenshot](http://pomeo.github.com/images/hubot-capistrano.png)