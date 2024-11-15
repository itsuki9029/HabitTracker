import { Application } from "@hotwired/stimulus";
import HabitCheckboxController from "./habit_checkbox_controller";

const application = Application.start();
application.register("habit-checkbox", HabitCheckboxController);
