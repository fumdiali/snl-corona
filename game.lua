local composer = require( "composer" )
 
local scene = composer.newScene()

local physics = require("physics")
physics.start()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    lifeCount = 3
    score = 0
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect("images/black-back3.jpeg",1050,980)

    local backgroundMusic = audio.loadStream("game-music.wav")
    audio.play( backgroundMusic,{ loops=2, fadein=2000 } )

   local playerLives = display.newText("Lives: "..lifeCount,display.contentCenterX,440,native.systemFont,18)
   playerLives:setFillColor(0.6,1,0.7)
   playerLives.x = 260
   playerLives.y = 2

   local playerScore = display.newText("Score: "..score,display.contentCenterX,440,native.systemFont,18)
   playerScore:setFillColor(0.6,1,0.7)
   playerScore.x = 60
   playerScore.y = 1
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase

    
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        
        local platform1 = display.newImageRect("images/grass-plat.png",1050,30)
        platform1.x = 0
        platform1.y = 45
        physics.addBody(platform1,"static")

        local ladder1 = display.newImageRect("images/ladder.png",80,120)
        ladder1.x = 80
        ladder1.y = 99

        local platform2 = display.newImageRect("images/grass-plat.png",1050,30)
        platform2.x = 0
        platform2.y = 155

        local ladder2 = display.newImageRect("images/ladder.png",80,120)
        ladder2.x = 40
        ladder2.y = 190

        local ladder3 = display.newImageRect("images/ladder.png",80,120)
        ladder3.x = 250
        ladder3.y = 193

        local platform3 = display.newImageRect("images/grass-plat.png",1050,30)
        platform3.x = 0
        platform3.y = 255

        local rope = display.newImageRect("images/rope.png",10,190)
        rope.x = 160
        rope.y = 300


        local platform4 = display.newImageRect("images/grass-plat.png",1050,20)
        platform4.x = 0
        platform4.y = 355
        physics.addBody(platform4,"static")

        local snake3 = display.newImageRect("images/snake3.png",70,70)
        snake3.x = 300
        snake3.y = 117
        physics.addBody(snake3,"static")
        
        transition.to( snake3, { x=200, delay=3000,iterations=0,time=9000 } )

        local snake2 = display.newImageRect("images/snake2.png",70,70)
        snake2.x = 110
        snake2.y = 220
        physics.addBody(snake2,"static")
        if snake2.x < 200 then
          transition.to( snake2, { x=200, time=2000,iterations=0 } )
        elseif snake2.x >= 200 then
          transition.moveTo( snake2, { x=110,time=2000 } )  
        end

        local snake1 = display.newImageRect("images/snake1.png",70,70)
        snake1.x = 210
        snake1.y = 320
        physics.addBody(snake1,"static")
        
        transition.to( snake1, { x=30, iterations=0,time=2000 } )

        local diamond1 = display.newImageRect("images/diamond.png",50,50)
        diamond1.x = 290
        diamond1.y = 320
        physics.addBody(diamond1,"static")
        local diamond2 = display.newImageRect("images/dia1.png",50,50)
        diamond2.x = 290
        diamond2.y = 320
        physics.addBody(diamond2,"static")
        transition.fadeIn( diamond1, { time=6000 } )
        transition.fadeOut( diamond2, { time=5000 } )

        local player = display.newImageRect("images/flurb.png",40,40)
        player.x = 20
        player.y = 21
        physics.addBody(player,"static")

        --player navigation controls
        local upButton = display.newText( "UP", 160, 410, native.systemFont, 16 )
        upButton:setFillColor( 1, 0, 0 )
        local rightButton = display.newText( "RIGHT", 190, 440, native.systemFont, 16 )
        rightButton:setFillColor( 1, 0, 0 )
         local downButton = display.newText( "DOWN", 160, 470, native.systemFont, 16 )
         downButton:setFillColor( 1, 0, 0 )
         local leftButton = display.newText( "LEFT", 130, 440, native.systemFont, 16 )
         leftButton:setFillColor( 1, 0, 0 )

        --move our player
        local function tapListener( event )
       -- Code executed when the button is tapped
         if event.target == rightButton then
           player.x = player.x + 3
         elseif event.target == leftButton then
           player.x = player.x - 3 
         elseif event.target == downButton then
           player.y = player.y + 3
         elseif event.target == upButton then
          player.y = player.y - 3     
         end  
           return true
        end
        rightButton:addEventListener( "tap", tapListener )
        leftButton:addEventListener( "tap", tapListener )
        upButton:addEventListener( "tap", tapListener )
        downButton:addEventListener( "tap", tapListener )

        --[[move the player on pressed button
        local buttonPressed = false

        local function movePlayer(event)
          if buttonPressed == rightButton then
            player.x = player.x + 1
          elseif  buttonPressed == downButton then
            player.y = player.y + 1
          elseif buttonPressed == leftButton then
            player.x = player.x - 1
          elseif buttonPressed == upButton then
            player.y = player.y - 1
          end      
        end --end of move player func

        Runtime:addEventListener( "tap", movePlayer )

        local function buttonPressed(event)
          if event.phase == "began" then
            movePlayer(buttonPressed)
          elseif event.phase == "ended" then
            buttonPressed = false 
          end   
        end
        return true --]]

    end
end --end of show scene func
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene