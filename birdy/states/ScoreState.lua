ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score

    self.goldMedal = love.graphics.newImage('medal_gold.png')
    self.silverMedal = love.graphics.newImage('medal_silver.png')
    self.bronzeMedal = love.graphics.newImage('medal_bronze.png')
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 30, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 70, VIRTUAL_WIDTH, 'center')

    local receivedMedal = nil
    local medalType = nil
    if self.score >= 20 then
        receivedMedal = self.goldMedal
        medalType = 'gold'
    elseif self.score >= 10 then
        receivedMedal = self.silverMedal
        medalType = 'silver'
    elseif self.score >= 5 then
        receivedMedal = self.bronzeMedal
        medalType = 'bronze'
    end

    if receivedMedal ~= nil then
        love.graphics.printf('Congratulations! You received a ' .. medalType .. ' medal!', 0, 90, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(receivedMedal, VIRTUAL_WIDTH / 2 - receivedMedal:getWidth() / 2, 120)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
end
