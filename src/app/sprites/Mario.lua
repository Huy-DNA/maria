local Mario = {}

local KEYCODE_LEFT = 37
local KEYCODE_RIGHT = 39
local KEYCODE_UP = 38
local KEYCODE_SPACE = 32

local LEFT = 0
local RIGHT = 1

function Mario:new(scene, position, velocity)
  local o = {}
  setmetatable(o, self)
  self.__index = self

  o.position = position
  o.velocity = velocity

  o.direction = RIGHT

  o.moveSpeed = 200
  o.isJumping = false
  o.jumpForce = 450
  o.gravity = -800

  o.player = cc.Sprite:create("mario/mario1.png")
  o.player:setAnchorPoint(0, 0)
  o.player:setPosition(position.x, position.y)

  o:setupInputListeners(scene)

  return o
end

function Mario:getSprite()
  return self.player
end

function Mario:setupInputListeners(scene)
  local function onKeyPressed(keyCode, event)
    if keyCode == KEYCODE_LEFT then
      self.direction = LEFT
      self.velocity.x = -self.moveSpeed
      self.player:setScaleX(-1) -- Flip sprite left
    elseif keyCode == KEYCODE_RIGHT then
      self.direction = RIGHT
      self.velocity.x = self.moveSpeed
      self.player:setScaleX(1) -- Normal sprite orientation
    elseif keyCode == KEYCODE_UP or keyCode == KEYCODE_SPACE then
      self:jump()
    end
  end

  local function onKeyReleased(keyCode, event)
    if keyCode == KEYCODE_LEFT and self.velocity.x < 0 then
      self.velocity.x = 0
    elseif keyCode == KEYCODE_RIGHT and self.velocity.x > 0 then
      self.velocity.x = 0
    end
  end

  local listener = cc.EventListenerKeyboard:create()
  listener:registerScriptHandler(onKeyPressed, cc.Handler.EVENT_KEYBOARD_PRESSED)
  listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED)

  local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
  eventDispatcher:addEventListenerWithSceneGraphPriority(listener, scene)
end

function Mario:jump()
end

function Mario:update(dt)
end

function Mario:updateAnimations()
end

function Mario:playAnimation(animName)
end

return Mario
