local Module = {}

function Module:GetToken()
  return tostring(game.Players.LocalPlayer.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(10, 15)
end
return Module
