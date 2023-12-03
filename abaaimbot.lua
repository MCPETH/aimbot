toggle = Enum.KeyCode.Insert
bodyPart = "Head"
on = false
on2 = false
game:GetService("UserInputService").InputBegan:Connect(
    function(input)
        if input.KeyCode == Enum.KeyCode.Insert then
            if on then
                on = false
            else
                on = true
            end
        end
    end
)
game:GetService("Players").LocalPlayer:GetMouse().Button2Down:Connect(
    function()
        on2 = true
    end
)
game:GetService("Players").LocalPlayer:GetMouse().Button2Up:Connect(
    function()
        on2 = false
    end
)
while wait() do
    if on2 and on then
        lowest = math.huge
        for i, v in pairs(game:GetService("Players"):GetChildren()) do
            if
                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                    v.Character.HumanoidRootPart.Position).magnitude < lowest and
                    v ~= game:GetService("Players").LocalPlayer
             then
                lowest =
                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                    v.Character.HumanoidRootPart.Position).magnitude
                player = v
            end
        end
        workspace.CurrentCamera.CFrame =
            CFrame.new(workspace.CurrentCamera.CFrame.Position, player.Character[bodyPart].Position)
    end
end
