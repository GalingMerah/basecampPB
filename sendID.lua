local HttpService = game:GetService("HttpService")

local url = "https://dbf533b67826.ngrok-free.app/update_job"  -- ganti dengan URL Ngrok kamu

local data = {
    key = "bot1",           -- identifier unik
    place_id = game.PlaceId,
    job_id = game.JobId
}

local jsonData = HttpService:JSONEncode(data)

-- kirim POST ke Python
local success, err = pcall(function()
    HttpService:PostAsync(url, jsonData, Enum.HttpContentType.ApplicationJson)
end)

if success then
    print("✅ Job update sent")
else
    warn("❌ Failed to send job update:", err)
end
