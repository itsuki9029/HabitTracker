class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habits = Habit.all
  end
end
