local LevelScene = class("LevelScene", cc.load("mvc").ViewBase)

function LevelScene:onCreate()
  local size = cc.Director:getInstance():getWinSize()

  local background = cc.LayerColor:create(cc.c4b(50, 120, 200, 255))
  self:addChild(background)

  local mario = cc.Sprite:create("mario/mario1.png")
  mario:setAnchorPoint(0, 0)
  mario:setPosition(0, 0)
  self:addChild(mario)

  local animation = cc.Animation:create()
  animation:setDelayPerUnit(0.1)
  for i = 1, 5 do
    local frameName = string.format("mario/mario%d.png", i)
    animation:addSpriteFrameWithFile(frameName)
  end
  local animate = cc.Animate:create(animation)

  local repeatAction = cc.RepeatForever:create(animate)
  mario:runAction(repeatAction)
end

return LevelScene
