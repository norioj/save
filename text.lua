local game = game

local function selectMarineTeam()
    repeat wait() until game:IsLoaded()

    repeat wait()
        if game.Players.LocalPlayer.Team == nil and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Visible == true then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Visible == true then
                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.BackgroundTransparency = 1
                wait(.5)
                game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, true, game, 1)
                game:service'VirtualInputManager':SendMouseButtonEvent(500,500, 0, false, game, 1)
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() and game.Players.LocalPlayer.Team.Name == "Marines"
end

local function loadMyScript()
    local success, script = pcall(function()
        return loadstring(game:HttpGet("https://pastebin.com/raw/1111"))()
    end)
    
    if success then
        script()
    else
        warn("Error loading script:", script)
    end
end

local function main()
    local selectMarineTeamCoroutine = coroutine.wrap(selectMarineTeam)
    selectMarineTeamCoroutine()

    coroutine.yield()

    local loadMyScriptCoroutine = coroutine.wrap(loadMyScript)
    loadMyScriptCoroutine()
end

coroutine.wrap(main)()
