-- Auto Rejoin & Random Server Hop Script
-- Setiap interval akan pindah ke salah satu server dari list (acak)

local rejoinInterval = 40 -- detik (1,5 menit)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

-- Daftar server (instanceId)
local serverList = {
    "311ebf72-a267-48ae-b8dd-c3e46c1163f0","02f657ea-fe93-4915-9d56-8f028889e6c0","39bcb3d3-33db-477f-8d00-ce6ecf663d89","b0e39cc6-0ddc-44c8-bcb8-a73c6a80a542","b4062fbb-4aff-40f6-a498-84a0964966cc","9414bd02-06db-443a-bd3b-0576f235473c","0ed52d55-f0d6-48a2-a3fb-c709169aee76","ba0f96b5-eb61-4829-a9e0-e0609f24470f","780dbf5d-2cf4-4201-8bb1-7b50fa63c609","c31a439c-7221-46cf-905d-435c136ee1cc","fa28b75d-15f6-444f-a54d-40de87f75134","dfd255f3-bc76-464e-b3bf-f0f5c6f7208d","89b50a83-e944-41af-8456-18babab25302","5dafeaf1-6bbe-4c8d-8617-e95b729ecaa5","e5bf87a8-e10f-442a-a543-8747ae43a911","7c61e85f-c0c6-4461-b27f-f28f9fb2e985","287e8899-10b2-4d07-8d72-3f9486e79f20","e887e1d3-5e58-4ad7-9e21-d9a6dd36318a","ade27369-1bdb-4047-90d5-1d0d0ae59f99","56aeef16-c17c-409e-992d-aa124dd07043","5a5d3632-df6f-45d9-828b-dcca5ae92c7f","9f5e8a30-ce35-488f-ac85-2a7ca062776c","8146cdd7-8636-4ee8-bbc3-3947d055de0a","3f6636df-11f4-484a-9bd4-2788fade0d7d","e6617bb3-dd00-4cfb-9809-7097b2837355","02d5f61c-8967-4e66-894f-487f0e8d7c4f","1df26552-ee43-48af-9a66-226f1615dc96","01cc733f-d00c-41be-abe5-7221b4862478","bca59b9e-a87a-452e-a613-7500283d167c","620698f7-628b-48d4-b847-8e4db3a7ea32","3be7298d-8c48-48e7-8a5f-beb1de63078c","aa120d06-d1c4-4d34-9a71-015ad738fbd3","9b0a6e2d-84b1-4693-9b23-dc7c9ea182c5","beac6149-2d35-4226-a6ef-e8702013efcc","8197827e-2680-421c-baaf-ae874bb9e31b","aa36a610-1e7a-428c-a12f-71a8651d6b55","f4837159-c13a-4de8-9a18-bfeef2f6dad0","5c14c3a6-98ac-4c34-b828-c4de3a411ee8","50700f6a-4a6c-4063-b9e6-624f3ebd1c22","1ed8cedf-e707-4a61-99db-5059a06ed6f0","fe553607-94c0-45bd-96ce-fc73b74b5c42","69002e7e-c4c0-43e4-9f6b-4a7241cc8ae4","705aec61-1a30-4553-9e04-dc47eda9c798","84a64bba-6f95-4d8d-8da5-b9be5cf426da","fc712167-a0d1-41d6-9725-f9debe7435c2","dd07d3c0-2a3b-4fd8-be17-edf8e3adb673","3a765539-37c9-4fcf-9797-e7fa55e7c549","57e5db76-130e-438e-97ca-220037c40af0","c3cf3eff-1f5a-48e3-9bb7-73bf9266e64a","9c97aa70-7bc0-41de-8fa7-0b1829929638","e88d9a65-f160-4698-9064-fe7e606d7245","073edcdc-fb4f-448e-b67f-0af640cb3997","323bb059-4da0-4b29-8f1b-2cc75d0f4599","7af0b833-a2a4-4674-9270-09ca474e45c5","c8a46c79-4dbb-4e1e-bfe3-88f094fa4d68","53ba4e6e-c9e8-4e22-9f23-db8b81ee1bcf","85321f94-83a4-4a55-af9e-fd76007f0255","27fb96bf-9a2e-4f15-89f2-a4049c8f4699","c3af73a7-dced-4706-8d78-a397590ffaf4","bbf7e15f-25dd-4b50-a6f8-60ba50c93982","ad35ca18-0045-4a8c-a4ad-ec9758a2db29","794ea2e1-1a6a-4381-a200-bc1bcfba36c5","9fb3e85b-909f-44db-9abe-0e088ae67db0","076a1822-f823-47fa-897f-dceda5400c1e","051ff23b-6267-41d1-a356-844cbe10f6a8","e984c1e9-a161-4c74-b488-03cc4d2e9278","5c0d431e-f887-48fd-a393-7a6c1c7c7b66","26b5d93c-7bdd-48ff-95ab-1bdf3c55c40e","c8368a41-edfa-4789-98b8-3003217f3bc1","cb767d10-067e-44db-a4fa-271f261c8c13","f3dd5024-cdf0-486e-a81b-b990195300e4","f24137cd-39fb-49fb-bfa6-1643d3ceacb6","bfc4bd02-ad6c-4c54-b591-0aa50683488b","8bf835af-1035-44f2-8e00-823f94ff3ba4","b37c0db4-3650-4680-af3f-d32bb19d3e87","f186ec58-c946-4372-aa5f-41ecf07229be","b49fcb61-6869-4314-8046-a07f672d1e8c","03d4c250-6a15-4332-bbe2-4b05801a7175","605c565a-2976-4507-9163-29b6ad3c0b83","0acc67c0-29ee-4b2a-9fd1-577ca801913f","4d2d50fe-af1b-4cf4-ac8a-0b2ffbd02583","abc9ed38-4a6e-4174-8a61-2f74f36093a6","5700cbbc-1311-491c-ac8e-14c247443821","99535a3a-af0c-43d7-86cf-c523427c5fca","7c1f9f00-85c1-4ced-8a9e-656cb00129ce","2031fa2d-bed9-4136-8b7a-01b97555445d","005ebad5-a2b1-48ee-b0d8-53ebb84384ab","38d4136f-3b66-4b07-8055-69983c9550ba","10cb3713-6a04-4bc4-b994-83077275e3b6","f2127783-9edc-4c7d-8256-65d52c7e6e96","822510be-7b37-4594-9c3e-fb5a3981b54e","b5979bb3-526e-4145-87ad-ff840e8f8fb9","b3844bc4-cd14-40cd-8522-14a776167a73","eca38ed6-827d-4559-924b-1db3ed0e9998","c555ce15-8d7e-416e-b51d-13bb2dbd6586","6a794ab9-0098-4efe-a80d-fd2798264917","2457f152-37ee-4ed6-86d7-b5c77382a206","60eb7013-1f00-46af-87fd-82db4acf71a0","378b90a3-3a15-4bbb-bbfc-405e59bb40b8","c663bc5c-9af4-46dd-a7e0-467fb290f4dc","f21ec9b1-09d7-4af8-bf1b-3e67d73a05b5","c5b4e830-283a-4329-8630-91aba584fe5a","f5b016d1-5033-4060-9608-75e52e711c3f","f165ece1-680b-49f2-8540-8bf600a11547","9fc190c1-74dd-4ec7-97ce-a1e2f1a4bbc7","4665e98e-1a31-4646-96df-77ba273984b5","833aa4ae-a90a-4539-bbe5-3363d446736e","849c76ea-edb3-4b33-9f73-b9ce4ff182a5","5b10dedf-6dd7-4246-9f85-fe0d1eca64a4","9a805d97-88e2-4ffb-adef-6f39de3465d6","f3c82b7f-6806-4cf6-8903-32f2aec61028","af7e5a3e-04fe-4826-8dbd-551d4bcaf7a4","ee93be6c-563c-4ec2-abc4-6c5c0be5480c","e04d1332-4e96-4c6d-9b84-10decae5d2ad","6cbc2649-3414-4797-bcfd-502360ad0527","f1eae4d6-0048-4584-8803-10621cdfcd9e","5026c2b6-bed2-4e46-afda-987724fab045","9b1af89a-10e8-4b42-a4db-7de7b475c737","2fa84b09-9ab9-44c0-87a4-bb560136a4be","2bb982f7-29f1-4f29-9fce-c4c3ed0157f4","c3a9297f-c759-4a8f-ae8c-de9b0a0b60ab","3ecfb4b6-9422-472c-a963-d0c9f51d32d4","ff680a41-957c-40d9-8a13-e85f2d09e1bf","a083bee7-bc73-4667-9757-574f038795e5","873ba220-518b-4cee-9f33-edaaab747ace","2e2d4609-6fde-45e1-b610-e0eac0fc8230","0d9f6744-6410-4408-a347-0fdbb2e63d13","c21e4c25-2d22-4a58-ad6e-76f2640e689e","1ac58737-e05c-4ed6-9fe8-174baab8f833","b114ef1a-2aeb-42e1-a510-af2b81a90916","2a3d9c12-f4c7-4d5b-a3ab-89773b0668d3","8153c65a-7055-45b8-8174-eaf72d92edf6","4ed29923-30b9-418f-b9ee-ed2b1a20f259","b1255453-4510-4bbb-869d-fc032368f3c8","287dc046-ae4a-469e-83d7-dca7bb625fa2","2a74a48a-1ca3-47ef-8b64-26b9fd399ad8","4f0389d9-2a25-420b-9eb9-4a6c7018f77f","e2e8378b-ec53-4fce-8cf3-b02d3bc86cf7","f2204867-af3e-4c10-9442-eea1dc657c16","90406e61-0b58-4845-8b6e-237cb1c45117","2cfa5ce9-0b00-4192-85c2-84666534008c","0951ff8a-a07b-48bd-b8b0-b295a590ee15","05f45d42-112e-4b88-91ab-75bc04bf16ab","16f7f22d-bc4d-4962-8961-d34fc7ebb64b","9d728e64-bf48-44f2-af63-a712d80c896e","341e97d6-b6da-471a-8bfd-0d3cd25d084b","5f1a0b67-a4b7-4180-8c3c-a6bba3aa5b40","e30ba019-adec-4e48-8247-6d4c5a50f5a5","81e7d0c3-07dc-45f3-ac18-7afbe41bce3e","9a73190c-67cb-4763-939e-df36f0b74aca","808dd2e4-3624-4d6e-8725-28d989832810","7b5979de-03b6-4bfc-bb1b-b148f8a93580","a3b39b22-2c1b-40cf-8f21-e0f9f1cbf8d3","bda75402-f6aa-430a-a26a-9aa47e6bea22","e7b1ba87-fda0-493e-8279-5ab5bee27717","32783a91-81da-4f4e-a547-8dde706302f4"
}

-- GUI Setup (fixed position)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local timerFrame = Instance.new("Frame")
timerFrame.Size = UDim2.new(0, 200, 0, 50)
timerFrame.Position = UDim2.new(1, -210, 1, -60)
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

-- Format detik ke HH:MM:SS
local function formatTime(totalSeconds)
    local hours = math.floor(totalSeconds / 3600)
    local minutes = math.floor((totalSeconds % 3600) / 60)
    local seconds = math.floor(totalSeconds % 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Ambil random serverId dari list
local function getRandomServer()
    local index = math.random(1, #serverList)
    return serverList[index]
end

-- Auto hop loop
local function autoRejoinLoop()
    while true do
        local timeLeft = rejoinInterval
        while timeLeft > 0 do
            timerLabel.Text = "Hopping in: " .. formatTime(timeLeft)
            task.wait(1)
            timeLeft = timeLeft - 1
        end
        timerLabel.Text = "Teleporting..."
        local randomServer = getRandomServer()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer, player)
        -- Setelah teleport, script akan auto jalan lagi
    end
end

task.spawn(autoRejoinLoop)
