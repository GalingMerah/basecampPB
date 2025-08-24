-- Auto Hop Script (every 5 minutes, finds another server instead of same one)

local rejoinInterval = 100 -- 5 minutes (in seconds)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local PlaceId = game.PlaceId

-- GUI Setup (fixed position)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local timerFrame = Instance.new("Frame")
timerFrame.Size = UDim2.new(0, 200, 0, 50)
timerFrame.Position = UDim2.new(1, -210, 1, -60) -- fixed bottom-right
timerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
timerFrame.BackgroundTransparency = 0.4
timerFrame.Parent = screenGui

local timerFrameCorner = Instance.new("UICorner")
timerFrameCorner.CornerRadius = UDim.new(0, 12)
timerFrameCorner.Parent = timerFrame

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.Text = "Waiting..."
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerLabel.BackgroundTransparency = 1
timerLabel.TextSize = 18
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = timerFrame

-- Format seconds into HH:MM:SS
local function formatTime(totalSeconds)
    local hours = math.floor(totalSeconds / 3600)
    local minutes = math.floor((totalSeconds % 3600) / 60)
    local seconds = math.floor(totalSeconds % 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Find another public server
local function findAnotherServer()
    local success, result = pcall(function()
        return game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    end)

    if success then
        local decoded = HttpService:JSONDecode(result)
        for _, server in ipairs(decoded.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                return server.id
            end
        end
    end
    return nil
end

-- Auto hop loop
local function autoHopLoop()
    while true do
        local timeLeft = rejoinInterval
        while timeLeft > 0 do
            timerLabel.Text = "Hopping in: " .. formatTime(timeLeft)
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        timerLabel.Text = "Finding new server..."

        local serverId = findAnotherServer()
        if serverId then
            TeleportService:TeleportToPlaceInstance(PlaceId, serverId, player)
        else
            -- fallback to normal rejoin
            TeleportService:Teleport(PlaceId, player)
        end
    end
end

task.spawn(autoHopLoop)
