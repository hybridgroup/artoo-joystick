BINDING_MAP = {
  :ps3 => {
    :button_map => {
      0 => :square,
      1 => :x,
      2 => :circle,
      3 => :triangle,
      4 => :l1,
      5 => :r1,
      6 => :l2,
      7 => :r2,
      8 => :select,
      9 => :start,
      10 => :left_joystick,
      11 => :right_joystick,
      12 => :home
    },
    :axis_map => {
      :j0_x => 0,
      :j0_y => 1,
      :j1_x => 2,
      :j1_y => 3
    }
  },
  :xbox360 => {
    :button_map => {
      0 => :a,
      1 => :b,
      2 => :x,
      3 => :y,
      4 => :lb,
      5 => :rb,
      6 => :back,
      7 => :start
    },
    :axis_map => {
      :j0_x => 0,
      :j0_y => 1,
      :j1_x => 3,
      :j1_y => 4
    }
  },
  :ouya => {
    :button_map => {
      0 => :o,
      1 => :u,
      2 => :y,
      3 => :a,
      4 => :l1,
      12 => :l2,
      5 => :r1,
      13 => :r2,
      8 => :dpad_up,
      9 => :dpad_down,
      10 => :dpad_left,
      11 => :dpad_right,
      6 => :left_joystick,
      7 => :right_joystick
    },
    :axis_map => {
      :j0_x => 3,
      :j0_y => 4,
      :j1_x => 0,
      :j1_y => 1
    }
  }
}
