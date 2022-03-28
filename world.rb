class World
  def initialize(arr)
    @arr = arr
  end

  def print
    puts @arr.map { |x| x.join(' ').gsub("1","■").gsub("0"," ") }
  end

  def next_iteration
    width = @arr.length
    height = @arr[0].length
    next_arr = Array.new(width){Array.new(height)}
    for i in 0...width
      for j in 0...height
        alive = 0
        [-1, 0, 1].each do |k|
          [-1, 0, 1].each do |l|
            if i+k >= 0 && i+k < width && j+l >= 0 && j+l < height && !(k == 0 && l == 0)
              alive += 1 if @arr[i+k][j+l] == 1
            end
          end
        end
        next_arr[i][j] = judge(alive, @arr[i][j])
      end
    end
    @arr = next_arr.clone
  end

  def judge(alive, cur)
    if alive <= 1
      return 0
    elsif alive == 2
      return cur
    elsif alive == 3
      return 1
    else
      return 0
    end
  end
end
