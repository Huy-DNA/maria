local LevelScene = class("LevelScene", cc.load("mvc").ViewBase)
local Mario = require("app.sprites.Mario")

function LevelScene:onCreate()
  local size = cc.Director:getInstance():getWinSize()

  local background = cc.LayerColor:create(cc.c4b(50, 120, 200, 255))
  self:addChild(background)

  local mario = Mario:new(self, cc.p(0, 0), cc.p(0, 0))
  self:addChild(mario:getSprite())
end

return LevelScene
