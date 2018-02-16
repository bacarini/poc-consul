#!/usr/bin/env ruby -I ../lib -I lib
require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  "APP: #{ENV['node']}"
end
