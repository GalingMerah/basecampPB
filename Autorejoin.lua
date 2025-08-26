-- Auto Rejoin Script (every 5 minutes with countdown display, fixed position)
-- Runs automatically, no buttons, fixed at bottom-right

local rejoinInterval = 90 -- 0,5 minutes (in seconds)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer

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

-- Auto rejoin loop
local function autoRejoinLoop()
    while true do
        local timeLeft = rejoinInterval
        while timeLeft > 0 do
            timerLabel.Text = "Rejoining in: " .. formatTime(timeLeft)
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        timerLabel.Text = "Rejoining..."
        TeleportService:Teleport(game.PlaceId, player)
        -- After teleport, script restarts automatically in new session
    end
end

task.spawn(autoRejoinLoop)
