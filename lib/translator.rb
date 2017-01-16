# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoji = YAML.load_file(path)
  return_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  emoji.each{|meaning, value|
    return_hash['get_meaning'][value[1]] = meaning
    return_hash['get_emoticon'][value[0]] = value[1]
  }
  return_hash
end

def get_japanese_emoticon(path, emoji)
  load_library(path)['get_emoticon'].each{|american, japanese|
    if american == emoji
      return japanese
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoji)
  load_library(path)['get_meaning'].each{|japanese, english|
    if emoji == japanese
      return english
    end
  }
  "Sorry, that emoticon was not found"
end
