local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local jumpHeight = 50 -- Высота прыжка
local isJumping = false

-- Функция для выполнения прыжка
local function onJumpRequest()
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

-- Подписываемся на событие прыжка
userInputService.JumpRequest:Connect(onJumpRequest)
