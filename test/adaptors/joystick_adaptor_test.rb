require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/adaptors/joystick'
require 'ruby-sdl-ffi'

describe Artoo::Adaptors::Joystick do
  before do
    @adaptor = Artoo::Adaptors::Joystick.new
    @adaptor.stubs(:joystick).returns("joy")
  end

  it 'must #connect' do
    ::SDL.expects(:Init).with(::SDL::INIT_JOYSTICK)
    @adaptor.expects(:num_joysticks).returns(1)
    ::SDL.expects(:JoystickOpen).with(0)

    @adaptor.connect
  end

  it 'must #disconnect' do
    ::SDL.expects(:JoystickClose).with("joy")

    @adaptor.disconnect
  end

  describe "device info interface" do
    it "#firmware_name" do
      ::SDL.expects(:JoystickName).with(0).returns("somuchjoy")
      @adaptor.firmware_name.must_equal "somuchjoy"
    end

    it "#version" do
      @adaptor.version.must_equal Artoo::Joystick::VERSION
    end
  end

  describe "SDL interface" do
    it "#poll" do
      ::SDL.expects(:JoystickUpdate)
      @adaptor.poll
    end

    it "#num_joysticks" do
      ::SDL.expects(:NumJoysticks).returns(1)
      @adaptor.num_joysticks.must_equal 1
    end

    it "#num_axes" do
      ::SDL.expects(:JoystickNumAxes).with("joy").returns(2)
      @adaptor.num_axes.must_equal 2
    end

    it "#axis" do
      ::SDL.expects(:JoystickGetAxis).with("joy", 0).returns(101)
      @adaptor.axis(0).must_equal 101
    end

    it "#num_balls" do
      ::SDL.expects(:JoystickNumBalls).with("joy").returns(2)
      @adaptor.num_balls.must_equal 2
    end

    it "#ball" do
      ::SDL.expects(:JoystickGetBall).with("joy", 0).returns(102)
      @adaptor.ball(0).must_equal 102
    end

    it "#num_hats" do
      ::SDL.expects(:JoystickNumHats).with("joy").returns(3)
      @adaptor.num_hats.must_equal 3
    end

    it "#hat" do
      ::SDL.expects(:JoystickGetHat).with("joy", 0).returns(103)
      @adaptor.hat(0).must_equal 103
    end

    it "#num_buttons" do
      ::SDL.expects(:JoystickNumButtons).with("joy").returns(5)
      @adaptor.num_buttons.must_equal 5
    end

    it "#button" do
      ::SDL.expects(:JoystickGetButton).with("joy", 0).returns(true)
      @adaptor.button(0).must_equal true
    end
  end
end
