local MenuScene = class("MenuScene", cc.load("mvc").ViewBase)

function MenuScene:onCreate()
  -- add background image
  display.newSprite("HelloWorld.png")
      :move(display.center)
      :addTo(self)

  -- add HelloWorld label
  cc.Label:createWithSystemFont("Hello World", "Arial", 40)
      :move(display.cx, display.cy + 200)
      :addTo(self)
end

return MenuScene
