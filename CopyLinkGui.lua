-- CopyLinkGui.lua
-- A simple GUI that lets users copy or open your YouTube channel link.

-- Replace this with your YouTube channel URL
local CHANNEL_URL = "https://www.youtube.com/@Minh.Snipes"

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local OpenButton = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")

ScreenGui.Name = "CopyLinkGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Copy Link for Script"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = Frame

TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 50)
TextBox.Text = CHANNEL_URL
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

CopyButton.Size = UDim2.new(0.5, -15, 0, 30)
CopyButton.Position = UDim2.new(0, 10, 0, 100)
CopyButton.Text = "Copy Link"
CopyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
CopyButton.TextColor3 = Color3.new(1, 1, 1)
CopyButton.Parent = Frame

OpenButton.Size = UDim2.new(0.5, -15, 0, 30)
OpenButton.Position = UDim2.new(0.5, 5, 0, 100)
OpenButton.Text = "Open Link"
OpenButton.BackgroundColor3 = Color3.fromRGB(100, 149, 237)
OpenButton.TextColor3 = Color3.new(1, 1, 1)
OpenButton.Parent = Frame

-- Functionality
CopyButton.MouseButton1Click:Connect(function()
	local success, err = pcall(function()
		setclipboard(CHANNEL_URL)
	end)
	if success then
		CopyButton.Text = "Copied!"
	else
		CopyButton.Text = "Failed!"
	end
	task.wait(1)
	CopyButton.Text = "Copy Link"
end)

OpenButton.MouseButton1Click:Connect(function()
	local success, err = pcall(function()
		game:GetService("GuiService"):OpenBrowserWindow(CHANNEL_URL)
	end)
	if not success then
		print("Could not open browser: " .. tostring(err))
	end
end)

print("CopyLinkGui loaded successfully!")
