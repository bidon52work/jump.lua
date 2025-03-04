local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local jumpHeight = 50 -- Высота прыжка
local isJumping = false
local jumpEnabled = false -- Переменная для отслеживания состояния прыжка

-- Функция для выполнения прыжка
local function onJumpRequest()
    if jumpEnabled then
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if not isJumping then
            isJumping = true
            humanoid.JumpPower = jumpHeight
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.1) -- Небольшая задержка, чтобы дать возможность совершить прыжок
            isJumping = false
        end
    end
end

-- Функция для переключения состояния бесконечного прыжка
local function toggleJump()
    jumpEnabled = not jumpEnabled -- Переключаем состояние
    if jumpEnabled then
        print("Бесконечный прыжок включен.")
    else
        print("Бесконечный прыжок выключен.")
    end
end

-- Подписываемся на событие прыжка
userInputService.JumpRequest:Connect(onJumpRequest)

-- Подписываемся на событие нажатия клавиши
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard and not gameProcessed then
        if input.KeyCode == Enum.KeyCode.J then -- Используйте "J" для включения/выключения прыжка
            toggleJump()
        end
    end
end)
