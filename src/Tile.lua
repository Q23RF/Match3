--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color==7 and 6 or color
    self.variety = variety
    self.shine = math.random(15)==1 and true or false
    if self.shine then

    end
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    -- shinny effect if it shines
    if self.shine then
        love.graphics.setColor( 1, 1, 1, .9)
        love.graphics.rectangle( "fill", self.x + x + 6, self.y + y + 11, 2, 8)
        love.graphics.rectangle( "fill", self.x + x + 8, self.y + y + 6, 2, 2)
        love.graphics.setColor( 1, 1, 1, .2)
        love.graphics.rectangle( "fill", self.x + x + 1, self.y + y + 1, 30, 30, 5, 5)

    end
end