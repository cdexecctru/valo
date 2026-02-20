-- F_Clicker.lua
-- Bu script 'L' tusu ile F basimini baslatir/durdurur.

print("--- SISTEM YUKLENDI! ---")
print("Komut: 'L' tusuna basarak baslat/durdur.")

local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local pressing = false

-- Ana Dongu Fonksiyonu
local function startClicking()
    task.spawn(function()
        while pressing do
            -- F Tusuna Bas ve Bırak
            VIM:SendKeyEvent(true, Enum.KeyCode.F, false, game)
            VIM:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            
            -- Saniyede 10k hedefi icin en dusuk bekleme
            -- Oyunun FPS limitine gore en yuksek hizi verir.
            task.wait() 
        end
    end)
end

-- Tus Dinleyici
UIS.InputBegan:Connect(function(input, processed)
    -- Chat (sohbet) aciksa calismasin
    if processed then return end
    
    if input.KeyCode == Enum.KeyCode.L then
        pressing = not pressing
        
        if pressing then
            print("calistim! -> F basilıyor...")
            startClicking()
        else
            print("DURDURULDU!")
        end
    end
end)

-- Scriptin yuklendigine dair son bir teyit
warn("F Clicker aktif, 'L' tusuna basman bekleniyor.")
