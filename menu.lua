--menu file
local composer = require( "composer" )
 
local scene = composer.newScene()


local function gotoGame()
    composer.gotoScene( "game" )
end
 
local function gotoHiScore()
    composer.gotoScene( "hiscore" )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect( sceneGroup, "images/black-back3.jpeg", 800, 1400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

     

    local label = display.newImageRect( sceneGroup, "images/snl.png", 450, 500 )
    label.x = display.contentCenterX
    label.y = 100

    --ladder
    local ladder = display.newImageRect("images/ladder.png",250,250)
    ladder.x = 30
    ladder.y = 350
    
    --snake
    local snakeLogo = display.newImageRect("images/snake-art.png",250,250)
    snakeLogo.x = 300
    snakeLogo.y = 350
   
    

    local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 200, native.systemFont, 34 )
    playButton:setFillColor( 0.82, 0.86, 1 )
 
    local hiScoreButton = display.newText( sceneGroup, "Hi Scores", display.contentCenterX, 270, native.systemFont, 34 )
    hiScoreButton:setFillColor( 0.75, 0.78, 1 )

   local devCreds = display.newText("Built by Qilobyt",display.contentCenterX,440,native.systemFont,25)
   devCreds:setFillColor(0.6,1,0.7)
    

    playButton:addEventListener( "tap", gotoGame )
    hiScoreButton:addEventListener( "tap", gotoHiScore )
 
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------]]
 
return scene