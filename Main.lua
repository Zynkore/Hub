local PlaceId = game.PlaceId
local branch = "main"
local BaseUrl = "https://raw.githubusercontent.com/Zynkore/Hub/refs/heads/" .. branch .. "/Games/"
for _, table in pairs({
    {
      Id = {
        85211729168715 = "Sea1.luau" -- GameId, game url
      },
      url = "Blox%20fruits/"
    }
}) do
  if typeof(table.Id) == "table" then
    for GameId, Path in pairs(table.Id) do
      if PlaceId == tonumber(GameId) then
        loadstring(game:HttpGet(`{BaseUrl}{table.url}{Path}`))()
        return
      end
    end
  elseif typeof(table.Id) == "number" then
    if PlaceId == tonumber(table.Id) then
      loadstring(game:HttpGet(`{BaseUrl}{table.url}`))()
      return
    end
  end
end
