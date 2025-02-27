defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @invalid_position {:error, "invalid position"}
  @invalid_direction {:error, "invalid direction"}
  @cardinal [:north, :south, :east, :west]
  @instructions MapSet.new(~w(L R A))

  @rot %{
    north: %{
      "L" => :west,
      "R" => :east
    },
    south: %{
      "L" => :east,
      "R" => :west
    },
    east: %{
      "L" => :north,
      "R" => :south
    },
    west: %{
      "L" => :south,
      "R" => :north
    }
  }

  def create(direction \\ :north, position \\ {0, 0})

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction, position)
      when is_atom(direction) and
             direction in @cardinal and
             is_tuple(position) and
             tuple_size(position) == 2 and
             is_integer(elem(position, 0)) and
             is_integer(elem(position, 1)) do
    %{
      dxn: direction,
      pos: position
    }
  end

  def create(direction, _position)
      when not is_atom(direction) or
             direction not in @cardinal do
    @invalid_direction
  end

  def create(_direction, position)
      when not is_tuple(position) or
             tuple_size(position) != 2 or
             not is_integer(elem(position, 0)) or
             not is_integer(elem(position, 1)) do
    @invalid_position
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    sequence = String.graphemes(instructions)

    if valid_sequence?(sequence) do
      do_simulate(robot, sequence)
    else
      {:error, "invalid instruction"}
    end
  end

  defp valid_sequence?(sequence) do
    Enum.reduce(
      sequence,
      true,
      fn x, acc ->
        acc and MapSet.member?(@instructions, x)
      end
    )
  end

  defp do_simulate(robot, []), do: robot

  defp do_simulate(robot, [head | rest]) do
    robot_new =
      case @rot[robot.dxn][head] do
        nil ->
          {x, y} = robot.pos

          case robot.dxn do
            :north -> create(robot.dxn, {x, y + 1})
            :east -> create(robot.dxn, {x + 1, y})
            :south -> create(robot.dxn, {x, y - 1})
            :west -> create(robot.dxn, {x - 1, y})
          end

        new_dxn ->
          create(new_dxn, robot.pos)
      end

    do_simulate(robot_new, rest)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    robot.dxn
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    robot.pos
  end
end
