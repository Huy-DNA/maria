local MenuScene = class("MenuScene", cc.load("mvc").ViewBase)

function MenuScene:onCreate()
  local size = cc.Director:getInstance():getWinSize()

  local background = cc.LayerColor:create(cc.c4b(50, 120, 200, 255))
  self:addChild(background)

  local titleLabel = cc.Label:createWithSystemFont("Mario", "Arial", 50)
  titleLabel:setPosition(size.width / 2, size.height - 50)
  self:addChild(titleLabel)
end

return MenuScene
