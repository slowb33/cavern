local function drawWalls()

  -- This function, given a wall object, will draw the rocks for it
  local function singleWallRocks(wall)

    -- Draw rocks on the surface of all walls
    -- Make every wall have direction values to tell which sides need rocks
    local surface = sprites.environment.rockySurface
    local offY = surface:getHeight()
    if wall.up then
      for itr=0, (wall.width/128)-1 do
        love.graphics.draw(surface, wall.x + (itr * 128), wall.y - offY)
      end
    end
    if wall.down then
      for itr=0, (wall.width/128)-1 do
        love.graphics.draw(surface, wall.x + (itr * 128), wall.y + wall.height + offY, nil, nil, -1)
      end
    end
    if wall.right then
      for itr=0, (wall.height/128)-1 do
        love.graphics.draw(surface, wall.x + wall.width + offY, wall.y + (itr * 128), math.pi/2)
      end
    end
    if wall.left then
      for itr=0, (wall.height/128)-1 do
        love.graphics.draw(surface, wall.x - offY, wall.y + (itr * 128), math.pi/2, nil, -1)
      end
    end

  end

  -- Draw the ground
  love.graphics.setColor(63, 45, 29, 255)

  for i,w in ipairs(mapdata.walls) do
    singleWallRocks(w)
  end

  for i,b in ipairs(breakables) do
    singleWallRocks(b)
  end

  for i,w in ipairs(mapdata.walls) do

    -- Draw the full rectangle for each wall
    love.graphics.rectangle("fill", w.x, w.y, w.width, w.height)

    -- Note: this is done in a different for loop than the one above because
    -- the ground color needs to be drawn after all the surface rocks have been
    -- drawn. This is because some walls extend into the ground, so some walls
    -- are drawing rocky surfaces underground. These underground surfaces
    -- should not be seen, so these rectangle will cover those surfaces.

  end

  for i,b in ipairs(breakables) do

    -- Draw the full rectangle for each breakable (same as walls)
    love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)

  end
end

return drawWalls