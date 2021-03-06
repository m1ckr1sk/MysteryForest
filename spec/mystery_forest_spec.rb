require_relative '../src/mystery_forest'

describe 'mystery forest' do

  before(:each)  do
    locations = []
    locations << Location.new(Point.new(0, 0), Room.new("You are in the first room 0,0",[],[]))

    @room_list = RoomList.new(locations)
    @environment = Environment.new(@room_list)
  end

  it 'should ask for input from the user' do
    test_output = double("Output")
    test_input = double("Input")

    allow(test_output).to receive(:clear)
    allow(test_output).to receive(:send_output)
    allow(test_input).to receive(:get_input) {"quit"}
    expect(test_input).to receive(:get_input)
    game = MysteryForest.new(test_input, test_output,@environment)
    game.run
  end

  it 'should set the scene for the user' do
    introduction = "You are walking around a park, enjoying the sunlight speckling the trees resplendent in vibrant fall colours. You breathe in the earthy air and take in the soft ground beneath you and the surrounding leaves. After strolling around for a while you don't even notice as the colour creeps away from your surroundings. As you begin to register the lack of colour, you see that a heavy mist has settled in, obscuring your vision. Everything is covered in a dense, white mist. You walk around, trying to find the path back to the main visitor building, but you no longer recognise where you are."
    test_output = double("Output")
    test_input = double("Input")

    @environment.set_greeting(introduction)
    allow(test_output).to receive(:clear)
    allow(test_output).to receive(:send_output)
    allow(test_input).to receive(:get_input){"quit"}
    expect(test_output).to receive(:send_output).with(introduction)

    game = MysteryForest.new(test_input, test_output,@environment)
    game.run
  end

  it 'should output exit message on quit' do
    exit_message = "Thanks for playing!"
    test_output = double("Output")
    test_input = double("Input")

    allow(test_output).to receive(:clear)
    allow(test_output).to receive(:send_output)
    allow(test_input).to receive(:get_input){"quit"}
    expect(test_output).to receive(:send_output).with(exit_message)

    game = MysteryForest.new(test_input, test_output,@environment)
    game.run
  end

end
