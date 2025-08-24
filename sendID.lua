local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Ngrok / server Python URL
local url = "https://dbf533b67826.ngrok-free.app/update_job"

-- === GUI Debug Kecil ===
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local debugFrame = Instance.new("Frame")
debugFrame.Size = UDim2.new(0, 250, 0, 100)
debugFrame.Position = UDim2.new(0, 10, 0, 10) -- pojok kiri atas
debugFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
debugFrame.BackgroundTransparency = 0.4
debugFrame.Parent = screenGui

local debugLabel = Instance.new("TextLabel")
debugLabel.Size = UDim2.new(1, -10, 1, -10)
debugLabel.Position = UDim2.new(0, 5, 0, 5)
debugLabel.BackgroundTransparency = 1
debugLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
debugLabel.TextSize = 14
debugLabel.TextWrapped = true
debugLabel.TextXAlignment = Enum.TextXAlignment.Left
debugLabel.TextYAlignment = Enum.TextYAlignment.Top
debugLabel.Parent = debugFrame

-- Fungsi update debug GUI
local function updateDebug(text)
    debugLabel.Text = text
    print("[DEBUG]", text)
end

-- Fungsi kirim JobId ke Python
local function sendJobUpdate()
    local data = {
        key = "bot1",
        place_id = game.PlaceId,
        job_id = game.JobId
    }

    local jsonData = HttpService:JSONEncode(data)
    updateDebug("🔄 Mengirim data ke Python...\n" .. jsonData)

    local success, err = pcall(function()
        local response = HttpService:PostAsync(url, jsonData, Enum.HttpContentType.ApplicationJson)
        updateDebug("✅ Terkirim!\nResponse: " .. response)
    end)

    if not success then
        updateDebug("❌ Gagal kirim:\n" .. tostring(err))
    end
end

-- Kirim saat script pertama kali jalan
sendJobUpdate()

-- Contoh: otomatis kirim setiap 5 menit (opsional)
spawn(function()
    while true do
        task.wait(300) -- 5 menit
        sendJobUpdate()
    end
end)
