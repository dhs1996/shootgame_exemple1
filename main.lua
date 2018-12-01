flux = require "lib/flux"
myfont = love.graphics.newFont("res/MSYH.TTC", 23)
love.graphics.setFont(myfont)
function love.load()
    test = {
        x = 400, --屏幕中央
        y = 300,
        speed = 5,
        w = false,
        s = false,
        a = false,
        d = false,
        direct = 'd',
        -- jump = false,
        image = love.graphics.newImage("res/ball.png"),
        show = true
    }

    bullet = {
        x = 0,
        y = 0,
        w = 2,
        h = 2,
        speed = 10,
        image = love.graphics.newImage("res/ball.png"),

    }

end

function creat()
    bullet.x = test.x
    bullet.y = test.y
    love.graphics.draw(bullet.image, bullet.x, bullet.y - 16, 0, 1, 1, bullet.w, bullet.h)
end

function love.draw()
    init()
end

function init()
    love.graphics.print('WSAD上下左右，J跳跃,-和+改变速度', 100, 100)
    love.graphics.print(('方块当前位置x:%d,y:%d,速度:%d'):format(test.x, test.y, test.speed), 100, 126)
    love.graphics.setColor(255, 255, 255, 255)
    if test.show == true then
        print('233')
        d()
    end

    --love.graphics.draw(test.image,test.x - 32,test.y - 32)
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.draw(bullet.image, bullet.x, bullet.y, 0, 1, 1, bullet.w, bullet.h)

end

function d()
    love.graphics.draw(test.image, test.x, test.y, 0, 1, 1, 32, 32)

end

function love.update(dt)
    flux.update(dt)
    if love.keyboard.isDown("w") then
        test.w = true
        test.direct = 'w'
    end
    if love.keyboard.isDown("s") then
        test.s = true
        test.direct = 's'
    end
    if love.keyboard.isDown("a") then
        test.a = true
        test.direct = 'a'
    end
    if love.keyboard.isDown("d") then
        test.d = true
        test.direct = 'd'
    end
    if love.keyboard.isDown("=") then
        test.speed = test.speed + 1
    end
    if love.keyboard.isDown("-") then
        test.speed = test.speed - 1
    end

    move()
    bulletmove()
end
function bulletmove()
    bullet.x = bullet.x + bullet.speed
end
function move()
    if (not test.w) and (not test.s) and (not test.a) and (not test.d) then
        return
    end
    if test.w then
        test.y = test.y - test.speed
    end
    if test.s then
        test.y = test.y + test.speed
    end
    if test.a then
        test.x = test.x - test.speed
    end
    if test.d then
        test.x = test.x + test.speed
    end
end
function love.keyreleased(key)
    if key == "j" then
        if not test.jump then
            flux.to(test, 0.3, { y = test.y - 100 })
            :onstart(
            function()
                test.jump = true
            end
            )
            :oncomplete(
            function()
                flux.to(test, 0.3, { y = test.y + 100 })
                :oncomplete(
                function()
                    test.jump = false
                end
                )
            end
            )
        end
        print('j')
    end
    if key == "k" then
        -- creat()
        test.show = false
        print('k')
    end

    if key == "w" then
        test.w = false
    end
    if key == "s" then
        test.s = false
    end
    if key == "a" then
        test.a = false
    end
    if key == "d" then
        test.d = false
    end
end

function bullet()


end


function a7(func)
    func()
end
function love.mousepressed(x, y, key) --回调函数释放鼠标按钮时触发。





end