require 'rails_helper'

RSpec.describe Habit, type: :model do
  let(:user) { create(:user) }

  it "は有効な属性を持つ場合に有効である" do
    habit = build(:habit, user: user)
    expect(habit).to be_valid
  end

  it "は habit_name がないと無効" do
    habit = build(:habit, habit_name: nil, user: user)
    expect(habit).to_not be_valid
  end

  it "は start_date がないと無効" do
    habit = build(:habit, start_date: nil, user: user)
    expect(habit).to_not be_valid
  end

  it "は end_date がないと無効" do
    habit = build(:habit, end_date: nil, user: user)
    expect(habit).to_not be_valid
  end
end
