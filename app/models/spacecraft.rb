class Spacecraft < ApplicationRecord
  validates :direction, inclusion: { in: ['N', 'S', 'E', 'W', 'Up', 'Down'] }

  def execute_commands(commands)
    commands.each do |command|
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      when 'l'
        rotate_left
      when 'r'
        rotate_right
      when 'u'
        rotate_up
      when 'd'
        rotate_down
      end
    end
  end

  def coordinates
    [x, y, z]
  end

  private

  def move_forward
    case direction
    when 'N'
      self.y += 1
    when 'S'
      self.y -= 1
    when 'E'
      self.x += 1
    when 'W'
      self.x -= 1
    when 'Up'
      self.z += 1
    when 'Down'
      self.z -= 1
    end
  end

  def move_backward
    case direction
    when 'N'
      self.y -= 1
    when 'S'
      self.y += 1
    when 'E'
      self.x -= 1
    when 'W'
      self.x += 1
    when 'Up'
      self.z -= 1
    when 'Down'
      self.z += 1
    end
  end

  def rotate_left
    self.direction = case direction
                     when 'N' then 'W'
                     when 'S' then 'E'
                     when 'E' then 'N'
                     when 'W' then 'S'
                     else direction
                     end
  end

  def rotate_right
    self.direction = case direction
                     when 'N' then 'E'
                     when 'S' then 'W'
                     when 'E' then 'S'
                     when 'W' then 'N'
                     else direction
                     end
  end

  def rotate_up
    self.direction = case direction
                     when 'N', 'S', 'E', 'W' then 'Up'
                     else direction
                     end
  end

  def rotate_down
    self.direction = case direction
                     when 'N', 'S', 'E', 'W' then 'Down'
                     else direction
                     end
  end
end
