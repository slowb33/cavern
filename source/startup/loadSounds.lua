sounds = {}

-- There are multiple laser sound effects, was originally planning to have
-- it randomly play one, but I decided I like laser2.wav the best.
sounds.laser = love.audio.newSource("sounds/player/laser2.wav", "static")
--sounds.laser = love.audio.newSource({"sounds/player/laser1.wav", "sounds/player/laser2.wav", "sounds/player/laser3.wav"}, "static")

sounds.blip = love.audio.newSource("sounds/blip.wav", "static")
