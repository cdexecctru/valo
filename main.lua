print("--- ULTRA HIZLI MOD YUKLENDI! ---")
warn("DIKKAT: Asiri hizdan oyun donabilir veya kick yiyebilirsin.")

local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local pressing = false

-- Ultra Hizli Dongu
local function ultraClick()
    task.spawn(function()
        while pressing do
            -- Tek bir dongude 10 kez bas-cek yapiyoruz (CPU'yu zorlar ama cok hizlidir)
            for i = 1, 500 do
                VIM:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                VIM:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            end
            -- Roblox'un cokmemesi icin en kucuk nefes alma payi
            game:GetService("RunService").Stepped:Wait()
        end
    end)
end

UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.L then
        pressing = not pressing
        if pressing then
            print("calistim! -> DEHSET MODU AKTIF")
            ultraClick()
        else
            print("DURDURULDU!")
        end
    end
end)
