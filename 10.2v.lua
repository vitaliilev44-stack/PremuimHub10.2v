-- ==========================================
--  PREMIUMHUB v10.1  (принудительная проверка ключа)
--  Ключи: 0ka4MFlC (вечный)
--  Второй ключ: 0003e9eae51e58e9488af788f3626915c9e4223c35533476a9f3f42ce9ba6c5156d3f05afaa9e73885b6dc591779a9bfdd8828af2c77fcfe8c9e559a322f6c87
--  Окно ввода появляется при каждом запуске скрипта.
-- ==========================================

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera

-- ==========================================
--  ВАЛИДНЫЕ КЛЮЧИ (явно указаны)
-- ==========================================
local VALID_KEYS = {
    "0ka4MFlC",
    "0003e9eae51e58e9488af788f3626915c9e4223c35533476a9f3f42ce9ba6c5156d3f05afaa9e73885b6dc591779a9bfdd8828af2c77fcfe8c9e559a322f6c87"
}

-- ==========================================
--  ФУНКЦИЯ ПРОВЕРКИ КЛЮЧА
-- ==========================================
local function checkKey(inputKey)
    for _, valid in ipairs(VALID_KEYS) do
        if inputKey == valid then
            return true
        end
    end
    return false
end

-- ==========================================
--  СОЗДАНИЕ ОКНА ВВОДА КЛЮЧА
-- ==========================================
local function createKeyWindow()
    local guiKey = Instance.new("ScreenGui")
    guiKey.Name = "KeyVerification"
    guiKey.Parent = player:WaitForChild("PlayerGui")
    guiKey.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 380, 0, 180)
    frame.Position = UDim2.new(0.5, -190, 0.5, -90)
    frame.BackgroundColor3 = Color3.fromRGB(45, 20, 30)
    frame.BorderSizePixel = 0
    frame.Parent = guiKey
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 12)
    corners.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "Введите ключ активации"
    title.TextColor3 = Color3.fromRGB(255, 240, 245)
    title.TextSize = 20
    title.Font = Enum.Font.GothamBold
    title.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0, 36)
    textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(60, 25, 40)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Text = ""
    textBox.PlaceholderText = "Введите ключ..."
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 16
    textBox.BorderSizePixel = 0
    textBox.Parent = frame
    local tbCorners = Instance.new("UICorner")
    tbCorners.CornerRadius = UDim.new(0, 6)
    tbCorners.Parent = textBox

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.4, 0, 0, 36)
    button.Position = UDim2.new(0.3, 0, 0.65, 0)
    button.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    button.Text = "Подтвердить"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Font = Enum.Font.Gotham
    button.Parent = frame
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 6)
    btnCorners.Parent = button

    local errorLabel = Instance.new("TextLabel")
    errorLabel.Size = UDim2.new(0.8, 0, 0, 24)
    errorLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
    errorLabel.BackgroundTransparency = 1
    errorLabel.Text = ""
    errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    errorLabel.TextSize = 14
    errorLabel.Font = Enum.Font.Gotham
    errorLabel.Visible = false
    errorLabel.Parent = frame

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            button:Activate()
        end
    end)

    button.MouseButton1Click:Connect(function()
        local inputKey = textBox.Text
        if checkKey(inputKey) then
            guiKey:Destroy()
            createMainMenu()
        else
            errorLabel.Text = "Неверный ключ! Попробуйте снова."
            errorLabel.Visible = true
            textBox.Text = ""
        end
    end)
end

-- ==========================================
--  ОСНОВНОЕ МЕНЮ (ВСЕ ФУНКЦИИ)
-- ==========================================
function createMainMenu()
    -- ==========================================
    --  ЦВЕТОВАЯ СХЕМА (роза)
    -- ==========================================
    local COLORS = {
        Background = Color3.fromRGB(45, 20, 30),
        Frame = Color3.fromRGB(60, 25, 40),
        Accent = Color3.fromRGB(255, 105, 180),
        AccentDark = Color3.fromRGB(200, 50, 120),
        Text = Color3.fromRGB(255, 240, 245),
        TextDim = Color3.fromRGB(210, 180, 190),
        Shadow = Color3.fromRGB(20, 10, 15),
    }

    -- ==========================================
    --  ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
    -- ==========================================
    local currentWS = 16
    local currentJP = 50

    -- ==========================================
    --  СОЗДАНИЕ GUI МЕНЮ
    -- ==========================================
    local gui = Instance.new("ScreenGui")
    gui.Name = "PremiumHub"
    gui.Parent = player:WaitForChild("PlayerGui")
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 440, 0, 420)
    frame.Position = UDim2.new(0.5, -220, 0.5, -210)
    frame.BackgroundColor3 = COLORS.Frame
    frame.BackgroundTransparency = 0.08
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = gui

    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 16)
    corners.Parent = frame

    local shadow = Instance.new("Frame")
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundColor3 = COLORS.Shadow
    shadow.BackgroundTransparency = 0.7
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 0
    shadow.Parent = frame
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(0, 20)
    shadowCorner.Parent = shadow

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "PREMIUMHUB"
    title.TextColor3 = COLORS.Text
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -38, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = COLORS.TextDim
    closeBtn.TextSize = 20
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function()
        frame.Visible = false
    end)

    -- ==========================================
    --  ВКЛАДКИ
    -- ==========================================
    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(1, 0, 0, 36)
    tabContainer.Position = UDim2.new(0, 0, 0, 42)
    tabContainer.BackgroundColor3 = COLORS.Background
    tabContainer.BackgroundTransparency = 0.3
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = frame

    local tabs = {"Основное", "Aimbot", "Визуал"}
    local tabButtons = {}
    local contentFrames = {}

    local function createTabs()
        local tabWidth = 1 / #tabs
        for i, name in ipairs(tabs) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(tabWidth, -2, 1, -4)
            btn.Position = UDim2.new((i-1) * tabWidth + 0.01, 0, 0, 2)
            btn.BackgroundColor3 = COLORS.AccentDark
            btn.BackgroundTransparency = 0.3
            btn.Text = name
            btn.TextColor3 = COLORS.Text
            btn.TextSize = 16
            btn.Font = Enum.Font.Gotham
            btn.Parent = tabContainer
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn
            tabButtons[i] = btn

            local content = Instance.new("Frame")
            content.Size = UDim2.new(1, 0, 1, -80)
            content.Position = UDim2.new(0, 0, 0, 80)
            content.BackgroundTransparency = 1
            content.Visible = (i == 1)
            content.Parent = frame
            contentFrames[i] = content

            btn.MouseButton1Click:Connect(function()
                for j, cf in ipairs(contentFrames) do
                    cf.Visible = (j == i)
                    tabButtons[j].BackgroundColor3 = (j == i) and COLORS.Accent or COLORS.AccentDark
                    tabButtons[j].BackgroundTransparency = (j == i) and 0.1 or 0.3
                end
            end)
        end
        tabButtons[1].BackgroundColor3 = COLORS.Accent
        tabButtons[1].BackgroundTransparency = 0.1
    end
    createTabs()

    local mainContent = contentFrames[1]
    local aimbotContent = contentFrames[2]
    local visualContent = contentFrames[3]

    -- ==========================================
    --  ФУНКЦИЯ СОЗДАНИЯ СЛАЙДЕРА
    -- ==========================================
    local function createSlider(parent, y, labelText, minVal, maxVal, initialVal, applyFunc)
        local sFrame = Instance.new("Frame")
        sFrame.Size = UDim2.new(0.9, 0, 0, 50)
        sFrame.Position = UDim2.new(0.05, 0, y, 0)
        sFrame.BackgroundTransparency = 1
        sFrame.Parent = parent

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.6, 0, 0, 22)
        label.Position = UDim2.new(0, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.TextColor3 = COLORS.TextDim
        label.TextSize = 15
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sFrame

        local valueDisplay = Instance.new("TextLabel")
        valueDisplay.Size = UDim2.new(0.35, 0, 0, 22)
        valueDisplay.Position = UDim2.new(0.65, 0, 0, 0)
        valueDisplay.BackgroundTransparency = 1
        valueDisplay.Text = tostring(math.round(initialVal))
        valueDisplay.TextColor3 = COLORS.Text
        valueDisplay.TextSize = 18
        valueDisplay.Font = Enum.Font.GothamBold
        valueDisplay.TextXAlignment = Enum.TextXAlignment.Right
        valueDisplay.Parent = sFrame

        local slider = Instance.new("Frame")
        slider.Size = UDim2.new(1, 0, 0, 22)
        slider.Position = UDim2.new(0, 0, 0, 28)
        slider.BackgroundColor3 = COLORS.Background
        slider.BackgroundTransparency = 0.3
        slider.BorderSizePixel = 0
        slider.Parent = sFrame
        local sliderCorner = Instance.new("UICorner")
        sliderCorner.CornerRadius = UDim.new(0, 12)
        sliderCorner.Parent = slider

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new(0, 0, 1, 0)
        fill.BackgroundColor3 = COLORS.Accent
        fill.BorderSizePixel = 0
        fill.Parent = slider
        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(0, 12)
        fillCorner.Parent = fill

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 20, 0, 20)
        knob.Position = UDim2.new(0, -10, 0.5, -10)
        knob.BackgroundColor3 = COLORS.Text
        knob.BorderSizePixel = 2
        knob.BorderColor3 = COLORS.Accent
        knob.Parent = slider
        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = knob

        local dragging = false

        local function update(value)
            value = math.clamp(value, minVal, maxVal)
            local fraction = (value - minVal) / (maxVal - minVal)
            fill.Size = UDim2.new(fraction, 0, 1, 0)
            knob.Position = UDim2.new(fraction, -10, 0.5, -10)
            valueDisplay.Text = tostring(math.round(value))
            applyFunc(value)
        end

        update(initialVal)

        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
        end)
        slider.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)
        userInput.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = input.Position.X
                local absPos = slider.AbsolutePosition.X
                local width = slider.AbsoluteSize.X
                local rel = math.clamp((mousePos - absPos) / width, 0, 1)
                update(minVal + rel * (maxVal - minVal))
            end
        end)

        return { update = update }
    end

    -- ==========================================
    --  ПРИМЕНЕНИЕ WALKSPEED И JUMPPOWER
    -- ==========================================
    local function applyWalkSpeed(value)
        currentWS = math.clamp(value, 16, 40)
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = currentWS
            end
        end
    end

    local function applyJumpPower(value)
        currentJP = math.clamp(value, 0, 75)
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.JumpPower = currentJP
            end
        end
    end

    -- ==========================================
    --  СОЗДАНИЕ СЛАЙДЕРОВ
    -- ==========================================
    createSlider(mainContent, 0.05, "WalkSpeed", 16, 40, currentWS, applyWalkSpeed)
    createSlider(mainContent, 0.25, "JumpPower", 0, 75, currentJP, applyJumpPower)

    -- ==========================================
    --  ВКЛАДКА "Aimbot"
    -- ==========================================
    local aimBtnFrame = Instance.new("Frame")
    aimBtnFrame.Size = UDim2.new(0.9, 0, 0, 40)
    aimBtnFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
    aimBtnFrame.BackgroundTransparency = 1
    aimBtnFrame.Parent = aimbotContent

    local aimbotBtn = Instance.new("TextButton")
    aimbotBtn.Size = UDim2.new(0.5, 0, 1, 0)
    aimbotBtn.Position = UDim2.new(0.25, 0, 0, 0)
    aimbotBtn.BackgroundColor3 = COLORS.AccentDark
    aimbotBtn.BackgroundTransparency = 0.3
    aimbotBtn.Text = "AIMBOT [ВЫКЛ]"
    aimbotBtn.TextColor3 = COLORS.Text
    aimbotBtn.TextSize = 16
    aimbotBtn.Font = Enum.Font.Gotham
    aimbotBtn.Parent = aimBtnFrame
    local aimBtnCorner = Instance.new("UICorner")
    aimBtnCorner.CornerRadius = UDim.new(0, 8)
    aimBtnCorner.Parent = aimbotBtn

    local aimbotEnabled = false
    local aimConnection = nil

    local function getClosestPlayer()
        local char = player.Character
        if not char then return nil end
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return nil end
        local closest = nil
        local closestDist = math.huge
        for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar then
                    local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
                    if otherRoot then
                        local dist = (rootPart.Position - otherRoot.Position).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closest = otherRoot
                        end
                    end
                end
            end
        end
        return closest
    end

    local function toggleAimbot()
        aimbotEnabled = not aimbotEnabled
        aimbotBtn.Text = aimbotEnabled and "AIMBOT [ВКЛ]" or "AIMBOT [ВЫКЛ]"
        aimbotBtn.BackgroundColor3 = aimbotEnabled and COLORS.Accent or COLORS.AccentDark
        aimbotBtn.BackgroundTransparency = aimbotEnabled and 0.1 or 0.3
        if aimbotEnabled then
            aimConnection = runService.Heartbeat:Connect(function()
                local target = getClosestPlayer()
                if target and player.Character then
                    local cam = workspace.CurrentCamera
                    local targetPos = target.Position
                    local head = target.Parent:FindFirstChild("Head")
                    if head then targetPos = head.Position end
                    cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
                end
            end)
        else
            if aimConnection then aimConnection:Disconnect(); aimConnection = nil end
        end
    end
    aimbotBtn.MouseButton1Click:Connect(toggleAimbot)

    -- ==========================================
    --  ВКЛАДКА "Визуал" (ESP)
    -- ==========================================
    local espFrame = Instance.new("Frame")
    espFrame.Size = UDim2.new(0.9, 0, 0, 40)
    espFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
    espFrame.BackgroundTransparency = 1
    espFrame.Parent = visualContent

    local espLabel = Instance.new("TextLabel")
    espLabel.Size = UDim2.new(0.4, 0, 0, 30)
    espLabel.Position = UDim2.new(0, 0, 0, 5)
    espLabel.BackgroundTransparency = 1
    espLabel.Text = "ESP (рамки)"
    espLabel.TextColor3 = COLORS.TextDim
    espLabel.TextSize = 16
    espLabel.Font = Enum.Font.Gotham
    espLabel.TextXAlignment = Enum.TextXAlignment.Left
    espLabel.Parent = espFrame

    local espToggle = Instance.new("TextButton")
    espToggle.Size = UDim2.new(0.15, 0, 0, 30)
    espToggle.Position = UDim2.new(0.75, 0, 0, 5)
    espToggle.BackgroundColor3 = COLORS.AccentDark
    espToggle.BackgroundTransparency = 0.3
    espToggle.Text = "ВКЛ"
    espToggle.TextColor3 = COLORS.Text
    espToggle.TextSize = 14
    espToggle.Font = Enum.Font.Gotham
    espToggle.Parent = espFrame
    local espToggleCorner = Instance.new("UICorner")
    espToggleCorner.CornerRadius = UDim.new(0, 6)
    espToggleCorner.Parent = espToggle

    local espEnabled = false
    local espBoxes = {}

    local function updateESP()
        for _, box in pairs(espBoxes) do box:Destroy() end
        espBoxes = {}
        if not espEnabled then return end

        for _, otherPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
            if otherPlayer ~= player then
                local char = otherPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local box = Instance.new("Frame")
                    box.Size = UDim2.new(0, 0, 0, 0)
                    box.Position = UDim2.new(0, 0, 0, 0)
                    box.BackgroundTransparency = 0.7
                    box.BackgroundColor3 = COLORS.Accent
                    box.BorderSizePixel = 2
                    box.BorderColor3 = COLORS.Text
                    box.Visible = true
                    box.Parent = gui
                    espBoxes[otherPlayer] = box
                end
            end
        end
    end

    local function updateESPPositions()
        if not espEnabled then return end
        for otherPlayer, box in pairs(espBoxes) do
            local char = otherPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Head") then
                local root = char.HumanoidRootPart
                local head = char.Head
                local pos1, onScreen1 = camera:WorldToScreenPoint(root.Position - Vector3.new(0, 1, 0))
                local pos2, onScreen2 = camera:WorldToScreenPoint(head.Position + Vector3.new(0, 1, 0))
                if onScreen1 and onScreen2 then
                    local height = math.abs(pos2.Y - pos1.Y)
                    local width = height * 0.6
                    local centerX = (pos1.X + pos2.X) / 2
                    local centerY = (pos1.Y + pos2.Y) / 2
                    box.Position = UDim2.new(0, centerX - width/2, 0, centerY - height/2)
                    box.Size = UDim2.new(0, width, 0, height)
                    box.Visible = true
                else
                    box.Visible = false
                end
            else
                box.Visible = false
            end
        end
    end

    local espConnection = nil
    local function startESP()
        if espConnection then espConnection:Disconnect() end
        espConnection = runService.Heartbeat:Connect(updateESPPositions)
    end

    espToggle.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        espToggle.Text = espEnabled and "ВЫКЛ" or "ВКЛ"
        espToggle.BackgroundColor3 = espEnabled and COLORS.Accent or COLORS.AccentDark
        espToggle.BackgroundTransparency = espEnabled and 0.1 or 0.3
        updateESP()
        if espEnabled then
            startESP()
        else
            if espConnection then espConnection:Disconnect(); espConnection = nil end
            for _, box in pairs(espBoxes) do box:Destroy() end
            espBoxes = {}
        end
    end)

    game:GetService("Players").PlayerAdded:Connect(updateESP)
    game:GetService("Players").PlayerRemoving:Connect(updateESP)

    -- ==========================================
    --  ОБХОД АНТИЧИТА (постоянное применение)
    -- ==========================================
    runService.Heartbeat:Connect(function()
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                if humanoid.WalkSpeed ~= currentWS then
                    humanoid.WalkSpeed = currentWS
                end
                if humanoid.JumpPower ~= currentJP then
                    humanoid.JumpPower = currentJP
                end
            end
        end
    end)

    -- ==========================================
    --  ПРИ РЕСПАВНЕ: ПОКАЗЫВАЕМ МЕНЮ И ПРИМЕНЯЕМ ПАРАМЕТРЫ
    -- ==========================================
    player.CharacterAdded:Connect(function(char)
        frame.Visible = true
        local humanoid = char:WaitForChild("Humanoid")
        humanoid.WalkSpeed = currentWS
        humanoid.JumpPower = currentJP
    end)

    -- ==========================================
    --  БИНДЫ
    -- ==========================================
    local BINDS = {
        TOGGLE_MENU = Enum.KeyCode.M,
        TOGGLE_AIMBOT = Enum.KeyCode.Q,
    }

    userInput.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        local key = input.KeyCode
        if key == BINDS.TOGGLE_MENU then
            frame.Visible = not frame.Visible
        end
        if key == BINDS.TOGGLE_AIMBOT then
            toggleAimbot()
        end
    end)

    -- ==========================================
    --  ОТОБРАЖЕНИЕ БИНДОВ
    -- ==========================================
    local bindsFrame = Instance.new("Frame")
    bindsFrame.Size = UDim2.new(0.9, 0, 0, 30)
    bindsFrame.Position = UDim2.new(0.05, 0, 0.92, 0)
    bindsFrame.BackgroundTransparency = 1
    bindsFrame.Parent = frame

    local bindsLabel = Instance.new("TextLabel")
    bindsLabel.Size = UDim2.new(1, 0, 1, 0)
    bindsLabel.BackgroundTransparency = 1
    bindsLabel.Text = "Бинды: M-меню, Q-Aimbot"
    bindsLabel.TextColor3 = COLORS.TextDim
    bindsLabel.TextSize = 13
    bindsLabel.Font = Enum.Font.Gotham
    bindsLabel.TextXAlignment = Enum.TextXAlignment.Center
    bindsLabel.Parent = bindsFrame

    -- Эффекты наведения
    aimbotBtn.MouseEnter:Connect(function()
        aimbotBtn.BackgroundColor3 = aimbotEnabled and COLORS.Accent or COLORS.Text
        aimbotBtn.BackgroundTransparency = aimbotEnabled and 0.1 or 0.2
    end)
    aimbotBtn.MouseLeave:Connect(function()
        aimbotBtn.BackgroundColor3 = aimbotEnabled and COLORS.Accent or COLORS.AccentDark
        aimbotBtn.BackgroundTransparency = aimbotEnabled and 0.1 or 0.3
    end)

    espToggle.MouseEnter:Connect(function()
        espToggle.BackgroundColor3 = espEnabled and COLORS.Accent or COLORS.Text
        espToggle.BackgroundTransparency = espEnabled and 0.1 or 0.2
    end)
    espToggle.MouseLeave:Connect(function()
        espToggle.BackgroundColor3 = espEnabled and COLORS.Accent or COLORS.AccentDark
        espToggle.BackgroundTransparency = espEnabled and 0.1 or 0.3
    end)

    print("PremiumHub активирован! Добро пожаловать.")
end

-- ==========================================
--  ЗАПУСК: ВСЕГДА ПОКАЗЫВАЕМ ОКНО ВВОДА КЛЮЧА
--  (принудительная проверка при каждом запуске)
-- ==========================================
createKeyWindow()
